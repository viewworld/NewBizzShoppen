class Article::Cms < ::Article
  attr_accessor :force_destroy

  validates_uniqueness_of :key, scope: :type, allow_nil: true

  before_destroy :can_be_destroyed?

  def can_be_destroyed?
    key.blank? || force_destroy
  end

  def show_type
    I18n.t("administration.articles.index.view.#{self.class.name.split('::').last.underscore.pluralize}")
  end
end
