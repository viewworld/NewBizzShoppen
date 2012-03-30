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

  def truncate_words(length = 30, end_string = ' …')
    words = self.split()
    words[0..(length-1)].join(' ') + (words.length > length ? end_string : '')
  end

  def truncate_letters(length = 100, end_string = ' …')
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
    klass = YAML.load(handler).object.class
    klass.respond_to?(:human_name) ? klass.human_name : klass.name
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

  private

  def downcase_name
    self.name = name.to_s.downcase
  end

  public

  def self.find_or_create(tag_names)
    existing_tags = ActsAsTaggableOn::Tag.where("name in (?)", tag_names.map{ |w| w.to_s.strip.downcase })
    new_tags = (tag_names - existing_tags.map(&:name)).map{ |name| ActsAsTaggableOn::Tag.create(:name => name) }
    existing_tags + new_tags
  end
end

require "app_utils"
