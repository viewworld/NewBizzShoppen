class ::Article::Cms::HelpPopup < ::Article::Cms

  has_many :assets, :as => :resource, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".resource_id = #{id} AND "assets".resource_type = \'Article::Cms::HelpPopup\')'

  validates_presence_of :key

end