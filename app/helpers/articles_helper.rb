module ArticlesHelper
  def link_to_main_page_article(key, options = {}, html_options = {})
    if article = Article::Cms::MainPageArticle.where(:key => key).first
      link_to article.title, article_path(article.id, options), html_options
    end
  end

  def blurb(object=nil)
    raise "Specify object or key to display blurb" unless object
    if blurb = (object.is_a?(ActiveRecord::Base) ? object.blurb : Article::Cms::InterfaceContentText.find_or_create_by_key(object))
      raw %{
        #{(link_to image_tag("icons/edit.png"), edit_administration_article_path(blurb)) if current_user and current_user.has_any_role?(:admin, :translator)}
        #{blurb.content}
        }
    else
      "Blurb not found"
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