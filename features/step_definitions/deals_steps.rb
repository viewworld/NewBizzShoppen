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