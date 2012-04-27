class ActiveMerchantCartPaymentNotification < CartPaymentNotification
  before_create :check_if_duplicated
  after_create :generate_invoice

  include QuickpayPayment

  private

  def check_if_duplicated
    if status == "Completed"
      unless ActiveMerchantCartPaymentNotification.first(:conditions => { :transaction_id => transaction_id, :buyer_id => buyer_id, :status => "Completed" }).nil?
        self.status = "Duplicated"
      end
    end
  end

  def generate_invoice
    if completed?
      invoice = Invoice.create(:user_id => supplier.parent.present? ? supplier.parent_id : supplier.id, :paid_at => self.created_at, :seller => Seller.default, :currency => supplier.cart.currency)
      PaypalTransaction.create(:invoice => invoice, :payment_notification => self, :amount => supplier.cart.total, :paid_at => self.created_at)
    end
  end


  public

  def completed?
   status == TRANSACTION_STATUSES[APPROVED] && params[:md5check] == calculate_md5_check(:capture, params) &&
        params[:merchantemail] == APP_CONFIG[:quickpay_email] && params[:amount].to_i == supplier.cart.total_in_cents
  end

  def self.process(params)
    params[:ordernumber].to_s.slice!(0..7)
    payment_notification = ActiveMerchantCartPaymentNotification.create!(:params => params, :buyer_id => params[:ordernumber].to_i, :status => TRANSACTION_STATUSES[params[:qpstat]], :transaction_id => params[:transaction])
    if payment_notification.completed?
      payment_notification.supplier.cart.paid!
    end
  end
end