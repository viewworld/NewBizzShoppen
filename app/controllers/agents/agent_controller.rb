class Agents::AgentController < SecuredController
  def current_user
    #Second request is cached so only class-casting occurs
    @agent ||= ::User::Agent.find(super.id)
  end

  private

  def authorize_user_for_namespace!
    authorize_role(:agent)
  end
end
