class Article::Cms < ::Article

  validates_uniqueness_of :key, :scope => :type, :allow_nil => true

  before_destroy :can_be_destroyed?

  def can_be_destroyed?
    key.blank?
  end

  def show_type
    I18n.t("administration.articles.index.view.#{self.class.name.split('::').last.underscore.pluralize}")
  end

end