class PaymentNotificationDecorator < ApplicationDecorator
  def txn_type
    object.params["txn_type"] if object.params
  end

  def created_at
    l object.created_at.localtime, format: "%d-%m-%Y %H:%M"
  end
end
