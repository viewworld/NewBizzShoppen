class Asset::DealImage < Asset
  belongs_to :deal, foreign_key: :assetable_id, touch: true

  has_attached_file :data, attachment_options.merge(styles: {original: '600x600>',
                                                             thumb: '32x32',
                                                             medium: '150x100>'})

  validates_attachment_content_type :data,
    content_type: Asset::IMAGE_FILE_TYPES,
    message: " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end
