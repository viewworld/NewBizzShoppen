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
    params[:search][:with_leads] = "1"
    @threads = current_user.comment_threads
    params[:search].each_pair do |key, value|
      @threads = @threads.send(key, value)
    end
    unless params[:search][:with_user].present?
      @threads = @threads.roots
    end
    @threads = @threads.send(:descend_by_last_thread_created_at, true) unless params[:search].keys.detect { |key| params[:search][:key] == "true" and key.to_s.include?("scend_by") }
    @threads = @threads.paginate(:show_all => params[:show_all], :page => params[:page], :per_page => Comment.per_page)
    @categories = LeadCategory.with_comment_threads
  end

  def show
    @thread = current_user.comment_threads.find(params[:id])
    @thread.self_and_descendants.unread_by_user(current_user).each { |c| c.comment_readers.create(:user => current_user) }
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
    respond_to do |format|
      format.js
      format.html
    end
  end

  def update
    @comment = current_user.comment_threads.find(params[:id])
    @comment.update_attributes(params[:comment])
    respond_to do |format|
      format.js
      format.html
    end
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
