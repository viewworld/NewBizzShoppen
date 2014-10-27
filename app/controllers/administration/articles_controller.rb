class Administration::ArticlesController < Administration::AdministrationController
  set_tab 'content'
  set_subtab 'articles'

  before_filter :set_referer, only: :edit
  before_filter :set_article, only: [:show, :edit, :update, :destroy]

  def index
    params[:search] ||= {}
    params[:search][:with_subclass] ||= 'Article::Cms'
    params[:search][:without_subclass] = 'Article::Cms::Hint'

    @search = Article.scoped_search(params[:search])
    @articles = @search.paginate(show_all: params[:show_all], page: params[:page])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article::Cms::MainPageArticle.new(article_params)

    if @article.save
      redirect_to administration_articles_path
    else
      render :new
    end
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to session[:articles_referer] || administration_articles_path
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to administration_articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :published)
  end

  def authorize_user_for_namespace!
    authorize_role(:translator)
  end

  def set_referer
    session[:articles_referer] = request.referer
  end
end
