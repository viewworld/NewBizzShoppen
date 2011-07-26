Given /^a deal named "([^"]*)" exists within category "([^"]*)"$/ do |name, category_name|
  category = Category.where(:name => category_name).first
  category = Category.make!(:name => category_name) unless category
  deal = Deal.where(:header => name).first
  Deal.make!(:category => category, :header => name) unless deal
end

When /^a deal named "([^"]*)" exists with attributes "([^"]*)"$/ do |name, options|
  deal = Deal.where(:header => name).first
  deal = Deal.make!(:header => name) unless deal
  deal.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Then /^a deal is created by "([^"]*)" for user "([^"]*)" and category "([^"]*)" with attributes "([^"]*)"$/ do |creator, user, category, attributes|
  deal_attributes = {};attributes.split("|").each{|attr| deal_attributes[attr.split(":").first] = attr.split(":").last}
  deal = Deal.new_for_user(User.find_by_email(creator))
  deal.update_attributes(deal_attributes)
  deal.currency_id = Currency.first.id
  deal.creator = User.find_by_email(user)
  deal.category_id = Category.find_by_name(category)
  #throw deal
  deal.save!
end