class ::Article::News < ::Article

  AGENT = 0.freeze
  BUYER = 1.freeze

  SCOPE = [
      [I18n.t('administration.news.index.view.agents'),AGENT],
      [I18n.t('administration.news.index.view.buyers'),BUYER],
  ].freeze

  has_many :assets, :as => :resource, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".resource_id = #{id} AND "assets".resource_type = \'Article::News\')'


  scoped_order :id, :title, :created_at

  scope :for_agent, where("scope = ?", AGENT)
  scope :for_buyer, where("scope = ?", BUYER)
  scope :ascend_by_title, only_translations(I18n.locale).order("article_translations.title ASC")
  scope :descend_by_title, only_translations(I18n.locale).order("article_translations.title DESC")


end
