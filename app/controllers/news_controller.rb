class NewsController < ApplicationController
  inherit_resources

  def show
    @news = Article::News.where(:id => params[:id]).first
  end

  protected

  def collection
    @search = Article::News.scoped_search(params[:search]).order("created_at DESC")
    @news = @search.paginate(:page => params[:page], :per_page => Settings.default_news_per_page)
  end
end