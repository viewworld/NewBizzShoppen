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

Given /^pagination per page size in model (.+) is set to (\d+)$/ do |model_name, n|
  model_name.constantize.stubs(:per_page).returns(n)
end

Given /^I click hidden link "([^"]*)"$/ do |caption|
  page.all(:css, 'a').detect { |l| l.text == caption }.click()
end