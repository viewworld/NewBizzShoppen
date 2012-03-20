class NewsletterList < ActiveRecord::Base
  has_many :newsletter_sources
  belongs_to :creator, :polymorphic => true
  belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"

  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :owner_email, :sourceable_items

  accepts_nested_attributes_for :newsletter_sources

  def newsletter_subscribers
    NewsletterSubscriber.joins(:newsletter_sources).where("newsletter_sources.id in (?)", newsletter_source_ids)
  end

  def custom_source
    newsletter_sources.detect { |source| source.custom_source? } || self.newsletter_sources.create(:source_type => NewsletterSource::CUSTOM_SOURCE)
  end

  def extract_sourceable_objects
    if sourceable_items and sourceable_items.is_a?(Array)
      sourceable_items.each do |source|
        if source.split("_").size > 1
          model, id = source.split("_")
          self.newsletter_sources << NewsletterSource.new(:sourceable => model.constantize.find(id))
        end
      end
    end
  end
end
