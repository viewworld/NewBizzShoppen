require "spec/support/blueprints"

And /^I wait (.*) second$/ do |n|
  sleep n.to_i
end

Given /^Category (.+) is created$/ do |name|
  Category.create(:name => name)
end

Given /^Country (.+) is created$/ do |name|
  Country.create(:name => name)
end

Given /^Lead (.+).is created for user (.+) with role (.+)$/ do |name, email, role|
  u = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  lead = Lead.make(:header => name, :creator_id => u.id)
  lead.creator_id = u.id
  lead.save
  lead.lead_translations.each { |lt| lt.destroy if lt.locale != "en" }
end

Given /^I run ruby "([^\"]*)"$/ do |ruby|
print "result of: #{ruby}\n\n"
eval ruby
print "\n\n"
end

Then /I should have value "([^"]*)" in the css path "([^"]*)"$/ do |value, css_path|
    assert page.find(css_path).text == value
end