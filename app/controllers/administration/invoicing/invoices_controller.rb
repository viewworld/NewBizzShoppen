class Administration::Invoicing::InvoicesController < Administration::SuperadminController
  set_tab 'reports'
  set_subtab 'invoices'

  before_filter :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @search = Invoice.scoped_search(params[:search])
    @search.descend_by_sale_date_and_number = true unless params[:search]
    @invoices = @search.paginate(page: params[:page], per_page: 20)

    @total_invoices = Invoice.count
    @total_paid_invoices = Invoice.total_paid.size
    @total_unpaid_invoices = Invoice.total_not_paid.size
  end

  def show
    respond_to do |format|
      format.html
      format.pdf { send_file @invoice.store_pdf(current_user), type: 'application/pdf' }
    end
  end

  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      redirect_to edit_administration_invoicing_invoice_path(@invoice)
    else
      render :new
    end
  end

  def update
    if @invoice.update_attributes(invoice_params)
      @invoice.invoice_lines.build if @invoice.invoice_lines.blank?
      redirect_to administration_invoicing_invoice_path
    else
      render :edit
    end
  end

  def destroy
    @invoice.destroy
    redirect_to administration_invoicing_invoice_path
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params[:invoice]
  end
end
