class Asset::DealMaterial < Asset
  belongs_to :deal, foreign_key: :assetable_id, touch: true

  validates_attachment_content_type :data,
    content_type: Asset::IMAGE_FILE_TYPES + Asset::DOCUMENT_FILE_TYPES,
    message: " - #{I18n.t(:validation_asset_images_type)}"
end
