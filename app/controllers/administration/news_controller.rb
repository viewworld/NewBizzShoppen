class Administration::NewsController < Administration::AdministrationController
  include Controllers::CommonActions

  set_tab 'content'
  set_subtab 'news'

  before_filter :set_article, only: [:show, :edit, :update, :destroy]

  def index
    params[:search] ||= {}
    params[:search][:with_subclass] ||= 'Article::News'

    @search = Article.scoped_search(params[:search])
    @news = @search.paginate(show_all: params[:show_all], page: params[:page])
  end

  def new
    @news = Article.new
  end

  def create
    @news = "Article::News::#{params[:subclass].classify}".constantize.new(article_params)

    common_save(@news, success: { redirect: administration_news_index_path })
  end

  def update
    @news.assign_attributes(article_params)

    common_save(@news, success: { redirect: administration_news_index_path })
  end

  def destroy
    common_destroy(@news, success: { redirect: administration_news_index_path })
  end

  private

  def set_article
    @news = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content, :published)
  end
end
