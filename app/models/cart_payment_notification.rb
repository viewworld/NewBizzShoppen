class CartPaymentNotification < PaymentNotification
  belongs_to :supplier, :foreign_key => "buyer_id", :class_name => "User::LeadSupplier"
  has_one :payment_transaction, :foreign_key => "payment_notification_id"

  validates_presence_of :supplier


end
