class ActiveMerchantVoucherPaymentNotification < VoucherPaymentNotification

  include QuickpayPayment

  def self.process(params)
    deal_unique_id, number, user_id = params[:ordernumber].split("_")[1..3]
    voucher_number = VoucherNumber.where(:deal_unique_id => deal_unique_id, :number => number).first
    payment_notification = ActiveMerchantVoucherPaymentNotification.create!(:params => params, :buyer_id => user_id.to_i, :status => TRANSACTION_STATUSES[params[:qpstat]], :transaction_id => params[:transaction])

    if payment_notification.status == TRANSACTION_STATUSES[APPROVED] && params[:md5check] == payment_notification.calculate_md5_check(:capture, params) &&
            params[:merchantemail] == APP_CONFIG[:quickpay_email] && params[:amount].to_i == (voucher_number.deal.brutto_discounted_price(User.find(user_id).with_role)*100).to_i
      voucher_number.activate!(payment_notification)
    else
      voucher_number.cancel!
    end
  end
end