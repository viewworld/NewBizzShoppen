class PaypalInvoicePaymentNotification < InvoicePaymentNotification
  def self.process(params)
    payment_notification = PaypalInvoicePaymentNotification.create!(:params => params, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if invoice = Invoice.find_by_id(params[:invoice].split("_").last)
      payment_notification.update_attribute(:buyer_id, invoice.user_id)
      process_invoice(invoice, payment_notification, payment_notification.status == "Completed" &&
              params[:secret] == APP_CONFIG[:paypal_secret] &&
              params[:receiver_email] == APP_CONFIG[:paypal_email] &&
              BigDecimal.new(params[:mc_gross]) == invoice.total)
    end
  end
end