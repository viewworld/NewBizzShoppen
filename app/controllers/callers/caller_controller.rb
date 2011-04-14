class Callers::CallerController < SecuredController
  def current_user
    @user ||= ::User::CallCentre.find_by_id(super.id)
    @user ||= ::User::CallCentreAgent.find_by_id(super.id)
    @user ||= ::User::Admin.find_by_id(super.id)
    @user ||= ::User::Agent.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre, :call_centre_agent, :admin, :agent)
  end
end