class ActiveMerchantInvoicePaymentNotification < InvoicePaymentNotification

  include QuickpayPayment

  def self.process(params)
    payment_notification = ActiveMerchantInvoicePaymentNotification.create!(:params => params, :status => TRANSACTION_STATUSES[params[:qpstat]], :transaction_id => params[:transaction])
    if invoice = Invoice.find_by_id(params[:ordernumber].split("_").last)
      payment_notification.update_attribute(:buyer_id, invoice.user_id)
      process_invoice(invoice, payment_notification, status == TRANSACTION_STATUSES[APPROVED] && params[:md5check] == calculate_md5_check(:capture, params) &&
            params[:merchantemail] == APP_CONFIG[:quickpay_email] && params[:amount].to_i == (invoice.total * 100).to_i)
    end
  end
end