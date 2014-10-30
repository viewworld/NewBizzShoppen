class Ckeditor::Picture < Ckeditor::Asset
  has_attached_file :data, attachment_options.merge(styles: { content: '800>', thumb: '118x100#' })

  validates_attachment :data, presence: true, less_than: 2.megabytes,
    content_type: { content_type: IMAGE_FILE_TYPES }

  def url_content
    url(:content)
  end
end
