class ActiveRecord::ConnectionAdapters::Column

  def self.string_to_date(string)
      return string unless string.is_a?(String)

      begin
          return DateTime.strptime(string, I18n.t("date.formats.default"))
      rescue
          date_array = ParseDate.parsedate(string)
          # treat 0000-00-00 as nil
          Date.new(date_array[0], date_array[1], date_array[2]) rescue nil
      end
  end
end