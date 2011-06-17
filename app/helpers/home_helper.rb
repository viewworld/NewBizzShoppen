module HomeHelper

  def youtube_introduction
    YoutubeIntroduction.where(:locale_code => I18n.locale).first
  end
end
