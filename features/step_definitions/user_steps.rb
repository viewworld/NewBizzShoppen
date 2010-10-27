Given /^no user exists with an email of "([^"]*)"$/ do |email|
  assert User.first(:conditions => { :email => email }).nil?
end

When /^I sign in as "([^"]*)"$/ do |login_data|
    And %{I fill in "user_email" with "#{login_data.split("/").first}"}
    And %{I fill in "user_password" with "#{login_data.split("/").last}"}
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

Given /^I am signed up and confirmed as "([^"]*)"$/ do |arg1|
  u = User::Admin.create!(:email => arg1.split('/').first, :password => arg1.split('/').last, :password_confirmation => arg1.split('/').last, :screen_name => "dfsdfsdfsdf")
  u.confirm!
  u.roles << :admin
  u.save
end

Given /^User "([^"]*)" has role "([^"]*)"$/ do |login, role|
  u = User::Admin.first(:conditions => { :email => login.split("/").first})
  u.roles = [role.to_sym]
  u.save
end

