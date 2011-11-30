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