class ::Article::News::CategoryHome < ::Article::News
  has_many :assets, as: :assetable, dependent: :destroy

  belongs_to :resource, polymorphic: true

  validates :resource, presence: true, on: :update
end
