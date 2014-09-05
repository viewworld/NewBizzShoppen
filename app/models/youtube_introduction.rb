class YoutubeIntroduction < ActiveRecord::Base
  has_one :image, as: :assetable, class_name: 'Asset::YoutubeImage', dependent: :destroy
  accepts_nested_attributes_for :image

  validates_presence_of :url, :locale_code, :site
  validates_uniqueness_of :locale_code, scope: :site

  scope :for_site, ->(site) { where(site: site) }
end
