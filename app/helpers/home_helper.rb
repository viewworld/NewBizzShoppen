module HomeHelper

  def youtube_introduction
    YoutubeIntroduction.for_site(session[:site]).where(:locale_code => I18n.locale).first
  end
end
