class Administration::HintsController < Administration::AdministrationController
  inherit_resources
  set_tab "content"
  set_subtab "hints"

  before_filter :set_referer, :only => [:edit, :destroy]

  def edit
    @article = Article.find(params[:id])
    if params[:add] == "1"
      @article.published = true
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.attributes = params[:article]
    if @article.save
      if session[:hints_referer]
        redirect_to session[:hints_referer]
      else
        redirect_to administration_hints_path
      end
    else
      render :action => "edit"
    end
  end

  def show
    @article = Article::Cms::Hint.find(params[:id])
  end

  def destroy
    @article = Article.find(params[:id])
    @article.update_attribute(:published, false)
    if session[:hints_referer]
      redirect_to session[:hints_referer]
    else
      redirect_to administration_hints_path
    end
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_subclass] = "Article::Cms::Hint" unless params[:search][:with_subclass].present?
    @search = Article.scoped_search(params[:search])
    @hints = @search.paginate(:show_all => params[:show_all], :page => params[:page])
  end

  def set_referer
    session[:hints_referer] = request.referer
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:translator)
  end
end