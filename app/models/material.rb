class Material < Asset
  has_attached_file :data, attachment_options

  validates_attachment_size :data, less_than: 10.megabytes
  validates_attachment_content_type :data,
    content_type: Asset::IMAGE_FILE_TYPES + Asset::DOCUMENT_FILE_TYPES

  belongs_to :campaign, polymorphic: true
  has_many :result_values,
    finder_sql: 'SELECT result_values.* FROM result_values WHERE (field_type = \'#{ResultField::MATERIAL}\' AND value = \'#{id}\')'

  before_destroy do
    if result_values.any?
      self.errors.add(:base, I18n.t("materials.views.index.assigned_to_results"))
      false
    end
  end

  def url(style = nil, use_timestamp = false)
    super
  end
end
