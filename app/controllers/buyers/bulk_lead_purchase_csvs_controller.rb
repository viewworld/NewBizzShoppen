class Buyers::BulkLeadPurchaseCsvsController < Buyers::BuyerController

  def create

      respond_to  do |format|
        format.html { send_data LeadPurchase.to_csv(*params[:lead_purchase_ids]), :filename => "leads.csv" }
      end
  end

end