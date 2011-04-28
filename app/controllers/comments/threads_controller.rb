class Comments::ThreadsController < Comments::CommentsController
  set_tab "comments"

  before_filter :fetch_lead, :only => [:new, :create]

  before_filter :can_start_conversation?, :only => [:new]
  before_filter :check_role_for_update, :only => [:edit, :update]
  before_filter :check_role_for_destroy, :only => [:destroy]

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
    @threads = @threads.send(:descend_by_last_thread_created_at, true) unless params[:search].keys.detect { |key| params[:search][:key] == "true" and key.to_s.include?("scend_by") }
    @threads = @threads.paginate(:page => params[:page], :per_page => Comment.per_page)
  end

  def show
    @thread = current_user.comment_threads.find(params[:id])
  end

  def create
    attributes = params[:comment].merge(:user_id => current_user.id)
    if params[:lead_id]
      attributes.merge!({:commentable_type => 'AbstractLead', :commentable_id => params[:lead_id]})
    end
    @comment = current_user.comment_threads.new(attributes)
    if @comment.save
      @comment.reload
      @comment.assign_last_thread_created_at_to_root
    end
    #flash[:notice] = I18n.t("comments.threads.create.flash.notice")
  end

  def new; end

  def edit
    @comment = current_user.comment_threads.find(params[:id])
  end

  def update
    @comment = current_user.comment_threads.find(params[:id])
    @comment.update_attributes(params[:comment])
    #flash[:notice] = I18n.t("comments.threads.update.flash.notice")
  end

  def destroy
    @comment = current_user.comment_threads.find(params[:id])
    @thread_id = @comment.root.id
    @comment.destroy
    @thread = Comment.find_by_id(@thread_id)
  end

  protected

  def fetch_lead
    @lead = current_user.leads.find_by_id(params[:lead_id])
    raise CanCan::AccessDenied if @lead and !@lead.can_be_commented?
  end

  def check_role_for_update
    @thread = Comment.find_by_id(params[:id])
    unless current_user.has_role?(:admin) or (current_user.has_role?(:call_centre) and @thread and @thread.user.parent.present? and @thread.user.parent.with_role == current_user)
      raise CanCan::AccessDenied
    end
  end

  def check_role_for_destroy
    unless current_user.has_role?(:admin)
      raise CanCan::AccessDenied
    end
  end

end