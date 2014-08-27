class Administration::NewsController < Administration::AdministrationController
  set_tab "content"
  set_subtab "news"

  before_filter :set_article, only: [:show, :edit, :update, :destroy]

  def index
    params[:search] ||= {}
    params[:search][:with_subclass] ||= "Article::News"

    @search = Article.scoped_search(params[:search])
    @news = @search.paginate(show_all: params[:show_all], page: params[:page])
  end

  def create
    @news = "Article::News::#{params[:subclass].classify}".constantize.new

    if @news.save
      redirect_to edit_administration_news_path(@news)
    else
      redirect_to administration_news_index_path
    end
  end

  def update
    if @news.update_attributes(params[:article])
      redirect_to administration_news_index_path
    else
      render :edit
    end
  end

  def destroy
    @news.destroy
    redirect_to administration_news_index_path
  end

  private
  def set_article
    @news = Article.find(params[:id])
  end
end
