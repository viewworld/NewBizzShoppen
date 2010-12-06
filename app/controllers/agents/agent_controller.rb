class Agents::AgentController < SecuredController
  def current_user
    @agent ||= ::User::Agent.find_by_id(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:agent)
  end
end
