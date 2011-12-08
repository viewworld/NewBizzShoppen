class SubscriptionPlansController < SecuredController

  before_filter :fetch_user
  before_filter :fetch_subscription_plan, :except => [:cancel]
  before_filter :handle_paypal_subscription, :except => [:paypal_confirmed, :paypal_canceled, :cancel]
  skip_before_filter :redirect_to_paypal_confirmation

  private

  def handle_paypal_subscription
    if (@subscription_plan.is_a?(SubscriptionPlan) and @subscription_plan.use_paypal? and (!@subscription_plan.free_period_can_be_applied_to?(current_user) or @subscription_plan.paypal_billing_at_start?)) or
        (@subscription_plan.is_a?(Subscription) and @subscription_plan.cancelled_in_paypal? and @subscription_plan.next_billing_cycle_for_recurring_payment_renewal)
      paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @subscription_plan,
                                                    :return_url => paypal_confirmed_my_profile_subscription_plan_url(@subscription_plan),
                                                    :cancel_url => paypal_canceled_my_profile_subscription_plan_url(@subscription_plan),
                                                    :ipn_url => payment_notification_url)

      if paypal_recurring.checkout?
        redirect_to paypal_recurring.checkout_url
      else
        redirect_to :back
      end
    end
  end

  def fetch_user
    @user = current_user.with_role
  end

  def fetch_subscription_plan
    @subscription_plan = (current_user.active_subscription.unconfirmed_paypal? or current_user.active_subscription.cancelled_in_paypal?) ?
                          current_user.active_subscription : SubscriptionPlan.find(params[:id])
  end

  public

  def paypal_confirmed
    if PaypalRecurringPayment.new(:subscription_plan => @subscription_plan, :token => params[:token], :payer_id => params[:PayerID], :ipn_url => payment_notification_url).request_payment?
      if @user.active_subscription.unconfirmed_paypal?
        @user.active_subscription.confirm_paypal!
      elsif @user.active_subscription.total_billing < @subscription_plan.total_billing
        @user.upgrade_subscription!(@subscription_plan)
      else
        @user.downgrade_subscription!(@subscription_plan)
      end

      paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @subscription_plan, :user => @user, :token => params[:token], :payer_id => params[:PayerID],
                                                    :ipn_url => payment_notification_url)

      paypal_recurring.create_profile

      if @user.active_subscription.cancelled_in_paypal? and !paypal_recurring.response_has_errors?
        @user.active_subscription.update_attribute(:cancelled_in_paypal, false)
      end


      @user.active_subscription.update_attributes(:paypal_profile_id => paypal_recurring.profile_id, :paypal_invoice_id => @user.active_subscription.id)
    end

    redirect_to my_profile_path
  end

  def paypal_canceled
    flash[:alert] = I18n.t("subscriptions.paypal_subscription_not_confirmed")
    redirect_to my_profile_path
  end

  def paypal_renew

  end

  def upgrade
    if @user.upgrade_subscription!(@subscription_plan)
      flash[:notice] = t("subscriptions.flash.subscription_upgraded")
    else
      flash[:alert] = @user.errors.full_messages
    end

    if current_user.member? and deal = Deal.find_by_id(session[:deal_id])
      session[:deal_id] = nil
      redirect_to deal_path(:id => deal.slug)
    else
      redirect_to my_profile_path
    end
  end

  def downgrade
    if @user.downgrade_subscription!(@subscription_plan)
      flash[:notice] = t("subscriptions.flash.subscription_downgraded")
    else
      flash[:alert] = @user.errors.full_messages
    end
    redirect_to my_profile_path
  end

  def cancel
    if @user.cancel_subscription!
      flash[:notice] = t("subscriptions.flash.subscription_canceled")
    else
      flash[:alert] = @user.errors.full_messages
    end
    redirect_to my_profile_path
  end

end
