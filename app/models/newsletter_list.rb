class NewsletterList < ActiveRecord::Base
  has_many :newsletter_sources, :dependent => :destroy
  belongs_to :creator, :polymorphic => true
  belongs_to :owner, :foreign_key => "owner_id", :class_name => "User"
  has_many :campaign_monitor_responses, :as => :resource

  after_save :cm_synchronize!, :unless => Proc.new{|nl| nl.cm_list_id_changed?}
  before_save :extract_sourceable_objects, :extract_tag_groups  
  
  validates_presence_of :name
  validates_uniqueness_of :name
  validate :owner_is_present_and_valid

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }
  scope :with_archived, lambda{ |q| where("is_archived = ?", q.to_i == 1) }
  scope :without_archived, where("is_archived is FALSE")
  scope :created_by, lambda { |creator| where(:creator_id => creator.id) }

  attr_accessor :sourceable_items, :tag_group_items

  include ScopedSearch::Model

  accepts_nested_attributes_for :newsletter_sources, :allow_destroy => true
  
  private

  def owner_is_present_and_valid
    if owner.nil?
      errors.add(:owner_email, :blank)
    elsif owner and !owner.has_any_role?(:admin, :call_centre, :supplier, :category_supplier)
      errors.add(:owner_email, :invalid)
    end
    true
  end

  def cm_create!
    list_id = CreateSend::List.create(owner.with_role.cm_client, name, "", false, "")
    reload; update_attribute(:cm_list_id, list_id)
    list_id
  end

  def cm_update!
    CreateSend::List.new(cm_list_id).update(name, "", false, "")
    cm_list_id
  end

  def cm_synchronize!
    begin
      cm_list_id.present? ? cm_update! : cm_create!
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  public

  def cm_list
    cm_list_id || cm_synchronize!
  end

  def newsletter_subscribers
    NewsletterSubscriber.joins(:newsletter_sources).where("newsletter_sources.id in (?)", newsletter_source_ids)
  end

  def custom_source
    newsletter_sources.detect { |source| source.custom_source? } || self.newsletter_sources.create(:source_type => NewsletterSource::CUSTOM_SOURCE)
  end

  def extract_sourceable_objects
    if sourceable_items and sourceable_items.is_a?(Array) and valid?
      sourceable_items.each do |source|
        if source.split("_").size > 1
          model, id = source.split("_")
          self.newsletter_sources << NewsletterSource.new(:sourceable => model.constantize.find(id))
        end
      end
      self.sourceable_items = nil
    end
  end

  def extract_tag_groups
    if tag_group_items and tag_group_items.is_a?(Array) and valid?
      tag_group_tags = {}
      tag_group_items.each do |item|
        if item.split(":").size > 1
          tag_id, tag_group_id = item.split(":")
          tag_group_tags[tag_group_id] ||= []
          tag_group_tags[tag_group_id] << tag_id unless tag_id == "null"
        end
      end

      tag_groups = []

      tag_group_tags.each_pair do |tag_group_id, tag_ids|
        if tag_group_id =~ /new\d+/ and !tag_ids.empty?
          tg = TagGroup.new
          tg.tag_list = ActsAsTaggableOn::Tag.where(:id => tag_ids).map(&:name)
        else
          tags = ActsAsTaggableOn::Tag.where(:id => tag_ids)
          tg = TagGroup.find(tag_group_id)
          if tag_ids.empty?
            tg.tag_list = []
          else
            (tg.tags - tags).each do |tag|
              tg.tags.delete(tag)
            end
            tags.each do |tag|
              tg.tag_list << tag.name unless tg.tag_list.include?(tag.name)
            end
          end
        end

        tag_groups << tg
      end

      tag_groups.each do |tag_group|
        tag_group.match_all = tag_group.tag_list.size > 1

        if tag_group.new_record?
          tag_group.save
          self.newsletter_sources << NewsletterSource.new(:sourceable => tag_group)
        else
          tag_group.save
        end
      end

      self.tag_group_items = nil
    end
  end

  def owner_email
    owner ? owner.email : nil
  end

  def owner_email=(new_email)
    self.owner = User.where(:email => new_email).first
  end

  def archive_or_retrieve!
    update_attribute(:is_archived, !is_archived?)
  end
end
