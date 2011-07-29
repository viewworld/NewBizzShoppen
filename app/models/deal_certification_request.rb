class DealCertificationRequest < ActiveRecord::Base
  belongs_to :deal

  STATE_SENT = 0
  STATE_SENT_REMINDER = 1
  STATE_SENT_SECOND_REMINDER = 2
  STATE_APPROVED = 3
  STATE_REJECTED = 4
  STATE_TIMED_OUT = 5
  STATE_RECERTIFICATED = 6

  STATES_THAT_COULD_BE_RECERTIFICATED = [STATE_SENT, STATE_SENT_REMINDER, STATE_SENT_SECOND_REMINDER, STATE_TIMED_OUT]

  after_create :process

  scope :active, where("state <= ?", STATE_SENT_SECOND_REMINDER)
  scope :for_email, lambda {|email| where(:email => email) }

  liquid :new_sales_manager_account_url, :contact_name, :contact_email

  private

  def process
    self.last_email_sent_at = Time.now
    self.state = STATE_SENT
    self.email = contact_email
    self.save!
    ApplicationMailer.delay.email_template(contact_email, EmailTemplate.find_by_uniq_id("deal_certification_request"), {:deal_certification_request => self})
  end

  public

  def contact_name
    deal.contact_name
  end

  def contact_email
    deal.email_address
  end

  def mailer_host
    Nbs::Application.config.action_mailer.default_url_options[:host]
  end

  def new_sales_manager_account_url
    "https://#{mailer_host}/buyer_accounts/new"
  end


  def change_state(message)
    self.update_attribute(:state, message == "agreed" ? STATE_APPROVED : STATE_REJECTED)
  end

  def current_status
    I18n.t("leads.certification.status_#{state}")
  end

  def approved?
    state == STATE_APPROVED
  end

  def active?
    state <= STATE_SENT_SECOND_REMINDER
  end

end
