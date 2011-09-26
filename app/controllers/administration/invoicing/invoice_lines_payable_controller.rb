class Administration::Invoicing::InvoiceLinesPayableController < Administration::AdministrationController
  respond_to :js, :only => :new
  
  def new
    @invoice_lines = InvoiceLine.where(:id => params[:invoice_lines_id])
  end
end




