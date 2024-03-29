class UnconfirmedPaypalSubscriptionsController < ApplicationController

  before_filter :redirect_to_paypal_confirmation, :except => [:show]

  def show
    @subscription_plan = current_user.active_subscription
    @paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @subscription_plan,
                                                    :return_url => paypal_confirmed_my_profile_subscription_plan_url(@subscription_plan),
                                                    :cancel_url => paypal_canceled_my_profile_subscription_plan_url(@subscription_plan),
                                                    :ipn_url => payment_notifications_url)
  end
end