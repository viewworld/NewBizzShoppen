class Administration::SubscriptionPlansController < Administration::AdministrationController
  set_tab 'reports'
  set_subtab 'subscription_plans'

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
    @subscription_plan = SubscriptionPlan.new(subscription_plan_params)

    if @subscription_plan.save
      redirect_to administration_subscription_plans_path, notice: t('flash.actions.create.notice', resource_name: 'Subscription plan')
    else
      render :new
    end
  end

  def update
    if @subscription_plan.update_attributes(subscription_plan_params)
      redirect_to administration_subscription_plans_path, notice: t('flash.actions.update.notice', resource_name: 'Subscription plan')
    else
      render :edit
    end
  end

  def destroy
    if @subscription_plan.destroy
      redirect_to :back, notice: t('flash.subscription_plans.destroy.notice')
    else
      roles = @subscription_plan.assigned_roles.join
      redirect_to :back, notice: t('flash.subscription_plans.destroy.failure', roles: roles)
    end
  end

  private
  def set_subscription_plan
    @subscription_plan = SubscriptionPlan.find(params[:id])
  end

  def subscription_plan_params
    params.require(:subscription_plan).permit(
      :name, :subscription_text, :subscription_period, :billing_cycle, :lockup_period,
      :billing_period, :free_period, :currency_id, :seller_id, :free_deals_in_free_period,
      :is_active, :is_public, :can_be_upgraded, :can_be_downgraded, :premium_deals,
      :free_deal_requests_in_free_period, :team_buyers, :big_buyer, :deal_maker, :newsletter_manager,
      :chain_mails_enabled, :surveys_enabled, :pipeline_reports_enabled, :use_paypal,
      :paypal_retries, :automatic_downgrading, :automatic_downgrade_subscription_plan_id,
      :paypal_billing_at_start, assigned_roles: [], subscription_plan_lines_attributes: [:name, :price]
    )
  end
end
