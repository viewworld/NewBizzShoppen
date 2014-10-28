class ::Article::Cms::MainPageArticle < ::Article::Cms
  has_many :assets, as: :assetable, dependent: :destroy
end
