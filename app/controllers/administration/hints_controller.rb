class Administration::HintsController < Administration::AdministrationController
  inherit_resources
  set_tab "content"
  set_subtab "hints"

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.attributes = params[:article]
    if @article.save
      redirect_to administration_hint_path(@article)
    else
      render :action => "edit"
    end
  end

  def show
    @article = Article::Cms::Hint.find(params[:id])
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_subclass] = "Article::Cms::Hint" unless params[:search][:with_subclass].present?
    @search = Article.scoped_search(params[:search])
    @hints = @search.paginate(:page => params[:page])
  end
end