module ArticlesHelper
  def link_to_main_page_article(key, options = {}, html_options = {})
    if article = Article::Cms::MainPageArticle.where(:key => key).first
      link_to article.title, article_path(article.id, options), html_options
    end
  end

  def blurb(key)
    if blurb = Article::Cms::InterfaceContentText.where(:key => key).first
      raw %{
        #{(link_to "(#{t("common.edit_link").downcase})", edit_administration_article_path(blurb)) if current_user and current_user.has_any_role?(:admin, :translator)}
        #{blurb.content}
      }
    end
  end

  def help_popup(link_name, key)
    link_to link_name, help_popup_path(key), :id => "help_popup_#{key}"
  end

  def article_scope_for_select
    [
        [I18n.t('administration.articles.index.view.main_page_articles'),"MainPageArticle"],
        [I18n.t('administration.articles.index.view.interface_content_texts'),"InterfaceContentText"],
        [I18n.t('administration.articles.index.view.help_popups'),"HelpPopup"]
    ]
  end

end