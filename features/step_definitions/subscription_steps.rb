Given /^subscription plan exists with attributes "([^"]*)"$/ do |options|
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  @subscription_plan = SubscriptionPlan.make!(options_hash)
end