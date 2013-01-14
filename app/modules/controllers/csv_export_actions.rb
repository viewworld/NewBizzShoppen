module CsvExportActions
  def create
    respond_to  do |format|
      lead_purchase_ids = params[:lead_purchase_ids].present? ? current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).map(&:id) : current_user.lead_purchases.with_leads.map(&:id)
      format.html { send_data LeadPurchase.to_csv(*lead_purchase_ids), :filename => "leads.csv" }
    end
  end
end