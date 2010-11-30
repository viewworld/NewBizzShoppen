class ::Article::News < ::Article

  AGENT = 0
  BUYER = 1

  SCOPE = [
      [I18n.t('administration.news.index.view.agents'),AGENT],
      [I18n.t('administration.news.index.view.buyers'),BUYER],
  ].freeze

  scoped_order :id, :title, :created_at

  scope :for_agent, where("scope = ?", AGENT)
  scope :for_buyer, where("scope = ?", BUYER)

end
