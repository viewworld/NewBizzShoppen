require 'roo'

class Sheet
  ACCEPTED_FORMATS = %w{ods xls xlsx}
  EXT_ACCEPTED_FORMATS = ACCEPTED_FORMATS + ["csv"]
  attr_accessor :roo_instance

  def initialize(attachment, use_file_path = false)
    file_name = use_file_path ? attachment : Sheet.new_temp_file(attachment)
    extension = file_name.split(".").last
    self.roo_instance = case extension
                          when 'ods'
                            Openoffice.new(file_name)
                          when 'xls'
                            Excel.new(file_name)
                          when 'xlsx'
                            Excelx.new(file_name)
                          else
                            return false
                        end
  end

  class << self

    def new_temp_file(attachment)
      extension = attachment.original_filename.split(".").last
      temp_file_name = attachment.tempfile.path
      file_name = "#{temp_file_name}.#{extension}"
      File.rename(temp_file_name, file_name)
      file_name
    end

    def file_validation(name)
      ACCEPTED_FORMATS.include?(name.split(".").last)
    end

    def ext_file_validation(name)
      EXT_ACCEPTED_FORMATS.include?(name.split(".").last)
    end

    def validate_attachment(attachment, original_filename = false)
      !attachment.blank? and Sheet.file_validation(original_filename ? attachment.original_filename : attachment)
    end

  end

end