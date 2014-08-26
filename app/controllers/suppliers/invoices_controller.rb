class Suppliers::InvoicesController < Suppliers::AdvancedSupplierController
  inherit_resources

  def show
    @invoice = Invoice.for_user(current_user).find(params[:id])
    super do |format|
      format.html
      format.pdf { send_file @invoice.store_pdf(current_user), :type => 'application/pdf'}
    end
  end

  protected

  def collection
    @search = Invoice.scoped_search(params[:search])
    @search.for_user = current_user
    @search.descend_by_sale_date_and_number = true unless params[:search]
    @invoices = @search.includes(:currency).paginate :page => params[:page], :per_page => 20
  end

end