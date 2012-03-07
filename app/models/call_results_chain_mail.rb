class CallResultsChainMail < ActiveRecord::Base
  belongs_to :call_result
  belongs_to :chain_mail
  has_many :delayed_jobs, :class_name => '::Delayed::Job', :foreign_key => :queue, :primary_key => :queue, :order => "created_at DESC"

  scope :active, lambda{ where(:active => true) }
  scope :with_call_result, lambda{|cr| where(:call_result_id => cr.to_i)}

  after_create :create_delayed_emails

  private

  def create_delayed_emails
    chain_mail.chain_mail_items.each do |cmi|
      TemplateMailer.new("aossowski@gmail.com", :blank_template, Country.get_country_from_locale,
                                    {:subject_content => cmi.subject,
                                     :body_content => cmi.body,
                                     :queue => queue,
                                     :run_at => cmi.run_at
                                    }).deliver!
    end
  end

  public

  def queue
    "call_result_#{call_result.id}_chain_mails"
  end

  def self.disable_all_for_call_result(call_result)
    with_call_result(call_result).update_all("active = FALSE")
  end

end
