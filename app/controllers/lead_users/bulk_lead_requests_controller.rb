class LeadUsers::BulkLeadRequestsController < LeadUsers::LeadUserController

  def create
    leads_ids = params[:lead_ids] || []
    current_user.lead_requests.create(leads_ids.map{|l| {:lead_id => l}})
    flash[:notice] = t("flash.bulk_lead_requests.actions.create.notice")
    redirect_to lead_users_lead_requests_path
  end
end