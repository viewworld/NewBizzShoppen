class Administration::Invoicing::InvoicesController < Administration::AdministrationController
  inherit_resources
#  defaults :redirects => {:create => :edit, :update => :show}
#  set_search_persistence :name => "invoices_filter"

  def edit
    super do |format|
      format.html {@invoice.invoice_lines.build if @invoice.invoice_lines.blank? }
    end
  end

  def show
    super do |format|
      format.html
      format.pdf { send_file @invoice.store_pdf, :type => 'application/pdf'}
    end
  end

  protected

  def collection
    @search = Invoice.scoped_search(params[:search])
    @search.order ||= :descend_by_sale_date
    @invoices = @search.all.paginate :page => params[:page], :per_page => 20
  end

end