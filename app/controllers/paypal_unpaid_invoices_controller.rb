class PaypalUnpaidInvoicesController < SecuredController
  before_filter :fetch_objects
  before_filter :authorize_for_controller!
  before_filter :redirect_to_paypal_confirmation, :except => [:show]

  def show

  end

  protected

  def authorize_for_controller!
    authorize_role(:supplier, :category_supplier, :member)
  end

  def fetch_objects
    @invoice = Invoice.where(:user_id => current_user.id).find_by_id(params[:id])

    if !@invoice or @invoice.paid?
      flash[:notice] = I18n.t("paypal_unpaid_invoices.flash.notice.invoice_already_paid", :number => @invoice.full_number) if @invoice and @invoice.paid?
      redirect_to root_path
    end
  end
end