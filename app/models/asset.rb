class Asset < ActiveRecord::Base
  IMAGE_FILE_TYPES = %w(image/jpeg image/png image/gif image/pjpeg image/x-png)
  DOCUMENT_FILE_TYPES = %w(application/x-pdf application/txt text/plain application/msword application/pdf application/vnd.ms-excel application/vnd.oasis.opendocument.text application/vnd.oasis.opendocument.spreadsheet application/octet)

  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"

  before_save :set_asset_type

  delegate :url, :to => :asset

  def self.inherited(subclass)
    super
    subclass.send(:default_scope, :conditions => "asset_type='#{subclass.name}'")
  end

  def filename
    asset_file_name
  end

  def content_type
    asset_content_type
  end

  def size
    asset_file_size
  end

  def set_asset_type
    self.asset_type = self.class.name
  end

end

class Asset::CategoryImage < Asset
  belongs_to :category, :foreign_key => "resource_id"
  has_attached_file :asset, :styles => {:original => "100x150>", :thumb => "32x32"}
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"
end