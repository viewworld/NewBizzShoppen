class InvoicePaymentNotification < PaymentNotification
  def self.process(params)
    payment_notification = InvoicePaymentNotification.create!(:params => params, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if invoice = Invoice.find_by_id(params[:invoice].split("_").last)
      payment_notification.update_attribute(:buyer_id, invoice.user_id)
      if payment_notification.status == "Completed" &&
        params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        BigDecimal.new(params[:mc_gross]) == invoice.total

        invoice.update_attribute(:paid_at, Time.now)

        if ssp = SubscriptionSubPeriod.where(:invoice_id => invoice.id).first
          ssp.update_attribute(:payment_paid_manual, true)
        else
          EmailNotification.notify("cart: Matching subperiod for given invoice not found", "<p>SubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>Invoice: #{invoice.id}</p> <p>#{payment_notification.params.inspect}</p>")
        end
        PaypalTransaction.create(:invoice => invoice, :payment_notification => payment_notification, :amount => invoice.total, :paid_at => payment_notification.created_at)
      end
    else
       EmailNotification.notify("cart: Matching invoice not found", "<p>SubscriptionPaymentNotification: #{payment_notification.id}</p> <>br /> Backtrace: <p>#{payment_notification.params.inspect}</p>")
    end
  end
end