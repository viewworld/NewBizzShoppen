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

  liquid :login_url, :contact_name, :contact_email

  private

  def process
    self.token = generate_token
    self.last_email_sent_at = Time.now
    self.state = STATE_SENT
    self.email = contact_email
    self.save!
    TemplateMailer.delay.new(contact_email, :deal_certification_request, Country.get_country_from_locale, {:deal_certification_request => self, :sender_id => nil})
  end

  def generate_token(size=40)
    charset = (0..9).to_a + ("a".."z").to_a + ("A".."Z").to_a
    (0...size).map { charset[rand(charset.size)] }.join+id.to_s
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

  def login_url
    "http://#{Nbs::Application.config.action_mailer.default_url_options[:host]}/deals/#{deal_id}/edit?token=#{token}"
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
