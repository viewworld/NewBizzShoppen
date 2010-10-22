class Agents::LeadsController < Agents::AgentController
  inherit_resources

  protected

  def begin_of_association_chain
    "User::#{current_user.role.to_s.camelize}".constantize.find(current_user.id)
  end

  def collection
    @leads ||= end_of_association_chain.paginate(:page => params[:page])
  end

  public

  def create
    create! do |success, failure|
      success.html { redirect_to agents_leads_path }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to agents_leads_path }
    end
  end
end
