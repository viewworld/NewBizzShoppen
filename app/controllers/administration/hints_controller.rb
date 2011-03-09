class Administration::HintsController < Administration::AdministrationController
  inherit_resources
  set_tab "content"
  set_subtab "hints"

  def edit
    @hint = Article.find(params[:id])
    edit!
  end

  def update
    @hint = Article.find(params[:id])
    @hint.attributes = params[:article]
    update!
  end

  def create
    params[:article_cms] ||= {}
    @hint = Article::Cms::MainPageArticle.new(params[:article])
    create! do |success,failure|
      success.html { render :action => :edit }
      failure.html { redirect_to administration_hints_path }
    end
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_subclass] = "Article::Cms::Hint" unless params[:search][:with_subclass].present?
    @search = Article.scoped_search(params[:search])
    @hints = @search.paginate(:page => params[:page])
  end
end