class DerbCustomTag
  require 'active_support'

  TAG_NAME_REGEX = /tag="[a-zA-Z0-9_-]*"/i
  ATTRS_REGEX = /attrs="[^"]*"/

  @@all_tags = {}
  @@regex = nil

  #========= Errors ===========

  class InvalidTagsSourceFile < StandardError;
  end
  class InvalidTagName < StandardError;
  end

  #==============================

  private

  class << self

    def process_tags_source(path)
      method_processing_buffer = Hash.new{|h, k| h[k] = []}

      File.open(path, "r") do |tags_source_file|
        while (source_line = tags_source_file.gets)
          if source_line.strip.starts_with? "<def"
            method_processing_buffer[:method_def] = source_line
          elsif !source_line.strip.starts_with? "</def"
            method_processing_buffer[:method_body].push source_line unless source_line.blank?
          else
            process_tag_definition(method_processing_buffer)
            method_processing_buffer.clear
          end
        end
      end

      #We do reject method body, as it may contain some blank lines at the end of file...
      raise InvalidTagsSourceFile, "Invalid tags source file (#{path}). " if !method_processing_buffer.reject{|k, v| k==:method_body}.blank?
    end

    def process_tag_definition(method_processing_buffer)
      tagname = method_processing_buffer[:method_def].match(TAG_NAME_REGEX).to_s.gsub(/(tag=|")/, '')
      raise InvalidTagName, "Tag name can only contain  letters, numbers, dashes and underscores! -> Your tag def: #{method_processing_buffer[:method_def]}" if tagname.blank?
      attributes = method_processing_buffer[:method_def].match(ATTRS_REGEX).to_s.gsub(/(attrs=|")/, '').split(',')
      @@all_tags.merge!(tagname => {:attrs => attributes, :tag_template => (method_processing_buffer[:method_body]*"\n")})
    end

  end

  public

  class << self

    def all
      @@all_tags.with_indifferent_access
    end

    def all_tag_names
      @@all_tags.keys
    end

    def regex
      @@regex ||= /(<\/?(#{@@all_tags.keys.join('|')})[^>]*>)/i
    end

    def initialize_all
        process_tags_source(File.join(Rails.root, 'app', 'tags', 'tags.derb'))
    end

  end

  initialize_all
end