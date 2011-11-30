class SubscriptionPlansController < SecuredController

  before_filter :fetch_user
  before_filter :fetch_subscription_plan, :except => [:cancel]
  before_filter :handle_paypal_subscription, :except => [:paypal_confirmed, :paypal_canceled, :cancel]

  private

  def handle_paypal_subscription
    if @subscription_plan.use_paypal?
    ppr = PayPal::Recurring.new({
      :return_url   => paypal_confirmed_my_profile_subscription_plan_url(@subscription_plan),
      :cancel_url   => paypal_canceled_my_profile_subscription_plan_url(@subscription_plan),
      :ipn_url      => payment_notification_url,
      :description  => @subscription_plan.name,
      :amount       => @subscription_plan.billing_price,
      :currency     => @subscription_plan.currency.to_s
    })

    response = ppr.checkout
    if response.valid?
    redirect_to response.checkout_url
    else
      redirect_to :back
    end
    end
  end

  def fetch_user
    @user = current_user.with_role
  end

  def fetch_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

  public

  def paypal_confirmed
    ppr = PayPal::Recurring.new({
      :token       => params[:token],
      :payer_id    => params[:PayerID],
      :amount      => @subscription_plan.billing_price,
      :description => @subscription_plan.name
    })
    response = ppr.request_payment
    response.approved?
    response.completed?

    @user.upgrade_subscription!(@subscription_plan)

    ppr = PayPal::Recurring.new({
      :amount      => @subscription_plan.billing_price,
      :currency    => @subscription_plan.currency.to_s,
      :description => @subscription_plan.name,
      :ipn_url     => payment_notification_url,
      :frequency   => @subscription_plan.billing_cycle,
      :token       => params[:token],
      :period      => :weekly,
      :reference   => @user.active_subscription.id.to_s,
      :payer_id    => params[:PayerID],
      :start_at    => Time.now,
      :failed      => 1,
      :outstanding => :next_billing
    })

    response = ppr.create_recurring_profile
    @user.active_subscription.update_attribute(:paypal_profile_id, response.profile_id)

    redirect_to my_profile_path
  end

  def paypal_canceled

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
