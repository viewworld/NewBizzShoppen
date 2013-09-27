class NewsletterList < ActiveRecord::Base
  has_many :newsletter_sources, :dependent => :destroy
  has_many :campaign_monitor_responses, :as => :resource
  has_many :newsletter_synches
  has_many :newsletter_subscribers
  has_many :newsletter_list_subscribers
  has_many :newsletter_source_synches
  has_many :custom_sources, :class_name => "NewsletterSource", :conditions => {:source_type => NewsletterSource::CUSTOM_SOURCE}
  has_and_belongs_to_many :newsletter_campaigns

  after_save :cm_synchronize!, :unless => Proc.new{|nl| nl.cm_list_id_changed?}
  before_save :extract_sourceable_objects, :extract_tag_groups
  before_destroy :cm_delete!, :if => :cm_exists?
  after_create do
    self.synchronize!
  end

  after_save :check_if_owner_is_changed
  after_update :delete_if_archived

  attr_accessor :sourceable_items, :tag_group_items

  accepts_nested_attributes_for :newsletter_sources, :allow_destroy => true

  scope :not_archived, where(:is_archived => false)

  include CommonNewsletter

  private

  def cm_create!
    begin
      list_id = CreateSend::List.create(owner.with_role.cm_client, name, "", false, "")
      list = CreateSend::List.new(list_id)
      list.create_custom_field "Company Name", "Text"
      list.create_custom_field "Zip Code", "Text"
      list.create_custom_field "Login Key", "Text"
      update_attribute(:cm_list_id, list_id)
      list_id
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_update!
    begin
      CreateSend::List.new(cm_list_id).update(name, "", false, "")
      cm_list_id
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def cm_delete!
    begin
      CreateSend::List.new(cm_list_id).delete
      update_attribute(:cm_list_id, nil)
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
    end
  end

  def cm_synchronize!
    unless is_archived?
      cm_exists? ? cm_update! : cm_create!
    end
  end

  def cm_exists?
    begin
      CreateSend::List.new(cm_list_id).details.ListID == cm_list_id
    rescue Exception => e
      self.campaign_monitor_responses.create(:response => e)
      false
    end
  end

  def check_if_owner_is_changed
    if owner_id_changed? and !owner_id_was.nil? and !cm_list_id_changed?
      if cm_exists?
        cm_delete!
      end
      cm_synchronize!
      synchronize!
    end
  end

  def delete_if_archived
    if is_archived_changed? and is_archived?
      cm_delete! if cm_exists?
    end
  end

  public

  def last_synchronized_at
    if last_synch = newsletter_synches.order("updated_at DESC").first
      last_synch.updated_at
    else
      "never"
    end
  end

  def cm_list
    cm_exists? ? cm_list_id : cm_create!
  end

  def add_to_custom_sources!(sourceable_objects)
    sourceable_objects.each do |sourceable_object|
      newsletter_sources.create(:source_type => NewsletterSource::CUSTOM_SOURCE, :sourceable => sourceable_object)
    end
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

      all_groups = newsletter_sources.with_tags.map(&:sourceable)
      disposable_groups = all_groups - tag_groups
      newsletter_sources.with_tags.where(:sourceable_id => disposable_groups.map(&:id)).each(&:destroy)
      newsletter_sources.with_tags.select { |ns| ns.sourceable.tag_list.empty? }.each(&:destroy)

      self.tag_group_items = nil
    end
  end

  def to_s
    "#{name} (#{newsletter_list_subscribers.count})"
  end

  def synchronize!(*args)
    options = { :sources_synch => true, :campaign_monitor_synch => true, :use_delayed_job => true, :notificable => nil }.merge(args.extract_options!)
    if options[:sources_synch]
      newsletter_source_synches.create(:use_delayed_job => options[:use_delayed_job], :campaign_monitor_synch => options[:campaign_monitor_synch], :notificable => options[:notificable])
    elsif options[:campaign_monitor_synch]
      newsletter_synches.create(:use_delayed_job => options[:use_delayed_job], :notificable => options[:notificable])
    end
  end
end
