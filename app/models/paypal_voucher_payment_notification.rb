class PaypalVoucherPaymentNotification < VoucherPaymentNotification
  def self.process(params)
    deal_unique_id, number, user_id = params[:invoice].split("_")[1..3]
    voucher_number = VoucherNumber.where(:deal_unique_id => deal_unique_id, :number => number).first
    payment_notification = VoucherPaymentNotification.create!(:params => params, :buyer_id => user_id.to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if payment_notification.status == "Completed" &&
        params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        BigDecimal.new(params[:mc_gross]) == voucher_number.deal.brutto_discounted_price(User.find(user_id).with_role)
      voucher_number.activate!(payment_notification)
    else
      voucher_number.cancel!
    end
  end
end