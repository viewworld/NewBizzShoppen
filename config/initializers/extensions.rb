class String

  #returns string formatted according to Postgresql date format if string contains value that can be parsed as date (using current locale)
  def to_postgresql_date
    unless self.strip.empty?
      begin
        Date.strptime(self, I18n.t("date.formats.default")).strftime("%Y-%m-%d")
      rescue
        Date.parse(self).strftime("%Y-%m-%d")
      end
    else
      self
    end
  end

  def extract_youtube_video_id
    self.scan(/(v=|embed\/)([a-zA-Z0-9\-_]+)/).flatten.last
  end

  def truncate_words(length = 30, end_string = '...')
    words = self.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  def truncate_letters(length = 100, end_string = '...')
    self.length <= length ? self : self[0..length-1] + end_string
  end
end

class NilClass
  def to_postgresql_date
    self
  end
end

class Delayed::Backend::ActiveRecord::Job
  def human_name
    begin
      klass = YAML.load(handler).object.class
      klass.respond_to?(:human_name) ? klass.human_name : klass.name
    rescue
      "[invalid]"
    end
  end

  def status
    if last_error.nil? and attempts == 0
      :not_yet_processed
    elsif last_error.present?
      :error
    end
  end
end

class ActsAsTaggableOn::Tag < ActiveRecord::Base
  before_validation :downcase_name
  after_save :merge_if_tags_supplied
  include ScopedSearch::Model

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }

  attr_accessor :merge_with_tags, :merge_with_tag_names, :merge_with_cleanup
  attr_accessible :name, :merge_with_tags, :merge_with_tag_names, :merge_with_cleanup

  private

  def downcase_name
    self.name = name.to_s.strip.downcase
  end

  def merge_if_tags_supplied
    if ActiveRecord::ConnectionAdapters::Column.value_to_boolean(merge_with_tags) and
        merge_with_tag_names.is_a?(Array) and (tags = ActsAsTaggableOn::Tag.where("name in (?)", merge_with_tag_names)) and !tags.empty?
      merge_with_others!(tags, ActiveRecord::ConnectionAdapters::Column.value_to_boolean(merge_with_cleanup))
      self.merge_with_tag_names = nil
    end
  end

  public

  def self.find_or_create(tag_names)
    tag_names = tag_names.map{ |w| w.to_s.strip.downcase }
    existing_tags = ActsAsTaggableOn::Tag.where("name in (?)", tag_names)
    new_tags = (tag_names - existing_tags.map(&:name)).map{ |name| ActsAsTaggableOn::Tag.create(:name => name) }
    existing_tags + new_tags
  end

  def can_be_duplicated?(_name)
    !_name.to_s.strip.blank? and ActsAsTaggableOn::Tag.where(:name => _name).first.nil?
  end

  def duplicate!(_name)
    if can_be_duplicated?(_name)
      self.class.amoeba do
        propagate
        include_field :taggings
        clone :taggings
      end

      tag_copy = self.amoeba_dup
      tag_copy.name = _name
      tag_copy.save

      tag_copy
    else
      false
    end
  end

  def can_be_merged?(tags)
    !tags.select{ |t| t.id != self.id }.empty?
  end

  def merge_with_others!(tags, cleanup_tags=false)
    if can_be_merged?(tags)
      tags = tags.select{ |t| t.id != self.id }
      tags.each do |tag|
        tag.taggings.map do |tagging|
          tagging_copy = tagging.clone
          tagging_copy.tag_id = self.id
          tagging_copy.save
        end

        if cleanup_tags
          tags.each(&:destroy)
        end
      end
    else
      false
    end
  end
end

require "app_utils"
