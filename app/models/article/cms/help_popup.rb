class ::Article::Cms::HelpPopup < ::Article::Cms
  has_many :assets, as: :assetable, dependent: :destroy
  validates :key, presence: true
end
