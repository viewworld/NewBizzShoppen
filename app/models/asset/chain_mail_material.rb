class Asset::ChainMailMaterial < Asset
  belongs_to :chain_mail_type, foreign_key: :assetable_id

  has_and_belongs_to_many :chain_mail_items
  has_attached_file :data, attachment_options

  validates_attachment_content_type :data,
    content_type: Asset::IMAGE_FILE_TYPES + Asset::DOCUMENT_FILE_TYPES,
    message: " - #{I18n.t(:validation_asset_images_type)}"
end
