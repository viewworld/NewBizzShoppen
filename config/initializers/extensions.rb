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
    self.scan(/(v=|embed\/)([a-zA-Z0-9-_]+)/).flatten.last
  end
end

class NilClass
  def to_postgresql_date
    self
  end
end