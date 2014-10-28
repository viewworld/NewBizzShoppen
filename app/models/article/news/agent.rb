class ::Article::News::Agent < ::Article::News
  has_many :assets, as: :assetable, dependent: :destroy
end
