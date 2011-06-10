require 'roo'

class Sheet
  ACCEPTED_FORMATS = %w{ods xls xlsx}
  attr_accessor :roo_instance

  def initialize(attachment)
    extension = attachment.original_filename.split(".").last
    temp_file_name = attachment.tempfile.path
    file_name = "#{temp_file_name}.#{extension}"
    File.rename(temp_file_name, file_name)
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

  def self.file_validation(name)
    ACCEPTED_FORMATS.include?(name.split(".").last)
  end

end