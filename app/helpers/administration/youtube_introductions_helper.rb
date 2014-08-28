module Administration::YoutubeIntroductionsHelper
  def enabled_locales
    Locale.enabled.map(&:code)
  end

  def available_sites
    YoutubeIntroduction::SITES
  end
end
