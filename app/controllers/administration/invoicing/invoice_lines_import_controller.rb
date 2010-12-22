class Administration::Invoicing::InvoiceLinesImportController < Administration::AdministrationController
  respond_to :js, :only => :new

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @invoice_lines_import = InvoiceLinesImport.new
    respond_to do |format|
      format.js
    end
  end

  def create
    invoice_id = InvoiceLinesImport.create(params[:invoice_lines_import])
    respond_to do |format|
      format.html{ redirect_to edit_invoicing_invoice_path(invoice_id)}
    end
  end

end




