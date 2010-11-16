class LeadUsers::BulkLeadRequestsController < LeadUsers::LeadUserController

  def create
    current_user.lead_requests.create(params[:lead_ids].map{|l| {:lead_id => l}}) if params[:lead_ids]
    flash[:notice] = t("flash.bulk_lead_requests.actions.create.notice")
    redirect_to lead_users_lead_requests_path
  end

  def destroy
    current_user.lead_requests.where("id in (?)", params[:lead_ids]).each(&:destroy) if params[:lead_ids]
    flash[:notice] = t("flash.bulk_lead_requests.actions.destroy.notice")
    redirect_to lead_users_lead_requests_path
  end
end