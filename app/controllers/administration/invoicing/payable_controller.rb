class Administration::Invoicing::PayableController <  Administration::AdministrationController
  respond_to :js, :only => :new
  
  def new
    @invoice_lines = InvoiceLine.find(params[:invoice_lines_id])
  end
end




