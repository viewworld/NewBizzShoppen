class LeadUsers::BulkLeadPurchaseUpdateController < LeadUsers::LeadUserController

  def create
    if params[:lead_purchase_ids]
      current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).each do |lead_purchase|
        lead_purchase.state = params[:bulk_state] if params[:bulk_state]
        lead_purchase.save
      end
      flash[:notice] = I18n.t("lead_user.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully")
    end

    redirect_to :back
  end

end