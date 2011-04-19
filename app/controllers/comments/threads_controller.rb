class Comments::ThreadsController < Comments::CommentsController
  set_tab "comments"

  before_filter :fetch_lead, :only => [:new, :create]

  def index
    params[:search] ||= {}
    @threads = current_user.comment_threads
    params[:search].each_pair do |key, value|
      @threads = @threads.send(key, value)
    end
    @threads = @threads.paginate(:page => params[:page])
  end

  def show
    @thread = current_user.comment_threads.find(params[:id])
  end

  def create
    attributes = params[:comment].merge(:user_id => current_user.id)
    if params[:lead_id]
      attributes.merge!({:commentable_type => 'Lead', :commentable_id => params[:lead_id]})
    end
    @threads = current_user.comment_threads.new(attributes)
    if @threads.save
      if params[:lead_id]
        redirect_to comments_lead_thread_path(params[:lead_id], @threads)
      else
        redirect_to :back
      end
      flash[:notice] = I18n.t("comments.threads.create.flash.notice")
    else
      render 'new'
    end

  end

  def new
    @threads = Comment.new
  end

  protected

  def fetch_lead
    @lead = current_user.leads.find_by_id(params[:lead_id])
  end

end