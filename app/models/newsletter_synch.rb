class NewsletterSynch < ActiveRecord::Base

  attr_accessor :use_delayed_job, :notify_object

  validates_presence_of :newsletter_list_id

  has_many :campaign_monitor_responses, :as => :resource
  belongs_to :newsletter_list

  after_create do
    if use_delayed_job
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
    @all_local_subscribers ||= newsletter_list.newsletter_subscribers.map do |obj|
      {
          "EmailAddress" => obj.email_address,
          "Name" => obj.name,
          "CustomFields" => [
              { "Key" => "[CompanyName]", "Value" => obj.company_name, "Clear" => false},
              { "Key" => "[ZipCode]", "Value" => obj.zip_code, "Clear" => false}
          ]
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
      import_result = CreateSend::Subscriber.import(newsletter_list.cm_list_id, subscribers, false)
      self.campaign_monitor_responses.create(:response => import_result)
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def export_all_local_subscribers
    all_local_subscribers.in_groups_of(1000, false) do |subscriber_group|
      export_subscribers(subscriber_group)
    end
  end

  def notify!
    if notify_object.is_a? User
      notify_object.notify!(
          :title => I18n.t("notifications.newsletter_synchronization.synchronized.title", :list_name => newsletter_list.name),
          :text => I18n.t("notifications.newsletter_synchronization.synchronized.text", :url => "http://#{user_to_notify.domain_name}/newsletters/newsletter_lists/#{newsletter_list.id}/edit"))
    end
  end

  def process!
    if newsletter_list.cm_list
      process_locally_deleted_subscribers
      export_all_local_subscribers
      notify!
      touch
    else
      false
    end
  end

  public

  def self.process!
    NewsletterList.all.each do |newsletter_list|
      newsletter_list.newsletter_synches.create
    end
  end

end