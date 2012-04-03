class NewsletterSource < ActiveRecord::Base
  belongs_to :newsletter_list
  belongs_to :sourceable, :polymorphic => true
  before_save :assign_source_type
  before_save :assign_custom_source_class

  has_many :newsletter_subscribers

  CAMPAIGN_SOURCE          = 0.freeze
  LEAD_CATEGORY_SOURCE     = 1.freeze
  USER_ROLE_SOURCE         = 2.freeze
  SUBSCRIPTION_TYPE_SOURCE = 3.freeze
  TAG_SOURCE               = 4.freeze
  CUSTOM_SOURCE            = 5.freeze

  SOURCE_TYPES = [CAMPAIGN_SOURCE, LEAD_CATEGORY_SOURCE, USER_ROLE_SOURCE, SUBSCRIPTION_TYPE_SOURCE, TAG_SOURCE, CUSTOM_SOURCE]

  scope :without_tags_and_custom, where("source_type NOT IN (?)", [TAG_SOURCE, CUSTOM_SOURCE])
  scope :with_tags, where("source_type = ?", TAG_SOURCE)

  def assign_custom_source_class
    self.sourceable_type = case sourceable.class.superclass
        when ActiveRecord::Base then sourceable.class.to_s
        else sourceable.class.superclass.to_s
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
        CUSTOM_SOURCE
      end
    end
  end
end
