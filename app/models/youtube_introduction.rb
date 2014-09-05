class YoutubeIntroduction < ActiveRecord::Base

  has_one :image,
          :class_name => "Asset::YoutubeImage",
          :as         => :assetable,
          :conditions => "asset_type = 'Asset::YoutubeImage'",
          :dependent  => :destroy

  SITES = ['fairleads', 'fairdeals']

  validates_presence_of :url, :locale_code, :site

  validates_uniqueness_of :locale_code, :scope => :site

  scope :for_site, lambda{|site| where(:site => site)}

  accepts_nested_attributes_for :image

end
