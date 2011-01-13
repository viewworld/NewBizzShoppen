class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]

  def create
    params[:invoice].to_s.slice!(0..7)
    payment_notification = PaymentNotification.create!(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if payment_notification.status == "Completed" &&
        params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        params[:mc_gross] == current_user.cart.total.to_s
      payment_notification.buyer.cart.paid!
    end
    render :nothing => true
  end

end
