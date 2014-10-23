class Administration::Invoicing::PaymentTransactionsController < Administration::SuperadminController
  set_tab 'reports'
  set_subtab 'payment_transactions'

  before_filter :set_payment_transaction, only: [:edit, :update]

  def index
    params[:search] ||= {}
    params[:search][:with_invoices] = true

    @search = PaymentTransaction.scoped_search(params[:search])
    @payment_transactions = @search.paginate(page: params[:page], per_page: 20)
  end

  def new
    @payment_transaction = ManualTransaction.new(invoice_id: params[:invoice_id])
  end

  def create
    @payment_transaction = ManualTransaction.new(transaction_params)

    if @payment_transaction.save
      redirect_to administration_invoicing_payment_transactions_path
    else
      render :new
    end
  end

  def update
    if @payment_transaction.update_attributes(transaction_params)
      redirect_to redirect_to administration_invoicing_payment_transactions_path
    else
      render :edit
    end
  end

  private

  def set_payment_transaction
    @payment_transaction = ManualTransaction.find(params[:id])
  end

  def transaction_params
    params.require(:manual_transaction).permit(:amount, :paid_at, :invoice_id)
  end
end
