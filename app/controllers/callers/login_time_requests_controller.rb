class Callers::LoginTimeRequestsController < Callers::CallerController
  inherit_resources

  set_tab 'campaigns'

  def create
    create! do |success, failure|
      success.html { redirect_to new_callers_login_time_request_path }
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
      success.html { redirect_to new_callers_login_time_request_path }
    end
  end

  def new
    @requests = current_user.available_login_time_requests.paginate(:page => params[:page], :per_page => 15, :show_all => params[:show_all])
    new! do
      resource.start_time ||= Time.now - 1.hour
      resource.end_time ||= Time.now
    end
  end

end