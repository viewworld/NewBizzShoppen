When /^there is subscription plan named "([^"]*)" for role "([^"]*)" with attributes "([^"]*)" and price "([^"]*)"$/ do |plan_name, role_name, options, price|
  options = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  options.merge!(:name => plan_name, :assigned_roles => role_name, :subscription_plan_lines => [SubscriptionPlanLine.make!(:price => price)])
  sp = SubscriptionPlan.make!(options)
end

When /^active subscription for user "([^"]*)" is in lockup period$/ do |email|
  u = User.where(:email => email).first.with_role
  u.active_subscription.enter_lockup!
end

