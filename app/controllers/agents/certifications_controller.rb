class Agents::CertificationsController < Agents::AgentController
  inherit_resources

  set_tab "created_leads"

  protected

  def begin_of_association_chain
    current_user
  end

  public

  def create
    @lead = Lead.find(params[:lead_id])
    @lead.create_lead_certification_request
    flash[:notice] = t("agent.lead_certifications.index.view.sent_successfully")
    redirect_to agents_leads_path
  end

end
