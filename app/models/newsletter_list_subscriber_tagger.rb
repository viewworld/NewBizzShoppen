class NewsletterListSubscriberTagger
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  TYPES = %w(add remove)

  validates :current_user, :newsletter_list, :tags, :presence => true
  validates :type, :inclusion => {:in => TYPES}

  attr_accessor :current_user, :newsletter_list, :tags, :type
  attr_reader :array_of_tags
  delegate :newsletter_list_subscribers, :to => :newsletter_list
  private :current_user, :newsletter_list, :tags, :type, :array_of_tags, :newsletter_list_subscribers

  def initialize(*args)
    options = args.extract_options!
    @current_user = options[:current_user]
    @newsletter_list = options[:newsletter_list]
    @tags = options[:tags]
    @type = options[:type]
  end

  def save
    if valid?
      delay(:queue => current_user.queue).process_tags_and_notify_by_email!
      true
    else
      false
    end
  end

  def persisted?
    false
  end

  private

  def process_tags_and_notify_by_email!
    process_tags!
    notify_by_email!
  end

  def process_tags!
    newsletter_list_subscribers.each { |newsletter_list_subscriber| process_subscriber(newsletter_list_subscriber.subscriber) }
  end

  def process_subscriber(subscriber)
    subscriber = subscriber.kind_of?(User) ? subscriber.with_role : subscriber
    subscriber.tag_list.send(type, array_of_tags)
    subscriber.save(false)
  end

  def array_of_tags
    @array_of_tags ||= tags.split(',').map do |tag|
      processed_tag = tag.strip.squeeze(' ')
      processed_tag.blank? ? nil : processed_tag
    end.uniq.compact
  end

  def notify_by_email!
    TemplateMailer.new(current_user.email,
                       :newsletter_subscriber_sources_tagging,
                       Country.get_country_from_locale,
                       {:user => current_user, :tags => tags}).deliver!
  end
end
