class ChainMail < ActiveRecord::Base
  serialize :execution_conditions

  belongs_to :chain_mailable, :polymorphic => true
  belongs_to :chain_mail_type
  has_many :chain_mail_items, :through => :chain_mail_type

  before_create do
    self.execution_conditions = self.chain_mail_type.execution_conditions
  end

  after_create do
    self.start_sending
  end

  before_destroy do
    self.stop_sending
  end

  def start_sending
    chain_mail_items.each do |cmi|
      TemplateMailer.new("aossowski@gmail.com", :blank_template, Country.get_country_from_locale,
                                    {:subject_content => cmi.subject,
                                     :body_content => StringUtils.replace_urls_for_chain_mail_verification(chain_mailable, cmi.body),
                                     :queue => chain_mailable.chain_mail_queue,
                                     :run_at => cmi.run_at
                                    }).deliver!
    end
  end

  def stop_sending
    ::Delayed::Job.where(:queue => chain_mailable.chain_mail_queue).destroy_all
  end


end