class Article::Cms < ::Article

  has_many :assets, :as => :resource, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".resource_id = #{id} AND "assets".resource_type = \'Article::Cms\')'

  validates_uniqueness_of :key, :scope => :type, :allow_nil => true

  before_destroy :can_be_destroyed?

  def can_be_destroyed?
    key.blank?
  end

  def show_type
    I18n.t("administration.articles.index.view.#{self.class.name.split('::').last.underscore.pluralize}")
  end

end