class ::Article::News::CategoryHome < ::Article::News

  has_many :assets, :as => :resource, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".resource_id = #{id} AND "assets".resource_type = \'Article::News::CategoryHome\')'

  belongs_to :resource, :polymorphic => true

  validates_presence_of :resource, :on => :update

end