class Administration::ChangeSubscriptionPlansController < Administration::AdministrationController
  before_filter :set_user

  def create
    @subscription = Subscription.new(params[:subscription])
    if @user.admin_change_subscription!(@subscription.subscription_plan, @subscription.start_date)
      redirect_to :back, notice: t("flash.change_subscription.create.successful")
    else
      redirect_to :back, alert: @user.errors.full_messages
    end
  end

  def destroy
    @user.subscriptions.future.destroy_all
    redirect_to :back, notice: t("flash.change_subscription.create.successful")
  end

  private
  def set_user
    @user = User.find(params[:user_id]).with_role
  end
end
