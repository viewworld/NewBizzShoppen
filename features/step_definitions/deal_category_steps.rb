Given /^Deal category (.+) is created$/ do |name|
  DealCategory.create!(:name => name)
end

When /^Deal category named "([^"]*)" already exists within category named "([^"]*)"$/ do |name, parent_category_name|
  parent_category_id =  parent_category_name.present? ? DealCategory.where(:name => parent_category_name).last.id : nil
  DealCategory.make!(:name => name, :parent_id => parent_category_id)
end