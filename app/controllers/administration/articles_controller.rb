class Administration::ArticlesController < Administration::AdministrationController
  inherit_resources

  def create
    @article = "Article::Cms".constantize.new(params[:article_cms])
    @article.send("type=","Article::Cms::#{params[:article_cms][:type].to_s.camelize}")

    if @article.save
      flash[:notice] = t("administration.articles.create.flash.article_creation_successful")
      redirect_to administration_articles_path
    else
      render :action => 'new'
    end
  end

  def new
    @article = Article::Cms.new
  end

  protected

  def collection
    @search = Article::Cms.scoped_search(params[:search])
    @articles = @search.paginate(:page => params[:page])
  end

end