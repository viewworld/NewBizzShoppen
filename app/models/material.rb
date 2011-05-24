class Material < Asset
  belongs_to :campaign, :polymorphic => true
  has_attached_file :asset
  validates_attachment_presence :asset
  validates_attachment_size :asset, :less_than => 10.megabytes

  # TODO there must be a better way..
  def url(style=nil)
    if self.class.s3_storage?
      super.gsub('//s3','//fairleads.s3').gsub('/fairleads/','/')
    else
      super
    end
  end

end