Given /^subscription plan exists with attributes "([^"]*)"$/ do |options|
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  @subscription_plan = SubscriptionPlan.make!(options_hash)
end

Given /^subscription plan has following lines$/ do |table|
  table.hashes.each do |hash|
    @subscription_plan.subscription_plan_lines.create(hash)
  end
end

When /^user with email "([^"]*)" has subscription named "([^"]*)"$/ do |email, name|
  user = User.where(:email => email).first.with_role
  user.apply_subscription!(SubscriptionPlan.where(:name => name).first)
end

Then /^user with email "([^"]*)" should have subscription named "([^"]*)" cancelled$/ do |email, name|
  user = User.where(:email => email).first.with_role
  assert !user.subscriptions.where(:name => name).order("position").last.cancelled_at.nil?
end