class Comments::ThreadsController < Comments::CommentsController
  set_tab "comments"

  before_filter :fetch_lead, :only => [:new, :create]

  set_tab "comments"

  before_filter :can_start_conversation?, :only => [:new]
  before_filter :set_referer, :only => [:edit]
  before_filter :check_role_for_update, :only => [:edit, :update]

  private

  def can_start_conversation?
    raise CanCan::AccessDenied if current_user.agent?
  end

  public

  def index
    params[:search] ||= {}
    @threads = current_user.comment_threads.roots
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
      attributes.merge!({:commentable_type => 'AbstractLead', :commentable_id => params[:lead_id]})
    end
    @thread = current_user.comment_threads.new(attributes)
    if @thread.save
      if params[:lead_id]
        redirect_to comments_lead_thread_path(params[:lead_id], @thread)
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

  def edit
    @thread = current_user.comment_threads.find(params[:id])
  end

  def update
    @thread = current_user.comment_threads.find(params[:id])
    if @thread.update_attributes(params[:comment])
      flash[:notice] = I18n.t("comments.threads.update.flash.notice")
      if session[:comment_referer]
        redirect_to session[:comment_referer]
      else
        redirect_to comments_lead_thread_path(@thread.commentable_id, @threads)
      end
      session[:comment_referer] = nil
    else
      render 'edit'
    end
  end

  def destroy
    @thread = current_user.comment_threads.find(params[:id])
  end

  protected

  def fetch_lead
    @lead = current_user.leads.find_by_id(params[:lead_id])
  end

  def set_referer
    session[:comment_referer] = request.referer
  end

  def check_role_for_update
    unless current_user.has_any_role?(:admin, :call_centre)
      flash[:alert] = I18n.t("comments.threads.update.flash.alert")
      redirect_to :back
    end
  end

end