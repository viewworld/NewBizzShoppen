class NewsletterSubscriber < ActiveRecord::Base
  has_and_belongs_to_many :newsletter_sources
  belongs_to :subscribable, :polymorphic => true
  has_many :campaign_monitor_responses, :as => :resource

  before_save :set_previous_email
  before_destroy :cm_delete_all_subscriptions!

  private

  def set_previous_email
    if new_record?
      self.previous_email = email
    elsif  is_synced? and email_changed?
      self.previous_email = email_was
      self.is_synced = false
    end
    true
  end

  def cm_delete!(newsletter_list)
    #begin
      CreateSend::Subscriber.new(newsletter_list.cm_list_id, email).delete
    #rescue
    #  self.campaign_monitor_responses.create(:response => e)
    #  false
    #end
  end

  def cm_get_subscriber(newsletter_list, email_address)
    begin
      CreateSend::Subscriber.get(newsletter_list.cm_list_id, email_address)
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_synchronize!(newsletter_list)
    begin
      if email != previous_email and cm_get_subscriber(newsletter_list, previous_email)
        CreateSend::Subscriber.new(newsletter_list.cm_list_id, previous_email).update(email, name, [], true)
        update_attribute(:is_synced, true)
      elsif cm_get_subscriber(newsletter_list, email)
        CreateSend::Subscriber.new(newsletter_list.cm_list_id, email).update(email, name, [], true)
      else
        CreateSend::Subscriber.add(newsletter_list.cm_list, email, name, [], true)
      end
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_delete_all_subscriptions!
    puts newsletter_sources.inspect
    newsletter_lists.each do |list|
      cm_delete!(list)
    end
  end

  public

  def newsletter_lists
    NewsletterList.
        joins(:newsletter_sources).
        joins("INNER JOIN \"newsletter_sources_newsletter_subscribers\" ON \"newsletter_sources_newsletter_subscribers\".\"newsletter_source_id\" = \"newsletter_sources\".\"id\"").
        where("\"newsletter_sources_newsletter_subscribers\".\"newsletter_subscriber_id\" = ?", id)
  end

  def assign_to_subscribable_sources!
      subscribable.reload
      subscribable.all_newsletter_sources.each do |source|
        source.newsletter_subscribers << self unless source.newsletter_subscribers.include?(self)
      end
  end

  def synchronize_in_lists!
    newsletter_lists.each do |newsletter_list|
      cm_synchronize!(newsletter_list)
    end
  end
end
