class SubscriptionPlansController < SecuredController

  before_filter :fetch_user
  before_filter :fetch_subscription_plan, :except => [:cancel]
  before_filter :handle_online_payable_subscription, :except => [:payment_confirmed, :payment_canceled, :cancel, :redirect_to_quickpay]
  skip_before_filter :redirect_to_payment_confirmation

  private

  def handle_online_payable_subscription
    if (@subscription_plan.is_a?(SubscriptionPlan) and @subscription_plan.use_online_payment? and (!@subscription_plan.free_period_can_be_applied_to?(current_user) or @subscription_plan.payment_billing_at_start?)) or
        (@subscription_plan.is_a?(Subscription) and @subscription_plan.cancelled_in_payment_gateway? and @subscription_plan.next_billing_cycle_for_recurring_payment_renewal)

      if params[:payment_type].nil? or params[:payment_type].to_i == Subscription::PAYPAL_PAYMENT_TYPE
        paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @subscription_plan,
                                                      :return_url => payment_confirmed_my_profile_subscription_plan_url(@subscription_plan),
                                                      :cancel_url => payment_canceled_my_profile_subscription_plan_url(@subscription_plan),
                                                      :ipn_url => payment_notification_url)

        if paypal_recurring.checkout?
          redirect_to paypal_recurring.checkout_url
        else
          redirect_to :back
        end
      else
        redirect_to redirect_to_quickpay_my_profile_subscription_plan_path(@subscription_plan)
      end
    end
  end

  def fetch_user
    @user = current_user.with_role
  end

  def fetch_subscription_plan
    @subscription_plan = (current_user.active_subscription.unconfirmed_payment? or current_user.active_subscription.cancelled_in_payment_gateway?) ?
                          current_user.active_subscription : SubscriptionPlan.find(params[:id])
  end

  public

  def payment_confirmed
    if @user.active_subscription.unconfirmed_payment?
      @user.active_subscription.confirm_payment!
    elsif @user.active_subscription.total_billing < @subscription_plan.total_billing
      @user.upgrade_subscription!(@subscription_plan)
    else
      @user.downgrade_subscription!(@subscription_plan)
    end

    paypal_recurring = PaypalRecurringPayment.new(:subscription_plan => @subscription_plan, :user => @user, :token => params[:token], :payer_id => params[:PayerID],
                                                  :ipn_url => payment_notification_url)

    paypal_recurring.create_profile

    if @user.active_subscription.cancelled_in_payment_gateway? and !paypal_recurring.response_has_errors?
      @user.active_subscription.normalize!
    end


    @user.active_subscription.update_attributes(:payment_profile_id => paypal_recurring.profile_id, :payment_invoice_id => @user.active_subscription.id,
                                                :payment_type => Subscription::PAYPAL_PAYMENT_TYPE)

    redirect_to my_profile_path(:scp => true)
  end

  def payment_canceled
    flash[:alert] = I18n.t("subscriptions.paypal_subscription_not_confirmed")
    redirect_to my_profile_path
  end

  def payment_renew

  end

  def upgrade
    if @user.upgrade_subscription!(@subscription_plan)
      flash[:notice] = t("subscriptions.flash.subscription_upgraded")
    else
      flash[:alert] = @user.errors.full_messages
    end

    if current_user.member? and (deal = Deal.find_by_id(session[:deal_id]))
      session[:deal_id] = nil
      redirect_to deal_path(:id => deal.slug, :scp => true)
    else
      redirect_to my_profile_path(:scp => true)
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

  def redirect_to_quickpay
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

end
