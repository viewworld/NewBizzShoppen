class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    url: "/ckeditor_assets/attachments/:id/:filename",
                    path: ":rails_root/public/ckeditor_assets/attachments/:id/:filename"

  validates_attachment :data, presence: true, less_than: 100.megabytes

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
