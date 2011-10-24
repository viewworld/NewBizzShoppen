Given /^subscription plan exists with attributes "([^"]*)"$/ do |options|
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  @subscription_plan = SubscriptionPlan.make!(options_hash)
end

Given /^subscription plan has seller "([^"]*)"$/ do |seller_company_name|
  @subscription_plan.update_attribute(:seller, Seller.where(:company_name => seller_company_name).first)
end

Given /^subscription plan has following lines$/ do |table|
  table.hashes.each do |hash|
    @subscription_plan.subscription_plan_lines.create(hash)
  end
end

Given /^subscription plan has currency named "([^"]*)"$/ do |name|
    @subscription_plan.update_attribute(:currency, Currency.where(:name => name).first)
end

When /^user with email "([^"]*)" has subscription named "([^"]*)"$/ do |email, name|
  user = User.where(:email => email).first.with_role
  user.apply_subscription!(SubscriptionPlan.where(:name => name).first)
end

When /^user with email "([^"]*)" upgrades to subscription named "([^"]*)"$/ do |email, name|
  user = User.where(:email => email).first.with_role
  user.upgrade_subscription!(SubscriptionPlan.where(:name => name).first)
end

When /^user with email "([^"]*)" has billing date today for active subscription$/ do |email|
  user = User.where(:email => email).first.with_role
  user.active_subscription.update_attribute(:billing_date, Date.today)
end

Then /^user with email "([^"]*)" should have subscription named "([^"]*)" cancelled$/ do |email, name|
  user = User.where(:email => email).first.with_role
  assert !user.subscriptions.where(:name => name).order("position").last.cancelled_at.nil?
end