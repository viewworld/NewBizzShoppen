When /^there is subscription plan named "([^"]*)" for role "([^"]*)" with attributes "([^"]*)" and price "([^"]*)"$/ do |plan_name, role_name, options, price|
  options = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  options.merge!(:name => plan_name, :assigned_roles => role_name)
  sp = SubscriptionPlan.make!(options)
  SubscriptionPlanLine.make!(:price => price, :resource => sp)
end

When /^active subscription for user "([^"]*)" is in lockup period$/ do |email|
  u = User.where(:email => email).first.with_role
  u.active_subscription.enter_lockup!
end

When /^billing date for active subscription is today for user "([^"]*)"$/ do |email|
  as = User.find_by_email(email).with_role.active_subscription
  as.update_attribute(:billing_date, Date.today)
end

When /^user "([^"]*)" upgraded subscription to "([^"]*)"$/ do |email, plan_name|
  user = User.where(:email => email).first.with_role
  plan = SubscriptionPlan.active.for_role(user.role).where(:name => plan_name).first
  user.upgrade_subscription!(plan)
end

When /^user "([^"]*)" downgraded subscription to "([^"]*)"$/ do |email, plan_name|
  user = User.where(:email => email).first.with_role
  plan = SubscriptionPlan.active.for_role(user.role).where(:name => plan_name).first
  user.downgrade_subscription!(plan)
end




