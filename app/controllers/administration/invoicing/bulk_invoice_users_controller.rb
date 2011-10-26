class Administration::Invoicing::BulkInvoiceUsersController < Administration::AdministrationController

  def update
    debtors_hash = {}
    params[:debtors_ids].to_a.map { |e| e.split(":") }.each do |owner_id, currency_id|
      debtors_hash[owner_id.to_i]||=[]
      debtors_hash[owner_id.to_i] << currency_id
    end

    Debtor.with_not_invoiced.where("owner_id in (?)", debtors_hash.keys).each do |debtor|
      if debtors_hash[debtor.owner_id].include?(debtor.currency_id.to_s)
        subscriber = debtor.owner.with_role
        Invoice.create(:currency_id => debtor.currency_id, :user_id => debtor.owner_id, :seller => subscriber.active_subscription.seller || Seller.default_for_country(subscriber.country.id))
      end
    end

    flash[:notice] = I18n.t("flash.bulk_invoice_users.update.notice")
    redirect_to administration_invoicing_upcoming_invoices_path
  end
end