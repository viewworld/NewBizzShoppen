module LeadCertificationActions

  public

  def create
    @lead = current_user.leads.find(params[:lead_id])
    @lead.create_lead_certification_request
    flash[:notice] = t("agent.lead_certifications.index.view.sent_successfully")
    redirect_to send("#{current_user.role.to_s.pluralize}_leads_path".to_sym)
  end
end