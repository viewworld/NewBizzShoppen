class Administration::Invoicing::PaymentTransactionsController < Administration::SuperadminController
  inherit_resources

  set_tab "reports"
  set_subtab "payment_transactions"

  def new
    @payment_transaction = ManualTransaction.new(:invoice_id => params[:invoice_id])
  end

  def create
    @payment_transaction = ManualTransaction.new(params[:manual_transaction])
    create! do |success, failure|
      success.html { redirect_to administration_invoicing_payment_transactions_path }
      failure.html { render(:action => "new") }
    end
  end

  def update
#    @payment_transaction = ManualTransaction.find(params[:id])
#    if @payment_transaction.update_attributes(params[:manual_transaction])
    update! do |success, failure|
      success.html { redirect_to administration_invoicing_payment_transactions_path }
      failure.html { render(:action => "edit") }
    end
  end

  protected

  def collection
    params[:search] ||= {}
    params[:search][:with_invoices] = true

    @search = PaymentTransaction.scoped_search(params[:search])
    @payment_transactions = @search.paginate :page => params[:page], :per_page => 20
  end
end