class Administration::ArticlesController < Administration::AdministrationController
  inherit_resources

  def edit
    @article = Article::Cms.find(params[:id])
    edit!
  end

  def new
    @article = Article::Cms.new
    new!
  end

  def update
    @article = Article::Cms.find(params[:id])
    @article.attributes = params[:article_cms]
    update!
  end

  def create
    @article = Article::Cms.new(params[:article_cms].merge(:scope => Article::Cms::MAIN_PAGE_ARTICLE))
    create!
  end

  protected

  def collection
    @search = Article::Cms.scoped_search(params[:search])
    @articles = @search.paginate(:page => params[:page])
  end

end