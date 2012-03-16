class NewsletterSource < ActiveRecord::Base
  belongs_to :newsletter_list
  has_and_belongs_to_many :newsletter_subscribers
  belongs_to :sourceable, :polymorphic => true

  CAMPAIGN_SOURCE          = 0.freeze
  LEAD_CATEGORY_SOURCE     = 1.freeze
  USER_ROLE_SOURCE         = 2.freeze
  SUBSCRIPTION_TYPE_SOURCE = 3.freeze
  TAG_SOURCE               = 4.freeze
  CUSTOM_SOURCE            = 5.freeze

  SOURCE_TYPES = [CAMPAIGN_SOURCE, LEAD_CATEGORY_SOURCE, USER_ROLE_SOURCE, SUBSCRIPTION_TYPE_SOURCE, TAG_SOURCE, CUSTOM_SOURCE]

  def custom_source?
    source_type == CUSTOM_SOURCE
  end

  def fetch_all_subscribable_objects
    case source_type
      when CAMPAIGN_SOURCE
        sourceable.contacts
      when LEAD_CATEGORY_SOURCE
        sourceable.leads.including_subcategories
      when USER_ROLE_SOURCE
        sourceable.users
      when SUBSCRIPTION_TYPE_SOURCE
        sourceable.users
      when TAG_SOURCE
        sourceable.tagged_objects
      else #custom
        newsletter_subscribers.map(&:subscribable)
    end
  end

  def assign_existing_subscribable_objects!
    unless custom_source?
      fetch_all_subscribable_objects.each do |sob|
        sob = sob.with_role if sob.class.to_s == "User"
        sob.send(:update_newsletter_subscriber) if sob.newsletter_subscriber.nil? or !newsletter_subscribers.include?(sob.newsletter_subscriber)
      end
    end
  end
end
