class Administration::Invoicing::BulkInvoiceUsersController < Administration::AdministrationController

  def update
    debtors_hash = {}
    params[:debtors_ids].map { |e| e.split(":") }.each do |owner_id, currency_id|
      debtors_hash[owner_id.to_i]||=[]
      debtors_hash[owner_id.to_i] << currency_id
    end

    LeadPurchase.with_not_invoiced.where("lead_purchases.owner_id in (?)", debtors_hash.keys).each do |lead_purchase|
      if debtors_hash[lead_purchase.owner_id].include?(lead_purchase.currency_id)
        Invoice.create(:currency_id => lead_purchase.currency_id, :user_id => lead_purchase.owner_id, :seller => Seller.default_for_country(lead_purchase.owner.country.id))
      end
    end

    flash[:notice] = I18n.t("flash.bulk_invoice_users.update.notice")
    redirect_to administration_invoicing_upcoming_invoices_path
  end
end