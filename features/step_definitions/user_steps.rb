require "spec/support/blueprints"

Given /^no user exists with an email of (.+) and role (.+)$/ do |email, role|
  assert "User::#{role.camelize}".constantize.first(:conditions => { :email => email }).nil?
end

When /^I sign in as (.+) with password (.+)$/ do |login, password|
    And %{I fill in "user_email" with "#{login}"}
    And %{I fill in "user_password" with "#{password}"}
    And %{I press "Sign in"}
end

Then /^I should be signed in$/ do
visit '/'
page.should have_content("Logout")
end

Then /^I should be signed out$/ do
page.should have_content("Sign in")
end

Given /^I am not sign in$/ do
visit '/'
When %{session is cleared}
end


When /^session is cleared$/ do
visit '/logout'
end

Given /^I am signed up and confirmed as user with email (.+) and password (.+) and role (.+)$/ do |login, password, role|
  u = "User::#{role.camelize}".constantize.make(:email => login, :password => password, :password_confirmation => password)
  u.confirm!
  u.save
end

Then /^I have user with email (.+) and role (.+)$/ do |email, role|
  u = "User::#{role.camelize}".constantize.make(:email => email)
  u.confirm!
  u.save
end

Given /^I follow "([^"]*)" within table row with value "([^"]*)"$/ do |link_name, value|
 pending
end

