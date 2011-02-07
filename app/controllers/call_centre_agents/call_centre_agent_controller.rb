class CallCentreAgents::CallCentreAgentController < SecuredController
  def current_user
    @call_centre_agent ||= ::User::CallCentreAgent.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:call_centre_agent)
  end
end