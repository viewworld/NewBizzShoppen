module Controllers
  module LeadCertificationActions

    public

    def create
      @lead = current_user.leads.find(params[:lead_id])
      if @lead.can_be_certified?
        @lead.lead_certification_requests.create
        flash[:notice] = t("agent.lead_certifications.index.view.sent_successfully")
      elsif @lead.can_be_recertified?
        @lead.current_lcr.update_attribute(:state, LeadCertificationRequest::STATE_RECERTIFICATED)
        @lead.lead_certification_requests.create
        flash[:notice] = t("agent.lead_certifications.index.view.sent_successfully")
      else
        flash[:notice] = "You can not perform this action"
      end
      redirect_to send("#{current_user.role.to_s.pluralize}_#{model_name}_path".to_sym)
    end

  end
end