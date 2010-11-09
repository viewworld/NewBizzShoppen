class Buyers::BulkLeadPurchaseUpdateController < Buyers::BuyerController

  def create
    if params[:lead_purchase_ids]
      current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).each do |lead_purchase|
        lead_purchase.state = params[:bulk_state] if params[:bulk_state]
        lead_purchase.assignee_id = params[:bulk_assignee_id] if params[:bulk_assignee_id]
        lead_purchase.save
      end
    end

    redirect_to :back
  end

end