class Administration::ArticlesController < Administration::AdministrationController
  inherit_resources

  set_tab "articles"

  def edit
    @article = Article::Cms.find(params[:id])
    edit!
  end

  def update
    @article = Article::Cms.find(params[:id])
    @article.attributes = params[:article_cms]
    update!
  end

  def create
    params[:article_cms] ||= {}
    @article = Article::Cms.new(params[:article_cms].merge(:scope => Article::Cms::MAIN_PAGE_ARTICLE))
    create! do |success,failure|
      success.html { redirect_to edit_administration_article_path(@article)}
      failure.html { redirect_to administration_articles_path }
    end
  end

  protected

  def collection
    @search = Article::Cms.scoped_search(params[:search])
    @articles = @search.paginate(:page => params[:page])
  end

end