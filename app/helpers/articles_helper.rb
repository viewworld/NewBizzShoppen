module ArticlesHelper
  def link_to_main_page_article(key)
    if article = Article::Cms.main_page_articles.where(:key => key).first
      link_to article.title, article_path(article.id)
    end
  end

  def blurb(key)
    if blurb = Article::Cms.interface_content_texts.where(:key => key).first
      raw blurb.content
    end
  end

  def help_popup(link_name, key)
    link_to link_name, help_popup_path(key), :id => "help_popup_#{key}"
  end
end