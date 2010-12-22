module NewsHelper
  def news_header
    if params[:search].is_a?(Hash)
      if params[:search][:for_agent]
        t("news.index.view.agents_header")
      elsif params[:search][:for_buyer]
        t("news.index.view.buyers_header")
      end
    end
  end

  def news_scope_for_select
    [
      [I18n.t('administration.news.index.view.agents'),Article::News::AGENT],
      [I18n.t('administration.news.index.view.buyers'),Article::News::BUYER]
    ]
  end

  def st(text="", sanitize_options={:tags=>[],:attributes=>[]},truncate_options={:length=>350})
    raw truncate(sanitize(text, sanitize_options),truncate_options)
  end

end