class PaymentNotificationsController < ApplicationController
  include ActionView::Helpers::NumberHelper
  protect_from_forgery :except => [:create]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create]

  def create
    params[:invoice].to_s.slice!(0..7)
    payment_notification = PaymentNotification.create!(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    puts "#{payment_notification.status} == \"Completed\" &&  #{params[:secret]} == #{APP_CONFIG[:paypal_secret]} && #{params[:receiver_email]} == #{APP_CONFIG[:paypal_email]} && #{params[:mc_gross]} == #{ActionView::Helpers::NumberHelper.number_with_precision(payment_notification.buyer.cart.total, :precision => 2)}"
    if payment_notification.status == "Completed" &&
        params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        params[:mc_gross] == ActionView::Helpers::NumberHelper.number_with_precision(payment_notification.buyer.cart.total, :precision => 2)
      payment_notification.buyer.cart.paid!
    end
    render :nothing => true
  end

end
