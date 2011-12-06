class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create]

  def create
    if respond_to?(params[:txn_type])
      send params[:txn_type]
    else
      upn = UnknownPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
      EmailNotification.notify("Unhandled txn_type: #{params[:txn_type]}", "<p>UnknownPaymentNotification: #{upn.id}</p> <>br /> Backtrace: <p>#{upn.params.inspect}</p>")
    end
    render :nothing => true
  end

  private

  def cart
    params[:invoice].to_s.slice!(0..7)
    payment_notification = CartPaymentNotification.create!(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if payment_notification.status == "Completed" &&
        params[:secret] == APP_CONFIG[:paypal_secret] &&
        params[:receiver_email] == APP_CONFIG[:paypal_email] &&
        BigDecimal.new(params[:mc_gross]) == payment_notification.supplier.cart.total
      payment_notification.supplier.cart.paid!
    end
  end

  def recurring_payment_profile_created
    SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
  end

  def recurring_payment_expired
    SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
  end

  def recurring_payment_profile_cancel
    spn = SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    subscription = Subscription.where("paypal_profile_id = ? and paypal_invoice_id = ?", params[:recurring_payment_id], params[:rp_invoice_id]).first
    if subscription
      subscription.cancel!
    else
      EmailNotification.notify("recurring_payment_profile_cancel: Subscription not found", "<p>SubscriptionPaymentNotification: #{spn.id}</p> <>br /> Backtrace: <p>#{spn.params.inspect}</p>")
    end
  end

  def recurring_payment
    spn = SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    if subscription = Subscription.for_recurring_payment(params[:recurring_payment_id], params[:rp_invoice_id]).first
      if subscription_sub_period = subscription.subscription_sub_periods.with_paypal_txn_id(params[:txn_id]).first
        subscription_sub_period.update_recurring_payment_status(spn)
      else
        subscription.find_payable_subscription_sub_period(spn)
      end
    else
      EmailNotification.notify("recurring_payment: Matching subscription not found", "<p>SubscriptionPaymentNotification: #{spn.id}</p> <>br /> Backtrace: <p>#{spn.params.inspect}</p>")
    end
  end

end
