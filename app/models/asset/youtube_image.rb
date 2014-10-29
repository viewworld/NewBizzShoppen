class Asset::YoutubeImage < Asset
  belongs_to :youtube_introduction, foreign_key: :assetable_id

  has_attached_file :data, attachment_options.merge(styles: {thumb: '350>x200'})

  validates_attachment_content_type :data,
    content_type: Asset::IMAGE_FILE_TYPES,
    message: " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"
end
