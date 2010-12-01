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
 assert page.should have_content("Sign in")
end

Given /^I am not sign in$/ do
visit '/'
When %{session is cleared}
end

When /^I sign out$/ do
  Then %{I am not sign in}
end


When /^session is cleared$/ do
visit '/logout'
end

Given /^I am signed up with email (.+) and password (.+) and role (.+)$/ do |email, password, role|
  "User::#{role.camelize}".constantize.make!(:email => email, :password => password, :password_confirmation => password)
end

Given /^I am signed up and confirmed as user with email (.+) and password (.+) and role (.+)$/ do |email, password, role|
  u = "User::#{role.camelize}".constantize.make!(:email => email, :password => password, :password_confirmation => password)
  u.confirm!
end

Then /^I have user with email (.+) and role (.+)$/ do |email, role|
  u = "User::#{role.camelize}".constantize.make!(:email => email)
  u.confirm!
end

Given /^I follow "([^"]*)" within table row with value "([^"]*)"$/ do |link_name, value|
 pending
end

Then /^a confirmation message should be sent to (.+)$/ do |email|
  assert ActionMailer::Base.deliveries.size > 0
  assert ActionMailer::Base.deliveries.last.to.include?(email)
end

Then /^a confirmation message to (.+) should include confirmation link$/ do |email|
  user = "User::Abstract".constantize.first(:conditions => { :email => email })
  assert ActionMailer::Base.deliveries.last.body.raw_source.include?("/users/confirmation?confirmation_token=#{user.confirmation_token}")
end

Then /^confirmation link should confirm account for (.+)$/ do |email|
  user = "User::Abstract".constantize.first(:conditions => { :email => email })
  visit "/users/confirmation?confirmation_token=#{user.confirmation_token}"
end

Then /^a password reset message should be sent to (.+)$/ do |email|
  assert ActionMailer::Base.deliveries.size > 0
end

When /^I follow the confirmation link sent to (.+) with role (.+)$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  visit "/users/confirmation?confirmation_token=#{user.confirmation_token}"
end

When /^I follow the password reset link sent to (.+) with role (.+)$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.send(:generate_reset_password_token!)
  visit "/users/password/edit?reset_password_token=#{user.reset_password_token}"
end

When /^I request password reset link to be sent to (.+)$/ do |email|
  Given %{I go to reset password}
  And %{I fill in "user_email" with "#{email}"}
  Then %{I press translated "devise.passwords.button_create"}
end

When /^I follow reset link after I complete reset password using link sent to (.+) and role (.+)$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.send(:generate_reset_password_token!)
  prev_token = user.reset_password_token
  user.send(:generate_reset_password_token!)
  visit "/users/password/edit?reset_password_token=#{prev_token}"
end

Given /^User (.+) with role (.+) has leads$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  Lead.make!(:creator => user)
end

And /^an user with role (.+) and email (.+) exists as subaccount for customer (.+)$/ do |role, sub_email, customer_email|
  customer = User::Customer.first(:conditions => { :email => customer_email })
  if customer.nil?
    customer = User::Customer.make!(:email => customer_email, :password => 'secret', :password_confirmation => 'secret')
  end

  sub_user = "User::#{role.camelize}".constantize.first(:conditions => { :email => sub_email })

  if sub_user.nil?
    "User::#{role.camelize}".constantize.make!(:email => sub_email, :password => 'secret', :password_confirmation => 'secret', :parent_id => customer.id)
  else
    sub_user.update_attribute(:parent_id, customer.id)
  end
end

Then /^User (.+) with role (.+) is blocked$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.update_attribute(:locked, true)
end

Then /^User (.+) with role (.+) is big buyer$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.update_attribute(:big_buyer, true)
end

Then /^user (.+) with role (.+) exists with attributes "([^"]*)"$/ do |email, role, options|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Then /^user (.+) with role (.+) has no subaccounts$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.subaccounts.each do |subaccount|
    LeadRequest.all(:conditions => { :requested_by => subaccount.id }).each(&:destroy)
  end
  user.subaccounts.each(&:destroy)
  user.reload
end

Then /^user (.+) with role (.+) should not be confirmed$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  assert user.confirmed_at.blank?
end

Then /^user "([^"]*)" with role "([^"]*)" also has role "([^"]*)"$/ do |email, role, other_role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  assert user.has_role?(other_role.to_sym)
end

Then /^user "([^"]*)" with role "([^"]*)" should not have role "([^"]*)"$/ do |email, role, other_role|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  assert !user.has_role?(other_role.to_sym)
end