class ::Article::News::CategoryHome < ::Article::News

  has_many :assets, :as => :assetable, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".assetable_id = #{id} AND "assets".assetable_type = \'Article::News::CategoryHome\')'

  belongs_to :resource, :polymorphic => true

  validates_presence_of :resource, :on => :update

end
