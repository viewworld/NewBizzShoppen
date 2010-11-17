#TODO try to refactor to skip the Update part in naming
class Buyers::BulkLeadPurchaseUpdateController < Buyers::BuyerController

  def create
    if params[:lead_purchase_ids]
      current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).each do |lead_purchase|
        lead_purchase.state = params[:bulk_state] if params[:bulk_state]
        lead_purchase.assignee_id = params[:bulk_assignee_id] if params[:bulk_assignee_id]
        lead_purchase.response_deadline = params[:bulk_response_deadline] if params[:bulk_response_deadline]
        lead_purchase.save
      end
      flash[:notice] = I18n.t("buyer.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully")
    end

    redirect_to :back
  end

end