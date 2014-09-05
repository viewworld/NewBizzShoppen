class ::Article::News::Supplier < ::Article::News

  has_many :assets, :as => :assetable, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".assetable_id = #{id} AND "assets".assetable_type = \'Article::News::Supplier\')'

end
