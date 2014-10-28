class ::Article::Cms::InterfaceContentText < ::Article::Cms
  has_many :assets, as: :assetable, dependent: :destroy
  validates :key, presence: true

  private

  def validates_presence_of_content?
    false
  end
end
