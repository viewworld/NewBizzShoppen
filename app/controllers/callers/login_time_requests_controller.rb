class Callers::LoginTimeRequestsController < Callers::CallerController
  inherit_resources

  def create
    create! do |success, failure|
      success.html { redirect_to new_callers_login_time_request_path }
    end
  end

  def approve
    resource.approver_id = current_user.id
    resource.approve!
    redirect_to :back
  end

  def reject
    resource.approver_id = current_user.id
    resource.reject!
    redirect_to :back
  end
end