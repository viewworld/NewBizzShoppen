#TODO try to refactor to skip the Update part in naming
class Suppliers::BulkLeadPurchaseUpdateController < Suppliers::BasicSupplierController

  def create
    if params[:lead_purchase_ids]
      current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).each do |lead_purchase|
        lead_purchase.state = params[:bulk_state] unless params[:bulk_state].blank?
        lead_purchase.assignee_id = params[:bulk_assignee_id] unless params[:bulk_assignee_id].blank?
        lead_purchase.response_deadline = params[:bulk_response_deadline] unless params[:bulk_response_deadline].blank?
        lead_purchase.response_deadline = nil if params[:bulk_clear_response_dates]
        lead_purchase.rating_level = params[:bulk_rating_level] unless params[:bulk_rating_level].blank?
        lead_purchase.rating_reason = params[:bulk_rating_reason] unless params[:bulk_rating_reason].blank?
        lead_purchase.save
      end
      flash[:notice] = I18n.t("supplier.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully")
    end

    redirect_to :back
  end

end
