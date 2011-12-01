class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create]

  def create
    SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    send params[:txn_type]
    render :nothing => true
  end

  private

  def cart
    params[:invoice].to_s.slice!(0..7)
    payment_notification = PaymentNotification.create!(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if payment_notification.status == "Completed" &&
        params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        BigDecimal.new(params[:mc_gross]) == payment_notification.supplier.cart.total
      payment_notification.supplier.cart.paid!
    end
  end

  def recurring_payment_profile_created

  end

  def recurring_payment_profile_cancel

  end

  def recurring_payment
    #time = Time.parse(params[:payment_date])
    #subscription_sub_period = SubscriptionSubPeriod.where("subscriptions.paypal_profile_id = ? and subscriptions.paypal_invoice_id = ? and billing_date = ?",
    #                                           params[:recurring_payment_id], params[:rp_invoice_id], time.to_date)
    #unless subscription_sub_period.paypal_paid_auto? or subscription_sub_period.paypal_paid_manual?
    #  subscription_sub_period.payment_notification.create(:params => params, :status => params[:payment_status], :transaction_id => params[:txn_id])
    #  subscription_sub_period.update_attribute(:paypal_paid_auto, true)  if params[:payment_status] == "Completed"
    #end
  end

end
