module Administration::SettingsHelper

  def locales_for_video_introduction(obj)
    locales = Locale.all.map(&:code)-YoutubeIntroduction.all.map(&:locale_code)
    unless obj.new_record?
      locales += [obj.locale_code]
    end
    locales
  end

end
