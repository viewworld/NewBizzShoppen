class Administration::ChangeSubscriptionPlansController < Administration::AdministrationController

  before_filter :fetch_user

  private

  def fetch_user
    @user = User.find(params[:user_id]).with_role
  end

  public

  def create
    @subscription = Subscription.new(params[:subscription])
    if @user.admin_change_subscription!(@subscription.subscription_plan, @subscription.start_date)
      flash[:notice] = t("flash.change_subscription.create.successful")
    else
      flash[:alert] = @user.errors.full_messages
    end
    redirect_to :back
  end

  def destroy
    @user.subscriptions.future.destroy_all
    flash[:notice] = t("flash.change_subscription.create.successful")
    redirect_to :back
  end

end