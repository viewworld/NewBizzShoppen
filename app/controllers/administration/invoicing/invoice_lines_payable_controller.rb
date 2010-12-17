class Administration::Invoicing::InvoiceLinesPayableController < Administration::AdministrationController
  respond_to :js, :only => :new
  
  def new
    @invoice_lines = InvoiceLine.find(:all, :conditions => { :id => params[:invoice_lines_id]})
  end
end




