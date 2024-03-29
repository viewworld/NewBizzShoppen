class Material < Asset
  belongs_to :campaign, :polymorphic => true
  has_attached_file :asset, attachment_options
  validates_attachment_size :asset, :less_than => 10.megabytes
  validates_attachment_content_type :asset, :content_type => Asset::IMAGE_FILE_TYPES + Asset::DOCUMENT_FILE_TYPES, :message => " - #{I18n.t(:validation_asset_images_type)}"
  has_many :result_values,
           :finder_sql => 'SELECT result_values.* FROM result_values WHERE (field_type = \'#{ResultField::MATERIAL}\' AND value = \'#{id}\')'
  before_destroy do
    if result_values.any?
      self.errors.add(:base, I18n.t("materials.views.index.assigned_to_results"))
      false
    end
  end

  protected

  def destroy_attached_files
    if result_values.any?
      self.errors.add(:base, I18n.t("materials.views.index.assigned_to_results"))
      false
    else
      super
    end
  end

  public

  def url(style=nil, use_timestamp = false)
    super
  end

end