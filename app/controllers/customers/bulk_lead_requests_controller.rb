class Customers::BulkLeadRequestsController < Customers::CustomerController

  def destroy
    current_user.lead_requests.where("id in (?)", params[:lead_ids]).each(&:destroy) if params[:lead_ids]
    flash[:notice] = t("flash.bulk_lead_requests.actions.destroy.notice")
    redirect_to customers_lead_requests_path
  end
end