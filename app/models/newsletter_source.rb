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
end
