class NewsController < ApplicationController
  inherit_resources

  def show
    if @news = Article.published.where(:id => params[:id]).first
      @news.increment!(:views_count)
    else
      redirect_to root_path
    end
  end

  protected

  def collection
    @search_articles = Article.scoped_search(params[:search]).order("created_at DESC").published
    @news = @search_articles.paginate(:page => params[:page], :per_page => Settings.default_news_per_page)
  end
end