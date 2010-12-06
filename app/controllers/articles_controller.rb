class ArticlesController < ApplicationController
  inherit_resources

  def show
    unless @article = Article::Cms.published.where(:id => params[:id]).first
      redirect_to root_path
    end
  end

end