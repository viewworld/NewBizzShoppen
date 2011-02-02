class NewsController < ApplicationController
  inherit_resources

  def show
    unless @news = Article.published.where(:id => params[:id]).first
      redirect_to root_path
    end
  end

  protected

  def collection
    @search = Article.scoped_search(params[:search]).order("created_at DESC").published
    @news = @search.paginate(:page => params[:page], :per_page => Settings.default_news_per_page)
  end
end