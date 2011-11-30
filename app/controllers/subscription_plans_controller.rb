class SubscriptionPlansController < SecuredController

  before_filter :fetch_user
  before_filter :fetch_subscription_plan, :except => [:cancel]
  before_filter :handle_paypal_subscription, :except => [:paypal_subscription]

  private

  def handle_paypal_subscription
    redirect_to :action => :paypal_subscription if @subscription_plan.use_paypal?
  end

  def fetch_user
    @user = current_user.with_role
  end

  def fetch_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

  public

  def paypal_subscription
    session[:subscription_token] = SubscriptionPaymentNotification.create(:token => Digest::SHA1.hexdigest("#{request.session_options[:id]}")+"_#{@subscription_plan.id}_#{Time.now.strftime("%y%m%d%S")}",
                                                                          :buyer_id => current_user ? current_user.id : nil).token
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
