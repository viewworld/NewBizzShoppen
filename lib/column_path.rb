class ActiveRecord::ConnectionAdapters::Column

  def self.string_to_date(string)
      return string unless string.is_a?(String)

      begin
        return DateTime.strptime(string, I18n.t("date.formats.default"))
      rescue
        return Date.parse(string)
      end
  end
end
