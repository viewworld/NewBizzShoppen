class YoutubeIntroduction < ActiveRecord::Base
  validates_presence_of :url, :locale_code
end
