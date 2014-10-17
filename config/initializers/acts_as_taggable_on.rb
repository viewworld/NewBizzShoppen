class ActsAsTaggableOn::Tag < ActiveRecord::Base
  before_validation :downcase_name
  after_save :merge_if_tags_supplied
  include ScopedSearch::Model

  scope :with_keyword, lambda { |q| where("lower(name) like ?", "%#{q.to_s.downcase}%") }

  attr_accessor :merge_with_tags, :merge_with_tag_names, :merge_with_cleanup
  attr_accessible :name, :merge_with_tags, :merge_with_tag_names, :merge_with_cleanup

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
          tagging_copy = tagging.dup
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
end
