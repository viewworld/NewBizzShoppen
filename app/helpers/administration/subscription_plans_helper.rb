module Administration::SubscriptionPlansHelper
  def paypal_billing_types
    SubscriptionPlan::PAYPAL_BILLING_TYPE.map { |billing_type| [t("models.subscription_plan.billing_types.#{billing_type.first}"), billing_type.last] }
  end

  def downgrade_subscription_plans(subscription_plan)
    SubscriptionPlan.without_paypal.for_roles(subscription_plan.assigned_roles).where("id NOT in (?)", subscription_plan.id || 0)
  end
end
