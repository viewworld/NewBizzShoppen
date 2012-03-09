class ChainMail < ActiveRecord::Base
  serialize :execution_conditions

  has_many :chain_mail_items, :dependent => :destroy, :order => "position ASC"
  has_many :call_results

  validates_presence_of :name, :first_execution_delay, :cycle_time, :execution_time
  validates_length_of :chain_mail_items, :execution_conditions, :minimum => 1
  validates_associated :chain_mail_items

  scope :active

  accepts_nested_attributes_for :chain_mail_items, :allow_destroy => true

  NOT_SIGNED_IN = 1
  NO_LINK_CLICKED = 2

  EXECUTION_CONDITIONS = [
      ['Recipient did not sign in', NOT_SIGNED_IN],
      ['Recipient did not clicked any link', NO_LINK_CLICKED]
  ]

  after_initialize do
    self.execution_conditions = [] if execution_conditions.nil?
  end

  before_validation do
    self.execution_conditions = execution_conditions.reject{|elem| elem.blank?}.map(&:to_i)
  end

  def start_sending(call_result)
    chain_mail_items.each do |cmi|
      TemplateMailer.new("aossowski@gmail.com", :blank_template, Country.get_country_from_locale,
                                    {:subject_content => cmi.subject,
                                     :body_content => cmi.body,
                                     :queue => call_result.chain_mail_queue,
                                     :run_at => cmi.run_at
                                    }).deliver!
    end
  end

  def self.stop_sending(call_result)
    ::Delayed::Job.where(:queue => call_result.chain_mail_queue).destroy_all
  end


end
