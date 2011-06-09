module HomeHelper

  def youtube_introduction_id
    if youtube = YoutubeIntroduction.where(:locale_code => I18n.locale).first
      youtube.url.extract_youtube_video_id
    else
      youtube
    end
  end
end
