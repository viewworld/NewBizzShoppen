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
end