class ArticlesController < ApplicationController
  inherit_resources

  def show
    unless @article = Article.published.where(:id => params[:id]).first
      redirect_to root_path
    else
      if params[:popup]
        render :file => 'help_popups/show', :layout => 'help_popup'
      else
        render :action => :show
      end
    end
  end

end