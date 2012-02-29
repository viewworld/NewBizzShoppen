class SubscriptionPlanSweeper < ActionController::Caching::Sweeper
  observe SubscriptionPlan

  def after_create(subscription_plan)
    expire_cache_for(subscription_plan)
  end

  def after_update(subscription_plan)
    expire_cache_for(subscription_plan)
  end

  def after_destroy(subscription_plan)
    expire_cache_for(subscription_plan)
  end

  def expire_cache_for(subscription_plan)
    expire_fragment(/sign_up/)
    expire_fragment(/subscription/)
  end
end