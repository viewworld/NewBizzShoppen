class LeadCertificationRequest < ActiveRecord::Base
  belongs_to :lead

  STATE_SENT = 0
  STATE_SENT_REMINDER = 1
  STATE_SENT_SECOND_REMINDER = 2
  STATE_APPROVED = 3
  STATE_REJECTED = 4
  STATE_TIMED_OUT = 5
  STATE_RECERTIFICATED = 6

  STATES_THAT_COULD_BE_RECERTIFICATED = [STATE_SENT, STATE_SENT_REMINDER, STATE_SENT_SECOND_REMINDER, STATE_TIMED_OUT]

  after_create :process
  attr_accessor :do_not_send_email

  scope :active, where("state <= ?", STATE_SENT_SECOND_REMINDER)

  liquid :login_url, :contact_name, :contact_email

  private

  def process
    self.token = generate_token
    self.last_email_sent_at = Time.now
    self.state = STATE_SENT
    self.email = contact_email
    self.save!
    TemplateMailer.delay(:queue => 'emails').new(contact_email, :certification_request, Country.get_country_from_locale, {:lead_certification_request => self, :sender_id => nil}) unless do_not_send_email
  end

  def generate_token(size=40)
    charset = (0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a
    (0...size).map { charset[rand(charset.size)] }.join+id.to_s
  end

  public

  def contact_name
    lead.contact_name
  end

  def contact_email
    lead.email_address
  end

  def login_url
    "http://#{Nbs::Application.config.action_mailer.default_url_options[:host]}/leads/#{lead_id}/edit?token=#{token}"
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

  def update_state!
    if [STATE_SENT, STATE_SENT_REMINDER].include?(state) and last_email_sent_at.to_date+Settings.resend_certification_notification_after_days.to_i == Date.today
      self.state = state + 1
      self.last_email_sent_at = Time.now
      self.save
      TemplateMailer.delay(:queue => 'emails').new(contact_email, :certification_request_reminder, Country.get_country_from_locale, {:lead_certification_request => self, :sender_id => nil})
    elsif state == STATE_SENT_SECOND_REMINDER and last_email_sent_at.to_date+Settings.expire_certification_notification_after_days.to_i == Date.today
      expire!
    end
  end

  def expired?
    state == STATE_TIMED_OUT
  end

  def expire!
    unless expired?
      self.state = STATE_TIMED_OUT
      self.save
    end
  end

  def visited?
    !last_visit_date.blank?
  end

  def active?
    state <= STATE_SENT_SECOND_REMINDER
  end

end
