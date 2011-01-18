class Administration::Invoicing::InvoicesController < Administration::AdministrationController
  inherit_resources
#  defaults :redirects => {:create => :edit, :update => :show}
#  set_search_persistence :name => "invoices_filter"

  def create
    @invoice = Invoice.new(params[:invoice])
    create! do |success, failure|
      success.html { redirect_to edit_administration_invoicing_invoice_path(@invoice) }
    end
  end

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
    @search.descend_by_sale_date_and_number = true unless params[:search]
    @invoices = @search.all.paginate :page => params[:page], :per_page => 20
  end

end