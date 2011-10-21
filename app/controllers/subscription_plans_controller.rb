class SubscriptionPlansController < SecuredController

  before_filter :fetch_user, :fetch_subscription_plan

  private

  def fetch_user
    @user = current_user.with_role
  end

  def fetch_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

  public

  def upgrade
    @user.upgrade_subscription!(@subscription_plan)
    redirect_to my_profile_path
  end

  def downgrade
    @user.downgrade_subscription!(@subscription_plan)
    redirect_to my_profile_path
  end

  def cancel
    @user.cancel_subscription!
  end

end
