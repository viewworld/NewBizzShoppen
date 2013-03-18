class CallCentres::NewsController < CallCentres::CallCentreController
  inherit_resources

  set_tab "news"

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
    @news = "Article::News::CallCentre".constantize.new(:resource_id => current_user.id, :resource_type => "User::CallCentre")
    create! do |success,failure|
      success.html { render :action => :edit }
      failure.html { redirect_to call_centres_news_index_path }
    end
  end

  def show
    @news = Article.find(params[:id])
    show!
  end

  def destroy
    @news = Article.find(params[:id])
    super do |format|
      format.html { redirect_to call_centres_news_index_path }
    end
  end

  protected

  def collection
    @search = Article.scoped_search(params[:search])
    @news = @search.build_relation.for_call_centre(current_user).paginate(:show_all => params[:show_all], :page => params[:page])
  end

end