class Administration::NewsController < Administration::AdministrationController
  inherit_resources

  def edit
    @news = Article::News.find(params[:id])
    edit!
  end

  def new
    @news = Article::News.new
    new!
  end

  def update
    @news = Article::News.find(params[:id])
    @news.attributes = params[:article_news]
    update!
  end

  def create
    @news = Article::News.new(params[:article_news])
    create!
  end

  def show
    @news = Article::News.find(params[:id])
    show!
  end

  def destroy
    @news = Article::News.find(params[:id])
    super do |format|
      format.html { redirect_to administration_news_index_path }
    end
  end

  protected

  def collection
    @search = Article::News.scoped_search(params[:search])
    @news = @search.paginate(:page => params[:page])
  end

end