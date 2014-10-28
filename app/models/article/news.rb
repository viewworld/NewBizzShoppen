class ::Article::News < ::Article
  has_many :assets, as: :assetable, dependent: :destroy
end
