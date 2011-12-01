class PaymentNotification < ActiveRecord::Base
  serialize :params

  belongs_to :supplier, :foreign_key => "buyer_id", :class_name => "User::LeadSupplier"
  has_one :payment_transaction

  before_create :check_if_duplicated
  after_create :generate_invoice

  validates_presence_of :supplier

  private

  def check_if_duplicated
    if status == "Completed"
      unless PaymentNotification.first(:conditions => {:transaction_id => transaction_id, :buyer_id => buyer_id, :status => "Completed"}).nil?
        self.status = "Duplicated"
      end
    end
  end

  def generate_invoice
    if status == "Completed" and params[:receiver_email] == APP_CONFIG[:paypal_email] and params[:secret] == APP_CONFIG[:paypal_secret] and
        BigDecimal(params[:mc_gross].to_s) == BigDecimal(supplier.cart.total.to_s)
      invoice = Invoice.create(:user_id => supplier.parent.present? ? supplier.parent_id : supplier.id, :paid_at => self.created_at, :seller => Seller.default, :currency => supplier.cart.currency)
      PaypalTransaction.create(:invoice => invoice, :payment_notification => self, :amount => supplier.cart.total, :paid_at => self.created_at)
    end
  end
end