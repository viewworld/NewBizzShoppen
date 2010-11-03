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

Given /^I run ruby "([^\"]*)"$/ do |ruby|
print "result of: #{ruby}\n\n"
eval ruby
print "\n\n"
end

Then /I should have value "([^"]*)" in the css path "([^"]*)"$/ do |value, css_path|
    assert page.find(css_path).text == value
end