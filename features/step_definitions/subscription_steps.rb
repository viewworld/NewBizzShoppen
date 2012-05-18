Given /^subscription plan named "([^"]*)" exists with attributes "([^"]*)"$/ do |name, options|
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  @subscription_plan = SubscriptionPlan.where(:name => name).first
  @subscription_plan.update_attributes(options_hash)
end

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

Given /^subscription plan named "([^"]*)" has currency named "([^"]*)"$/ do |name, currency_name|
    @subscription_plan = SubscriptionPlan.where(:name => name).first
    @subscription_plan.update_attribute(:currency, Currency.where(:name => currency_name).first)
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

Then /^user subscriptions are reviewed by rake task$/ do
  Subscription.auto_prolong
end

Given /^user with email "([^"]*)" and password "([^"]*)" and role "([^"]*)" exists with confirmed paypal subscription named "([^"]*)" with attributes "([^"]*)"$/ do |email, password, role, name, options|
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  @subscription_plan = SubscriptionPlan.make!(options_hash.merge(:name => name, :use_online_payment => true))
  @user = "User::#{role.camelize}".constantize.make!(:email => email, :password => password, :password_confirmation => password, :subscription_plan_id => @subscription_plan.id)
  @user.active_subscription.update_attribute(:payment_type, Subscription::PAYPAL_PAYMENT_TYPE)
  @user.active_subscription.confirm_payment!
  @user.active_subscription.update_attribute(:payment_profile_id, "TEST-123")
end

Given /^active subscription for user "([^"]*)" has been canceled in paypal$/ do |email|
   @user = User.where(:email => email).first.with_role
   Subscription.canceled_in_payment_gateway(@user.active_subscription.payment_profile_id, nil)
end

Given /^the current subperiod for user "([^"]*)" is auto paid by paypal$/ do |email|
  @user = User.where(:email => email).first.with_role
  @user.active_subscription.subscription_sub_periods.with_date(Date.today).each do |ssp|
    ssp.update_attribute(:payment_paid_auto, true)
  end
end

When /^subscriptions are checked if any of them has ending free period$/ do
  Subscription.send_reminder_about_end_of_free_period
end