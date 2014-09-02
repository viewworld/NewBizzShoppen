class Administration::SubscriptionPlansController < Administration::AdministrationController
  set_tab "reports"
  set_subtab "subscription_plans"

  before_filter :set_subscription_plan, only: [:edit, :update, :destroy]

  cache_sweeper :subscription_plan_sweeper

  def index
    @search = SubscriptionPlan.scoped_search(params[:search] || {})
    @subscription_plans = @search.paginate(page: params[:page]).decorate
  end

  def new
    @subscription_plan = SubscriptionPlan.new(seller: Seller.default, paypal_retries: 1)
  end

  def create
    @subscription_plan = SubscriptionPlan.new(params[:subscription_plan])

    if @subscription_plan.save
      redirect_to administration_subscription_plans_path, notice: t('flash.actions.create.notice', resource_name: "Subscription plan")
    else
      render :new
    end
  end

  def update
    if @subscription_plan.update_attributes(params[:subscription_plan])
      redirect_to administration_subscription_plans_path, notice: t('flash.actions.update.notice', resource_name: "Subscription plan")
    else
      render :edit
    end
  end

  def destroy
    if @subscription_plan.destroy
      redirect_to :back, notice: t("flash.subscription_plans.destroy.notice")
    else
      roles = @subscription_plan.assigned_roles.join
      redirect_to :back, notice: t("flash.subscription_plans.destroy.failure", roles: roles)
    end
  end

  private
  def set_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end
end
