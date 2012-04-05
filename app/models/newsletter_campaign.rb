class NewsletterCampaign < ActiveRecord::Base
  has_and_belongs_to_many :newsletter_lists
  has_many :campaign_monitor_responses, :as => :resource
  before_create :generate_template_key
  before_validation :set_name
  validates_presence_of :subject, :cm_username, :cm_password, :unless => Proc.new{|n| n.skip_validations}

  SAVED_AS_DRAFT = 0.freeze
  QUEUED_FOR_SENDING = 1.freeze
  SENT_TO_CM = 2.freeze
  STATUSES = [SAVED_AS_DRAFT, QUEUED_FOR_SENDING, SENT_TO_CM]

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

  def cm_exists?
    begin
      CreateSend::Campaign.new(cm_campaign_id).summary.Clicks >= 0
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_synchronize!
    if (cm_exists? or cm_create!) and !sent?
      self.delay(:queue => "campaign_monitor_synchronization").cm_send!
    end
  end

  def cm_create!
    begin
      cm_campaign_id = CreateSend::Campaign.create(owner.cm_client_id, subject, name, "Fairleads.com", "admin@fairleads.com",
                                            "admin@fairleads.com", link_to_template, link_to_template(true), newsletter_lists.map(&:cm_list_id), [])
      update_attribute(:cm_campaign_id, cm_campaign_id)
      update_attribute(:status, QUEUED_FOR_SENDING)
      cm_campaign_id
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_synchronize_lists!
    newsletter_lists.each do |newsletter_list|
      newsletter_list.newsletter_synches.create(:use_delay_job => false)
    end
  end

  def cm_send!
    begin
      cm_synchronize_lists!

      if Rails.env.development? or Rails.env.staging?
        CreateSend::Campaign.new(cm_campaign_id).send_preview("tomasz.noworyta@gmail.com") #fairleads@selleo.com
      else
        CreateSend::Campaign.new(cm_campaign_id).send(Settings.cm_confirmation_email)
      end
      update_attribute(:status, SENT_TO_CM)
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_delete!
    begin
      CreateSend::Campaign.new(cm_campaign_id).delete
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  public

  def link_to_template(text=false)
    if Rails.env.development?
      %{http://testing.fairleads.com/newsletters/newsletter_campaigns/d96a3191f232352082489e90647b15dcde55bc1e#{text ? "?txt=1" : ""}}
    else
      "http://#{domain_name}/newsletters/newsletter_campaigns/#{template_key}#{text ? "?txt=1" : ""}"
    end
  end

  def sent?
    status == SENT_TO_CM
  end

  def queued_for_sending?
    status == QUEUED_FOR_SENDING
  end

  def last_errors
    campaign_monitor_responses.where("created_at BETWEEN ? AND ?", Time.now-2.minutes, Time.now).select { |cr| !cr.response.include?("CreateSend::NotFound") }.map(&:response).join(", ")
  end
end
