class InvoicePaymentNotification < PaymentNotification
  def self.process_invoice(invoice, payment_notification, payment_is_completed)
    payment_type = payment_notification.is_a?(PaypalInvoicePaymentNotification) ? "Paypal" : "ActiveMerchant"
    if payment_is_completed
      invoice.update_attribute(:paid_at, Time.now)
      if ssp = SubscriptionSubPeriod.where(:invoice_id => invoice.id).first
        ssp.update_attribute(:payment_paid_manual, true)
      else
        EmailNotification.notify("cart: Matching subperiod for given invoice not found", "<p>#{payment_type}SubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>Invoice: #{invoice.id}</p> <p>#{payment_notification.params.inspect}</p>")
      end
      transaction_klass = payment_notification.is_a?(PaypalInvoicePaymentNotification) ? PaypalTransaction : ActiveMerchantTransaction
      transaction_klass.create(:invoice => invoice, :payment_notification => payment_notification, :amount => invoice.total, :paid_at => payment_notification.created_at)
    else
      EmailNotification.notify("cart: Matching invoice not found", "<p>#{payment_type}SubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>#{payment_notification.params.inspect}</p>")
    end
  end
end