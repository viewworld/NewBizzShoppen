class PaymentNotificationsController < ApplicationController
  protect_from_forgery :except => [:create, :show]
  before_filter :authorize_with_http_basic_for_staging, :except => [:create, :show]

  def create
    if respond_to?(params[:txn_type], true)
      send params[:txn_type]
    else
      upn = UnknownPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
      EmailNotification.notify("Unhandled txn_type: #{params[:txn_type]}", "<p>UnknownPaymentNotification: #{upn.id}</p> <>br /> Backtrace: <p>#{upn.params.inspect}</p>")
    end
    render :nothing => true
  end

  def show
    create
  end

  private

  def cart
    params[:invoice].match(/^v_/) ? VoucherPaymentNotification.process(params) : CartPaymentNotification.process(params)
  end

  def recurring_payment_profile_created
    SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
  end

  def recurring_payment_expired
    SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
  end

  def recurring_payment_profile_cancel
    Subscription.canceled_in_paypal(params[:recurring_payment_id],
                                    SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id]))
  end

  def recurring_payment
    spn = SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i, :status => params[:payment_status], :transaction_id => params[:txn_id])
    sub_periods = SubscriptionSubPeriod.paypal_unpaid.for_recurring_payment(params[:recurring_payment_id]).readonly(false)

    if subscription_sub_period = sub_periods.where(:paypal_txn_id => params[:txn_id]).first || sub_periods.where(:paypal_txn_id => nil).first
      subscription_sub_period.update_recurring_payment_status(spn)
    else
      EmailNotification.notify("recurring_payment: Matching sub period not found", "<p>SubscriptionPaymentNotification: #{spn.id}</p> <>br /> Backtrace: <p>#{spn.params.inspect}</p>")
    end
  end

  def recurring_payment_failed
    Subscription.payment_failed(params[:recurring_payment_id], SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i))
  end

  def recurring_payment_suspended_due_to_max_failed_payment
    Subscription.payment_suspended(params[:recurring_payment_id], SubscriptionPaymentNotification.create(:params => params, :buyer_id => params[:invoice].to_i))
  end
end
