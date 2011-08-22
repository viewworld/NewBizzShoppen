class Asset < ActiveRecord::Base
  IMAGE_FILE_TYPES = %w(image/jpeg image/png image/gif image/pjpeg image/x-png)
  DOCUMENT_FILE_TYPES = %w(application/x-pdf application/txt text/plain application/msword application/pdf application/vnd.ms-excel application/vnd.oasis.opendocument.text application/vnd.oasis.opendocument.spreadsheet application/octet)

  belongs_to :resource, :polymorphic => true, :foreign_key => "resource_id"
  belongs_to :user

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

  def format_created_at
    I18n.l(self.created_at, :format=>"%d.%m.%Y %H:%M")
  end

  def self.s3_storage?
    ['production','staging'].include?(Rails.env)
  end

  def self.attachment_options
    if self.s3_storage?
      {
        :storage        => :s3,
        :s3_credentials => "#{Rails.root}/config/s3.yml",
        :s3_permissions => :public_read,
        :bucket         => "fairleads/#{Rails.env}",
        :url            => "http://fairleads.s3.amazonaws.com/#{Rails.env}/assets/:id/:style/:basename.:extension",
        :path           => "#{Rails.env}/assets/:id/:style/:basename.:extension"
      }
    else
      {
        :url  => "/assets/:id_:style.:extension",
        :path => ":rails_root/public/assets/:id_:style.:extension"
      }
    end
  end

end

class Asset::CategoryImage < Asset
  belongs_to :category, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "100x150>", :thumb => "32x32"})
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end

class Asset::YoutubeImage < Asset
  belongs_to :youtube_introduction, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end

class Asset::DealLogo < Asset
  belongs_to :deal, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "150x100>", :thumb => "32>x32"})
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end

class Asset::DealImage < Asset
  belongs_to :deal, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "600x600>", :thumb => "32x32", :medium => "150x100>"})
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end

class Asset::DealMaterial < Asset
  belongs_to :deal, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::DOCUMENT_FILE_TYPES, :message => " - #{I18n.t(:validation_document_images_type)}"

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end

class Asset::CountryLogo < Asset
  belongs_to :country, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "250x250>"})
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end