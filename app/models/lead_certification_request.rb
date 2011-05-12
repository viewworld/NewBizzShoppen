class LeadCertificationRequest < ActiveRecord::Base
  belongs_to :lead

  STATE_SENT = 0
  STATE_APPROVED = 1
  STATE_REJECTED = 2

  after_create :process

  liquid :login_url, :contact_name, :contact_email

  private

  def process
    self.token = generate_token
    self.state = STATE_SENT
    self.save!
    ApplicationMailer.email_template(contact_email, EmailTemplate.find_by_uniq_id("certification_request"), {:lead_certification_request => self}).deliver
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
    "https://#{Nbs::Application.config.action_mailer.default_url_options[:host]}/leads/#{lead_id}/edit?token=#{token}"
  end

  def change_state(message)
    self.update_attribute(:state, message == "agreed" ? STATE_APPROVED : STATE_REJECTED)
  end

end
