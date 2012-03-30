class NewsletterSynch < ActiveRecord::Base

  attr_accessor :use_delay_job

  validates_presence_of :newsletter_list_id

  has_many :campaign_monitor_responses, :as => :resource
  belongs_to :newsletter_list

  after_create do
    if use_delay_job
      self.delay(:queue => 'campaign_monitor_synchronization').send(:process!)
    else
      self.send(:process!)
    end
  end

  private

  # -------------------------------------------------------------------------------------------------------------------
  # Local subscribers
  # -------------------------------------------------------------------------------------------------------------------

  def all_local_subscribers
    @all_local_subscribers ||= newsletter_list.fetch_all_subscribable_objects.map do |obj|
      {
          "EmailAddress" => obj.send(obj.newsletter_config[:email_field]),
          "Name" => obj.send(obj.newsletter_config[:name_field])
      }
    end
  end

  def all_local_subscriber_emails
    @all_local_subscriber_emails ||= all_local_subscribers.map do |hash|
      hash["EmailAddress"]
    end
  end

  def locally_deleted_subscribers
    @locally_deleted_subscribers ||= all_cm_subscribers.select do |hash|
      !all_local_subscriber_emails.include?(hash["EmailAddress"])
    end
  end

  # -------------------------------------------------------------------------------------------------------------------
  # Remote subscribers
  # -------------------------------------------------------------------------------------------------------------------

  def all_cm_subscribers
    unless @all_cm_subscribers
      @all_cm_subscribers, page, per_page, next_page = [], 1, 1000, true
      while next_page
        subscribers = CreateSend::List.new(newsletter_list.cm_list_id).
            active(newsletter_list.created_at.strftime("%Y-%m-%d"), page, per_page)
        @all_cm_subscribers += subscribers.Results.map(&:to_hash)
        next_page = false if subscribers.RecordsOnThisPage < per_page
        page += 1
      end
    end
    @all_cm_subscribers
  end

  # -------------------------------------------------------------------------------------------------------------------
  # Synchronization
  # -------------------------------------------------------------------------------------------------------------------

  def process_locally_deleted_subscriber(subscriber)
    begin
      CreateSend::Subscriber.new(newsletter_list.cm_list_id, subscriber["EmailAddress"]).delete
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def process_locally_deleted_subscribers
    locally_deleted_subscribers.each do |deleted_subscriber|
      process_locally_deleted_subscriber(deleted_subscriber)
    end
  end

  def export_subscribers(subscribers)
    begin
      CreateSend::Subscriber.import(newsletter_list.cm_list_id, subscribers, false)
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def export_all_local_subscribers
    export_subscribers(all_local_subscribers)
  end

  def process!
    process_locally_deleted_subscribers
    export_all_local_subscribers
    touch
  end

  public

  def self.process!
    NewsletterList.all.each do |newsletter_list|
      newsletter_list.newsletter_synches.create!
    end
  end

end