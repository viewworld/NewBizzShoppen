require "spec/support/blueprints"


Given /^Category named "([^"]*)" already exists(?: within category named "([^"]*)")?$/ do |name, parent_category_name|
  parent_category_id =  parent_category_name.present? ? Category.where(:name => parent_category_name).last.id : nil
  Category.make(:name => name, :parent_id => parent_category_id).tap do |c|
    c.save!
  end
end


Given /^Lead named "([^"]*)" exists within "([^"]*)" category$/ do |name, category_name|
  category_id =  if category_name
                   Category.find_by_name(category_name).last.id
                 else
                   c = Category.make
                   c.save!
                   c.id
                 end
  agent = User::Agent.make
  agent.save
  Lead.make(:header => name, :category_id =>category_id, :creator_id => agent.id).tap do |c|
    c.save!
  end
end

Then /^I should see category named "([^"]*)" within category named "([^"]*)"$/ do |child_category_name, parent_category_name|
  Then %{I should see "#{child_category_name}" within "li##{ActionController::RecordIdentifier.dom_id(Category.find_by_name(parent_category_name).last)}"}
end


And /^I wait (.*) second$/ do |n|
  sleep n.to_i
end

Given /^Category (.+) is created$/ do |name|
  Category.create(:name => name)
end

Given /^Country (.+) is created$/ do |name|
  Country.create(:name => name)
end
