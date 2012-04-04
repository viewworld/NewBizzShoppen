class NewsletterCampaign < ActiveRecord::Base
  has_and_belongs_to_many :newsletter_lists
  has_many :campaign_monitor_responses, :as => :resource
  before_create :generate_template_key
  before_validation :set_name
  validates_presence_of :subject, :cm_username, :cm_password, :unless => Proc.new{|n| n.skip_validations}

  SAVED_AS_DRAFT = 0.freeze
  SENT_TO_CM = 1.freeze
  STATUSES = [SAVED_AS_DRAFT, SENT_TO_CM]

  include CommonNewsletter

  private

  def set_name
    self.name = "FDNL #{Time.now.strftime("%d-%m-%Y %H:%M:%S")}"
  end

  def generate_template_key
    self.template_key = Digest::SHA1.hexdigest("#{created_at} -- #{id} -- #{Time.now}") unless template_key
    template_key
  end

  def domain_name
    if Rails.env.staging?
      "beta.fairleads.com"
    elsif Rails.env.testing?
      "testing.fairleads.com"
    else
      "fairleads.com"
    end
  end

  def cm_create!
    begin
      cm_campaign_id = CreateSend::Campaign.create(name, owner.cm_client_id, subject, "Fairleads.com", "admin@fairleads.com",
                                            "admin@fairleads.com", link_to_template, link_to_template, newsletter_lists.map(&:cm_list_id), [])
      update_attribute(:cm_campaign_id, cm_campaign_id)
      list_id
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end


  public

  def link_to_template
    "http://#{domain_name}/newsletters/newsletter_campaigns/#{template_key}"
  end
end
