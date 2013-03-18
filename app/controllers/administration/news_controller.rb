class Administration::NewsController < Administration::AdministrationController
  inherit_resources

  set_tab "content"
  set_subtab "news"

  def edit
    @news = Article.find(params[:id])
    edit!
  end

  def update
    @news = Article.find(params[:id])
    @news.attributes = params[:news]
    update!
  end

  def create
    @news = "Article::News::#{params[:subclass]}".constantize.new
    create! do |success,failure|
      success.html { render :action => :edit }
      failure.html { redirect_to administration_news_index_path }
    end
  end

  def show
    @news = Article.find(params[:id])
    show!
  end

  def destroy
    @news = Article.find(params[:id])
    super do |format|
      format.html { redirect_to administration_news_index_path }
    end
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_subclass] = "Article::News" unless params[:search][:with_subclass].present?
    @search = Article.scoped_search(params[:search])
    @news = @search.paginate(:show_all => params[:show_all], :page => params[:page])
  end

end