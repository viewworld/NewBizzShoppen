class PaypalTransaction < PaymentTransaction
  #validates_presence_of :payment_notification_id

  def can_be_edited?
    false
  end
end