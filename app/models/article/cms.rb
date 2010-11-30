class ::Article::Cms < ::Article

  SCOPE = [
      [I18n.t('administration.articles.index.view.main_page_articles'),0],
      [I18n.t('administration.articles.index.view.interface_content_texts'),1],
      [I18n.t('administration.articles.index.view.help_popups'),2]
  ].freeze

  scoped_order :id, :title

end