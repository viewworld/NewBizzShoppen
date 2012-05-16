class UnconfirmedPayableSubscriptionsController < SecuredController

  before_filter :redirect_to_payment_confirmation, :except => [:show]

  def show
    @subscription_plan = current_user.active_subscription

    if @subscription_plan.paypal?
      @paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @subscription_plan,
                                                    :return_url => payment_confirmed_my_profile_subscription_plan_url(@subscription_plan),
                                                    :cancel_url => payment_canceled_my_profile_subscription_plan_url(@subscription_plan),
                                                    :ipn_url => payment_notifications_url)
    end

    respond_to do |format|
      format.html { }
      format.js { }
    end
  end
end