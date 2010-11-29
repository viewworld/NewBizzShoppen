class ::Article::Cms < ::Article

  TYPES = [
      [I18n.t('administration.articles.index.view.main_page_articles'),'main'],
      [I18n.t('administration.articles.index.view.interface_content_texts'),'blurb'],
      [I18n.t('administration.articles.index.view.help_popups'),'help']
  ].freeze

  scope :with_type, lambda {|article_type| where(["type = ?", "Article::Cms::#{article_type.humanize}"]) }

end