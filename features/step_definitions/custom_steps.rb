require "spec/support/blueprints"

Given /^Category named "([^"]*)" already exists$/ do |name|
  c = Category.make(:name => name)
  c.save
end
