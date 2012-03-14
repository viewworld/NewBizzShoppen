class NewsletterList < ActiveRecord::Base
  has_many :newsletter_sources
  belongs_to :creator, :polymorphic => true
  belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"

  def newsletter_subscribers
    NewsletterSubscriber.joins(:newsletter_sources).where("newsletter_sources.id in (?)", newsletter_source_ids)
  end

  def custom_source
    newsletter_sources.detect { |source| source.custom_source? } || self.newsletter_sources.create(:source_type => NewsletterSource::CUSTOM_SOURCE)
  end
end
