class PaymentNotification < ActiveRecord::Base
  serialize :params

  belongs_to :buyer, :class_name => "User::LeadBuyer"
  belongs_to :payment_transaction

  before_create :check_if_duplicated
  after_create :generate_invoice

  private

  def check_if_duplicated
    if status == "Completed"
      unless PaymentNotification.first(:conditions => { :transaction_id => transaction_id, :buyer_id => buyer_id, :status => "Completed" }).nil?
        self.status = "Duplicated"
      end
    end
  end

  def generate_invoice
    if status == "Completed" and params[:receiver_email] == APP_CONFIG[:paypal_email] and params[:secret] == APP_CONFIG[:paypal_secret] and
       params[:mc_gross] == buyer.cart.total.to_s
      invoice = Invoice.create(:user_id => buyer.parent.present? ? buyer.parent_id : buyer.id, :paid_at => self.created_at)
      PaypalTransaction.create(:invoice => invoice, :payment_notification => self, :amount => buyer.cart.total, :paid_at => self.created_at)
      buyer.lead_purchases.in_cart.each do |lead_purchase|
        InvoiceLine.create(:invoice => invoice, :payable => lead_purchase, :name => lead_purchase.lead.header, :netto_price => lead_purchase.lead.price)
      end
    end
  end
end
