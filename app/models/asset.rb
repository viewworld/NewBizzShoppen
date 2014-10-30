class Asset < ActiveRecord::Base
  include Ckeditor::Orm::ActiveRecord::AssetBase
  include Ckeditor::Backend::Paperclip

  self.table_name = 'assets'

  IMAGE_FILE_TYPES = %w(image/jpeg image/png image/gif image/pjpeg image/x-png)
  DOCUMENT_FILE_TYPES = %w(application/x-pdf application/txt text/plain application/msword
                           application/pdf application/vnd.ms-excel application/vnd.oasis.opendocument.text
                           application/vnd.oasis.opendocument.spreadsheet application/octet)

  validates_attachment :data, less_than: 10.megabytes

  belongs_to :assetable, polymorphic: true, foreign_key: :assetable_id
  belongs_to :user

  delegate :url, to: :data

  alias_attribute :asset, :data
  alias_attribute :filename, :data_file_name
  alias_attribute :content_type, :data_content_type
  alias_attribute :size, :data_file_size

  def format_created_at
    I18n.l(created_at, format: '%d.%m.%Y %H:%M')
  end

  # TODO there must be a better way..
  def url(style=nil, use_timestamp = true)
    if self.class.s3_storage?
      data.url(style,use_timestamp).gsub('//s3', '//fairleads.s3').gsub('/fairleads/', '/')
    else
      data.url(style,use_timestamp)
    end
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

  def self.s3_storage?
    %w(production staging development).include?(Rails.env)
  end

  def self.attachment_options
    if s3_storage?
      {
        storage: :s3,
        s3_protocol: 'https',
        s3_credentials: "#{Rails.root}/config/s3.yml",
        s3_permissions: s3_permissions,
        path: "assets/:id/:style/:basename.:extension"
      }
    else
      {
        url: "/system/assets/:id/:style/:basename.:extension",
        path: ":rails_root/public/system/assets/:id/:style/:basename.:extension"
      }
    end
  end

  private

  def self.s3_permissions
    :public_read
  end
end
