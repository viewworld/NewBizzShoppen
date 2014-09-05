module Administration::YoutubeIntroductionsHelper
  def enabled_locales
    Locale.enabled.map(&:code)
  end

  def available_sites
    ['fairleads', 'fairdeals']
  end
end
