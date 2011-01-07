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
end