class NewsletterSubscriber < ActiveRecord::Base
  has_and_belongs_to_many :newsletter_sources
  has_many :newsletter_lists, :through => :newsletter_sources
  belongs_to :subscribable, :polymorphic => true
end
