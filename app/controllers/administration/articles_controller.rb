class Administration::ArticlesController < Administration::AdministrationController
  inherit_resources

  set_tab "articles"

  def edit
    @article = Article.find(params[:id])
    edit!
  end

  def update
    @article = Article.find(params[:id])
    @article.attributes = params[:article]
    update!
  end

  def create
    params[:article_cms] ||= {}
    @article = Article::Cms::MainPageArticle.new(params[:article])
    create! do |success,failure|
      success.html { redirect_to edit_administration_article_path(@article)}
      failure.html { redirect_to administration_articles_path }
    end
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_subclass] = "Article::Cms" unless params[:search][:with_subclass].present?
    @search = Article.scoped_search(params[:search])
    @articles = @search.paginate(:page => params[:page])
  end

end