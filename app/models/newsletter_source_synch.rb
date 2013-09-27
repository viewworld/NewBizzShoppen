class NewsletterSourceSynch < ActiveRecord::Base
  include ::CommonNewsletterSynch

  attr_accessor :campaign_monitor_synch

  private

  def queue_name
    'sources_synchronization'
  end

  def common_attrs
    %w(subscriber_id subscriber_type newsletter_source_id).each(&:to_sym)
  end

  def basic_attrs
    %w(email_address contact_name company_name login_key).each(&:to_sym)
  end

  def contact_attrs
    @attrs ||= newsletter_list.newsletter_list_subscribers.new.attributes.keys.except(NewsletterListSubscriber::RESTRICTED_ATTRS).each(&:to_sym)
  end

  def params_to_copy(subscriber)
    params = {}
    if subscriber.subscriber_type == 'Contact'
      (common_attrs + contact_attrs).each do |attr|
        params[attr] = subscriber.subscriber.send(attr)
      end
    else
      (common_attrs + basic_attrs).each do |attr|
        params[attr] = subscriber.send(attr)
      end
    end
    params
  end

  def process!
    newsletter_list.newsletter_subscribers.each do |subscriber|
      newsletter_list.newsletter_list_subscribers.create(params_to_copy(subscriber))
    end
    newsletter_list.newsletter_synches.create(:use_delayed_job => use_delayed_job)
    touch
  end
end
