class Customers::BulkLeadRequestsController < Customers::CustomerController

  def update
    current_user.lead_requests.where("id in (?)", params[:lead_ids]).each do |lead_request|
      lead_request.accept!
    end
    flash[:notice] = t("flash.bulk_lead_requests.update.notice")
    redirect_to customers_lead_requests_path
  end

  def destroy
    current_user.lead_requests.where("id in (?)", params[:lead_ids]).each(&:destroy) if params[:lead_ids]
    flash[:notice] = t("flash.bulk_lead_requests.destroy.notice")
    redirect_to customers_lead_requests_path
  end
end