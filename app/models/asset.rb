class Asset < ActiveRecord::Base
  IMAGE_FILE_TYPES = %w(image/jpeg image/png image/gif image/pjpeg image/x-png)
  DOCUMENT_FILE_TYPES = %w(application/x-pdf application/txt text/plain application/msword application/pdf application/vnd.ms-excel application/vnd.oasis.opendocument.text application/vnd.oasis.opendocument.spreadsheet application/octet)

  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 10.megabyte

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
    ['production', 'staging'].include?(Rails.env)
  end

  # TODO there must be a better way..
  def url(style=nil, use_timestamp = true)
    if self.class.s3_storage?
      asset.url(style,use_timestamp).gsub('//s3', '//fairleads.s3').gsub('/fairleads/', '/')
    else
      asset.url(style,use_timestamp)
    end
  end

  def self.attachment_options
    if self.s3_storage?
      {
          :storage => :s3,
          :s3_protocol => 'https',
          :s3_credentials => "#{Rails.root}/config/s3.yml",
          :s3_permissions => :public_read,
          :bucket => "fairleads/#{Rails.env}",
          :path => "assets/:id/:style/:basename.:extension"
      }
    else
      {
          :url => "/system/assets/:id/:style/:basename.:extension",
          :path => ":rails_root/public/system/assets/:id/:style/:basename.:extension"
      }
    end
  end

  def full_local_path_for_current
    Pathname.new(File.join([::Rails.root, 'public', self.url.gsub("https://fairleads.s3.amazonaws.com/production", "")]).gsub(/(releases\/\d+)/, "current"))
  end

  def stored_local_temp_path(url, prefix=nil)
    OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
    OpenURI::Buffer.const_set 'StringMax', 0
    tmp_file = open(URI.escape(url), 'User-Agent' => 'ruby')
    OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
    OpenURI::Buffer.const_set 'StringMax', 10240
    tmp_filename = tmp_file.path.split('/').last
    url_filename = "#{prefix + '-' if prefix}#{url.split('/').last}"
    dest_path = tmp_file.path.gsub(tmp_filename, url_filename)
    FileUtils.mv(tmp_file.path, dest_path)

    dest_path
  end

  def path_for_email_attachment(prefix=nil)
    if self.class.s3_storage?
      stored_local_temp_path(url, prefix)
    else
      asset.path
    end
  end
end

class Asset::CategoryImage < Asset
  belongs_to :category, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "100x150>", :thumb => "32x32"})
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end

class Asset::YoutubeImage < Asset
  belongs_to :youtube_introduction, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end

class Asset::DealLogo < Asset
  belongs_to :deal, :foreign_key => "resource_id", :touch => true
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "600x600>", :medium => "80x120", :preview => "60x70", :thumb => "32>x32", :featured => "300x50>"})
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end

class Asset::VoucherPicture < Asset
  belongs_to :deal, :foreign_key => "resource_id", :touch => true
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "150x100>", :medium => "80x120", :preview => "60x70", :thumb => "32>x32"})
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end

class Asset::DealImage < Asset
  belongs_to :deal, :foreign_key => "resource_id", :touch => true
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "600x600>", :thumb => "32x32", :medium => "150x100>"})
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"

  def url(style=nil, use_timestamp = false)
    super
  end
end

class Asset::DealMaterial < Asset
  belongs_to :deal, :foreign_key => "resource_id", :touch => true
  has_attached_file :asset, attachment_options
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES + Asset::DOCUMENT_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  def url(style=nil, use_timestamp = false)
    super
  end
end

class Asset::DealInternalDocument < Asset
  belongs_to :deal, :foreign_key => "resource_id", :touch => true
  has_attached_file :asset, attachment_options
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 1.megabyte
  validates_attachment_content_type :asset, :content_type => Asset::DOCUMENT_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_document_type')}"

  # TODO there must be a better way..
  def url(style=nil, use_timestamp=false)
    if self.class.s3_storage?
      super.gsub('//s3', '//fairleads.s3').gsub('/fairleads/', '/')
    else
      super
    end
  end

end

class Asset::CountryLogo < Asset
  belongs_to :country, :foreign_key => "resource_id"
  has_attached_file :asset, attachment_options.merge(:styles => {:original => "250x250>"})
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES, :message => " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end

class Asset::ChainMailMaterial < Asset
  belongs_to :chain_mail_type, :foreign_key => "resource_id"
  has_and_belongs_to_many :chain_mail_items
  has_attached_file :asset, attachment_options
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES + Asset::DOCUMENT_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"

  def url(style=nil, use_timestamp = false)
    super
  end
end