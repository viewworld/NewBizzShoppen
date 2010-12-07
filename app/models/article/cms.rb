class Article::Cms < ::Article

  MAIN_PAGE_ARTICLE = 0.freeze
  INTERFACE_CONTENT_TEXT = 1.freeze
  HELP_POPUP = 2.freeze

  SCOPE = [
      [I18n.t('administration.articles.index.view.main_page_articles'),MAIN_PAGE_ARTICLE],
      [I18n.t('administration.articles.index.view.interface_content_texts'),INTERFACE_CONTENT_TEXT],
      [I18n.t('administration.articles.index.view.help_popups'),HELP_POPUP]
  ].freeze

  has_many :assets, :as => :resource, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".resource_id = #{id} AND "assets".resource_type = \'Article::Cms\')'

  validates_presence_of :key, :if => Proc.new{|a| [INTERFACE_CONTENT_TEXT,HELP_POPUP].include?(a.scope)}
  validates_uniqueness_of :key, :scope => :scope, :allow_nil => true

  scoped_order :id, :title

  scope :main_page_articles, where(:scope => MAIN_PAGE_ARTICLE)
  scope :interface_content_texts, where(:scope => INTERFACE_CONTENT_TEXT)
  scope :help_popups, where(:scope => HELP_POPUP)
  scope :ascend_by_title, only_translations(I18n.locale).order("article_translations.title ASC")
  scope :descend_by_title, only_translations(I18n.locale).order("article_translations.title DESC")

  before_destroy :can_be_destroyed?

  def can_be_destroyed?
    key.blank?
  end

end