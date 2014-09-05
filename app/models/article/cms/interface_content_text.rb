class ::Article::Cms::InterfaceContentText < ::Article::Cms

  has_many :assets, :as => :assetable, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".assetable_id = #{id} AND "assets".assetable_type = \'Article::Cms::InterfaceContentText\')'

  validates_presence_of :key

  private

  def validates_presence_of_content?
    false
  end

  public

end
