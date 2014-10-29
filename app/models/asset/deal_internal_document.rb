class Asset::DealInternalDocument < Asset
  belongs_to :deal, foreign_key: :assetable_id, touch: true
  has_attached_file :data, attachment_options

  validates_attachment_presence :data
  validates_attachment_size :data, less_than: 10.megabyte
  validates_attachment_content_type :data,
    content_type: Asset::DOCUMENT_FILE_TYPES,
    message: " - #{I18n.t('activerecord.errors.models.asset.validation_asset_document_type')}"

  # TODO there must be a better way..
  def url(style=nil, use_timestamp=false)
    if self.class.s3_storage?
      data.url.gsub('//s3', '//fairleads.s3').gsub('/fairleads/', '/')
    else
      data.url
    end
  end
end
