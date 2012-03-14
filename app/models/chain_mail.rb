class ChainMail < ActiveRecord::Base
  serialize :execution_conditions

  belongs_to :chain_mailable, :polymorphic => true
  belongs_to :chain_mail_type
  has_many :chain_mail_items, :through => :chain_mail_type
  has_many :delayed_jobs, :class_name => '::Delayed::Job', :foreign_key => :queue, :primary_key => :queue, :dependent => :destroy

  include EmailTemplateEditor

  validates_presence_of :email, :chain_mailable, :chain_mail_type

  before_create do
    self.execution_conditions = self.chain_mail_type.execution_conditions
  end

  after_create do
    self.start_sending
  end

  def start_sending
    chain_mail_items.each do |cmi|
      ChainMailer.new(email, self, Country.get_country_from_locale,
                                    {:subject_content => cmi.subject,
                                     :body_content => StringUtils.replace_urls_for_chain_mail_verification(self, cmi.body),
                                     :queue => queue,
                                     :run_at => cmi.run_at,
                                     :position => cmi.position},
                                    assets_to_path_names(chain_mail_type.materials)).deliver!
    end
  end

  def register_click!
    update_attribute(:last_link_clicked_at, Time.now)
  end

  def email_sent!(options={})
    update_attributes(:last_mail_sent_at => Time.now, :last_mail_position => options[:position])
  end

  def logged_in_since_last_mail?
    last_mail_sent_at.present? and last_login_at.present? and last_login_at > last_mail_sent_at
  end

  def clicked_link_since_last_mail?
    last_mail_sent_at.present? and last_link_clicked_at.present? and last_link_clicked_at > last_mail_sent_at
  end

  def condition_met?(condition)
    case condition
      when ChainMailType::LOGGED_IN then logged_in_since_last_mail?
      when ChainMailType::LINK_CLICKED then clicked_link_since_last_mail?
    end
  end

  def operator
    case execution_conditions["operator"]
      when ChainMailType::OR then "or"
      when ChainMailType::AND then "and"
    end
  end

  def conditions_met?
    eval(execution_conditions["conditions"].map{|ec| condition_met?(ec)}.join(" #{operator} "))
  end

  def keep_sending?
    if last_mail_sent_at.nil?
      true
    else
      case execution_conditions["type"]
        when ChainMailType::STOP_IF then !conditions_met?
        when ChainMailType::SEND_IF then conditions_met?
      end
    end
  end

  def queue
    "chain_mail_#{id}"
  end

end