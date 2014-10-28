class ::Article::News::Supplier < ::Article::News
  has_many :assets, as: :assetable, dependent: :destroy
end
