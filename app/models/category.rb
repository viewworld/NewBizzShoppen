class Category < ActiveRecord::Base
  translates :name, :description

  has_one :image, :class_name => "Asset::CategoryImage", :as => :resource, :conditions => "asset_type = 'Asset::CategoryImage'", :dependent => :destroy
  has_many :category_interests

  accepts_nested_attributes_for :image
end
