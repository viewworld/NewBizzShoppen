class NewsletterList < ActiveRecord::Base
  has_many :newsletter_sources
  belongs_to :creator, :polymorphic => true
  belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"

  after_save :cm_synchronize!
  
  validates_presence_of :name
  validates_uniqueness_of :name

  attr_accessor :owner_email, :sourceable_items

  accepts_nested_attributes_for :newsletter_sources
  
  private

  def cm_create!
    list_id = CreateSend::List.create(owner.cm_client, name, "", true, "")
    self.update_attribute(:cm_list_id, list_id)
  end

  def cm_update!
    CreateSend::List.new(cm_list_id).update(name, "", true, "")
  end

  public

  def cm_list?
    cm_list_id.present?
  end

  def cm_synchronize!
    begin
      cm_list? ? cm_update! : cm_create!
    rescue Exception => e
      CampaignMonitorResponse.create(:response => e)
      false
    end
  end

  def cm_synchronize_subscriber!(subscriber)

  end  
  
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
