class ::Article::News::CallCentre < ::Article::News
  has_many :assets, as: :assetable, dependent: :destroy
end
