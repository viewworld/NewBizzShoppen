class Callers::LoginTimeRequestsController < Callers::CallerController
  inherit_resources

  set_tab 'reports'
  set_subtab 'login_time_requests'

  def collection
    @all_requests = current_user.available_login_time_requests
    params[:search] ||= {}
    params[:search][:with_state] ||= 'new'
    @search = @all_requests.scoped_search(params[:search])
    @requests = @search.order("created_at DESC").paginate(:page => params[:page], :per_page => 15, :show_all => params[:show_all])
  end

  def create
    create! do |success, failure|
      success.html { redirect_to callers_login_time_requests_path }
    end
  end

  def approve
    authorize_manage_rights resource
    resource.approver_id = current_user.id
    resource.approve!
    redirect_to :back
  end

  def reject
    authorize_manage_rights resource
    resource.approver_id = current_user.id
    resource.reject!
    redirect_to :back
  end

  def edit
    authorize_manage_rights resource
  end

  def update
    update! do |success, failure|
      success.html { redirect_to callers_login_time_requests_path }
    end
  end

  def new
    new! do
      resource.start_time ||= Time.now - 1.hour
      resource.end_time ||= Time.now
    end
  end

end