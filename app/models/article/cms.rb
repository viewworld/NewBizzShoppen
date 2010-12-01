class ::Article::Cms < ::Article

  MAIN_PAGE_ARTICLE = 0
  INTERFACE_CONTENT_TEXT = 1
  HELP_POPUP = 2

  SCOPE = [
      [I18n.t('administration.articles.index.view.main_page_articles'),MAIN_PAGE_ARTICLE],
      [I18n.t('administration.articles.index.view.interface_content_texts'),INTERFACE_CONTENT_TEXT],
      [I18n.t('administration.articles.index.view.help_popups'),HELP_POPUP]
  ].freeze

  scoped_order :id, :title

end