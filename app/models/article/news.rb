class ::Article::News < ::Article

  AGENT = 0
  BUYER = 1
  PURCHASE_MANAGER = 2

  has_many :assets, :as => :resource, :dependent => :destroy, :finder_sql =>
      'SELECT "assets".*' +
      'FROM "assets"' +
      'WHERE ("assets".resource_id = #{id} AND "assets".resource_type = \'Article::News\')'


  scoped_order :id, :title, :created_at

  scope :for_agent, where("scope = ?", AGENT)
  scope :for_buyer, where("scope = ?", BUYER)
  scope :for_purchase_manager, where("scope = ?", PURCHASE_MANAGER)
  scope :ascend_by_title, only_translations(I18n.locale).order("article_translations.title ASC")
  scope :descend_by_title, only_translations(I18n.locale).order("article_translations.title DESC")


end
