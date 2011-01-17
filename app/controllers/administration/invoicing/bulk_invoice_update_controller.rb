class Administration::Invoicing::BulkInvoiceUpdateController < Administration::AdministrationController
  def update
    if params[:invoice_ids]
      Invoice.where(:id => params[:invoice_ids]).each do |invoice|
        invoice.update_attributes({ :paid_at => Time.now, :cash_flow => invoice.total }) unless invoice.paid?
      end
      flash[:notice] = I18n.t("flash.bulk_invoice_update.update.notice")
    end
    redirect_to administration_invoicing_invoices_path
  end
end