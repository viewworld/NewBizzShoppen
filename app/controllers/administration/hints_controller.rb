class Administration::HintsController < Administration::AdministrationController
  set_tab 'content'
  set_subtab 'hints'

  before_filter :set_referer, only: [:edit, :destroy]
  before_filter :set_article, only: [:edit, :update, :destroy]

  def index
    params[:search] ||= {}
    params[:search][:with_subclass] = 'Article::Cms::Hint' unless params[:search][:with_subclass].present?

    @search = Article.scoped_search(params[:search])
    @hints = @search.paginate(show_all: params[:show_all], page: params[:page])
  end

  def show
    @article = Article::Cms::Hint.find(params[:id])
  end

  def update
    if @article.update_attributes(article_params)
      redirect_to session[:hints_referer] || administration_hints_path
    else
      render :edit
    end
  end

  def destroy
    @article.update_attribute(:published, false)
    redirect_to session[:hints_referer] || administration_hints_path
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def set_referer
    session[:hints_referer] = request.referer
  end

  def article_params
    params.require(:article).permit(:content, :published)
  end

  def authorize_user_for_namespace!
    authorize_role(:translator)
  end
end
