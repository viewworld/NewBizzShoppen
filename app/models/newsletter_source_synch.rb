class NewsletterSourceSynch < ActiveRecord::Base
  include ::CommonNewsletterSynch

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

  def params_to_copy(subscriber)
    params = {}
    if %w(Contact Lead Deal AbstractLead).include?(subscriber.subscriber_type)
      common_attrs.each do |attr|
        params[attr] = subscriber.send(attr)
      end
      params[:subscriber_type] = subscriber.subscriber.type if subscriber.subscriber_type == 'AbstractLead'
      NewsletterListSubscriber.selected_attributes.map(&:to_sym).each do |attr|
        params[attr] = subscriber.subscriber.send(attr)
      end
    else
      (common_attrs + basic_attrs).each do |attr|
        params[attr] = subscriber.send(attr)
      end
    end
    params
  end

  def params_to_update(subscriber)
    params = {}
    attrs = %w(Contact Lead Deal).include?(subscriber.class.to_s) ? NewsletterListSubscriber.selected_attributes : basic_attrs
    attrs.each do |attr|
      params[attr] = subscriber.send(attr)
    end
    params
  end

  def synchronize_with_sources!
    newsletter_list.newsletter_list_subscribers.from_sources.each do |list_subscriber|
      NewsletterListSubscriber.update_all(params_to_update(list_subscriber.subscriber), { :id => list_subscriber.id }) if list_subscriber.subscriber
    end
    newsletter_list.newsletter_subscribers.each do |subscriber|
      newsletter_list.newsletter_list_subscribers.create(params_to_copy(subscriber))
    end
  end

  def process!
    synchronize_with_sources!
    if campaign_monitor_synch
      newsletter_list.newsletter_synches.create(:use_delayed_job => false, :notificable => notificable)
    end
    touch
  end
end
