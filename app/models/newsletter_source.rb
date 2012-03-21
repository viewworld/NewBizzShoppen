class NewsletterSource < ActiveRecord::Base
  belongs_to :newsletter_list
  has_and_belongs_to_many :newsletter_subscribers
  belongs_to :sourceable, :polymorphic => true
  before_save :assign_source_type
  after_create :assign_existing_subscribable_objects

  CAMPAIGN_SOURCE          = 0.freeze
  LEAD_CATEGORY_SOURCE     = 1.freeze
  USER_ROLE_SOURCE         = 2.freeze
  SUBSCRIPTION_TYPE_SOURCE = 3.freeze
  TAG_SOURCE               = 4.freeze
  CUSTOM_SOURCE            = 5.freeze

  SOURCE_TYPES = [CAMPAIGN_SOURCE, LEAD_CATEGORY_SOURCE, USER_ROLE_SOURCE, SUBSCRIPTION_TYPE_SOURCE, TAG_SOURCE, CUSTOM_SOURCE]

  scope :without_tags_and_custom, where("source_type NOT IN (?)", [TAG_SOURCE, CUSTOM_SOURCE])
  scope :with_tags, where("source_type = ?", TAG_SOURCE)

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

  def assign_existing_subscribable_objects
    self.delay(:queue => "newsletter_objects_assign_existing").assign_existing_subscribable_objects!
  end

  def assign_existing_subscribable_objects!
    unless custom_source?
      fetch_all_subscribable_objects.each do |sob|
        sob = sob.with_role if sob.class.to_s == "User"
        sob.send(:update_newsletter_subscriber) if sob.newsletter_subscriber.nil? or !newsletter_subscribers.include?(sob.newsletter_subscriber)
      end
    end
  end

  def assign_source_type
    if source_type.nil? and sourceable
      self.source_type = if sourceable.is_a?(Campaign)
        CAMPAIGN_SOURCE
      elsif sourceable.is_a?(LeadCategory)
        LEAD_CATEGORY_SOURCE
      elsif sourceable.is_a?(Role)
        USER_ROLE_SOURCE
      elsif sourceable.is_a?(SubscriptionPlan)
        SUBSCRIPTION_TYPE_SOURCE
      elsif sourceable.is_a?(TagGroup)
        TAG_SOURCE
      else
        nil
      end
    end
  end
end
