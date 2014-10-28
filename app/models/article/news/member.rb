class ::Article::News::Member < ::Article::News
  has_many :assets, as: :assetable, dependent: :destroy
end
