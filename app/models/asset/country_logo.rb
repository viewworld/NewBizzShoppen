class Asset::CountryLogo < Asset
  belongs_to :country, foreign_key: :assetable_id

  has_attached_file :data, attachment_options.merge(styles: {original: '250x250>'})

  validates_attachment_content_type :data,
    content_type: Asset::IMAGE_FILE_TYPES,
    message: " - #{I18n.t('activerecord.errors.models.asset.validation_asset_images_type')}"

  def self.s3_permissions
    :private
  end
end
