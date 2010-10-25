class Agents::LeadsController < Agents::AgentController
  inherit_resources

  protected

  def begin_of_association_chain
    current_user
  end

  def collection
    @leads ||= end_of_association_chain.paginate(:page => params[:page])
  end

  public

  def create
    create! do |success, failure|
      success.html {
        unless params[:commit_continue].blank?
          redirect_to new_agents_lead_path
        else
          redirect_to agents_leads_path
        end
      }
    end
  end

  def update
    update! do |success, failure|
      success.html { redirect_to agents_leads_path }
    end
  end
end
