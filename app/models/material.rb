class Material < Asset
  belongs_to :campaign, :polymorphic => true
  has_attached_file :asset
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 10.megabytes
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
      false
    else
      super
    end
  end

  public

  # TODO there must be a better way..
  def url(style=nil, use_timestamp = false)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end