class ::Article::Cms::HelpPopup < ::Article::Cms

  has_many :assets, :as => :assetable, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".assetable_id = #{id} AND "assets".assetable_type = \'Article::Cms::HelpPopup\')'

  validates_presence_of :key

end
