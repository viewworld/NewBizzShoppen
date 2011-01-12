module ArticlesHelper
  def link_to_main_page_article(key)
    if article = Article::Cms.main_page_articles.where(:key => key).first
      link_to article.title, article_path(article.id)
    end
  end

  def blurb(key)
    if blurb = Article::Cms.interface_content_texts.where(:key => key).first
      raw %{
        #{link_to "(#{t("common.edit_link").downcase}) ", edit_administration_article_path(blurb)  if current_user_has_role? :admin}
        #{blurb.content}
      }
    end
  end

  def help_popup(link_name, key)
    link_to link_name, help_popup_path(key), :id => "help_popup_#{key}"
  end

  def article_scope_for_select
    [
        [I18n.t('administration.articles.index.view.main_page_articles'),Article::Cms::MAIN_PAGE_ARTICLE],
        [I18n.t('administration.articles.index.view.interface_content_texts'),Article::Cms::INTERFACE_CONTENT_TEXT],
        [I18n.t('administration.articles.index.view.help_popups'),Article::Cms::HELP_POPUP]
    ]
  end

end