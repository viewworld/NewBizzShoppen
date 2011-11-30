class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create]

  def create
    if subscription_notification = SubscriptionPaymentNotification.find_by_token(params[:invoice])
      subscription_notification.update_attributes(:params => params, :status => params[:payment_status], :transaction_id => params[:txn_id])
    else
      params[:invoice].to_s.slice!(0..7)
      payment_notification = PaymentNotification.create!(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
      if payment_notification.status == "Completed" &&
          params[:secret] == APP_CONFIG[:paypal_secret] &&
          params[:receiver_email] == APP_CONFIG[:paypal_email] &&
          BigDecimal.new(params[:mc_gross]) == payment_notification.supplier.cart.total
        payment_notification.supplier.cart.paid!
      end
    end
    render :nothing => true
  end

end
