module CsvExportActions
  def create
    respond_to  do |format|
      format.html { send_data LeadPurchase.to_csv(*current_user.lead_purchases.where(:id => params[:lead_purchase_ids]).map(&:id)), :filename => "leads.csv" }
    end
  end
end