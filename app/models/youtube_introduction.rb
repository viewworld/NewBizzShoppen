class YoutubeIntroduction < ActiveRecord::Base

  has_one :image,
          :class_name => "Asset::YoutubeImage",
          :as         => :resource,
          :conditions => "asset_type = 'Asset::YoutubeImage'",
          :dependent  => :destroy

  validates_presence_of :url, :locale_code

  accepts_nested_attributes_for :image

end
