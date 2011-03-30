class Administration::ArticlesController < Administration::AdministrationController
  inherit_resources

  set_tab "content"
  set_subtab "articles"

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
      success.html { render :action => :edit }
      failure.html { redirect_to administration_articles_path }
    end
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_subclass] = "Article::Cms" unless params[:search][:with_subclass].present?
    params[:search][:without_subclass] = "Article::Cms::Hint"
    @search = Article.scoped_search(params[:search])
    @articles = @search.paginate(:page => params[:page])
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:translator)
  end

end