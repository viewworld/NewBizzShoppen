class Comments::ThreadsController < Comments::CommentsController

  set_tab "comments"

  before_filter :can_start_conversation?, :only => [:new]

  private

  def can_start_conversation?
    raise CanCan::AccessDenied if current_user.agent?
  end

  public

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
    @thread = current_user.comment_threads.new(attributes)
    if @thread.save
      flash[:notice] = "successfully created"
    else
      flash[:alert] = "uuu  something went wrong my dear #{@thread.errors.full_messages}"
    end
    if params[:lead_id]
      redirect_to comments_lead_thread_path(params[:lead_id],@thread)
    else
      redirect_to :back
    end
  end

  def new
    @lead = current_user.leads.find(params[:lead_id])
  end

end