class Administration::Invoicing::PaymentTransactionsController < Administration::AdministrationController
  inherit_resources

  set_tab "payment_transactions"

  def new
    @payment_transaction = PaymentTransaction.new(:invoice_id => params[:invoice_id])
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_invoices] = true

    @search = PaymentTransaction.scoped_search(params[:search])
    @payment_transactions = @search.all.paginate :page => params[:page], :per_page => 20
  end
end