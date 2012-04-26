class CartPaymentNotification < PaymentNotification
  belongs_to :supplier, :foreign_key => "buyer_id", :class_name => "User::LeadSupplier"
  has_one :payment_transaction, :foreign_key => "payment_notification_id"

  before_create :check_if_duplicated
  after_create :generate_invoice

  validates_presence_of :supplier


end
