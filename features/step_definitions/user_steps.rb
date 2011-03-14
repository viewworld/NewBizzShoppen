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

Given /^(?:|I am |someone is )signed up and confirmed as user with email ([^"]*) and password ([^"]*) and role ([^"]*)(?: with attributes "([^"]*)")?$/ do |email, password, role, options|
  std_opts = {:email => email, :password => password, :password_confirmation => password}
  opts = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(std_opts) : std_opts
  if country_id = opts.delete(:country) and country = Country.find(country_id)
    opts.merge!(:address => Address.make!(:country => country))
  end
  u = "User::#{role.camelize}".constantize.make!(opts)
  u.confirm!
end

Given /^user "([^"]*)" has team buyers enabled$/ do |email|
  User::Customer.where(:email => email).first.update_attribute(:team_buyers, true)
end

Given /^user "([^"]*)" with role "([^"]*)" is confirmed$/ do |email, role|
  "User::#{role.camelize}".constantize.where(:email => email).first.confirm!
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
    sub_user = "User::#{role.camelize}".constantize.make!(:email => sub_email, :password => 'secret', :password_confirmation => 'secret', :parent_id => customer.id)
  else
    sub_user.update_attribute(:parent_id, customer.id)
  end
  sub_user.confirm!
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
  options_hash = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  options_hash.each_pair do |k, v|
    if v.include?("true") or v.include?("false")
      options_hash[k] = eval(v)
    end
  end
  user.send(:attributes=, options_hash, false)
  user.save
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

Given /^all users have refreshed cache counters$/ do
    User::Abstract.where("parent_id is not null").each do |user|
      user.refresh_subaccounts_counters!
    end

    User::CallCentre.all.each do |user|
      user.refresh_certification_level
      user.save
    end

    (User::Agent.all + User::CallCentreAgent.all).each do |user|
      user.refresh_agent_counters!
    end

    User::LeadBuyer.all.each do |user|
      user.refresh_buyer_counters!
    end
end

Given /^user "([^"]*)" with role "([^"]*)" has interest in following categories "([^"]*)"$/ do |email, role, category_names|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.categories = category_names.split(",").map { |name| Category.find_by_name(name).last }
  user.save
end

Given /^user "([^"]*)" with role "([^"]*)" has certification level (\d+)$/ do |email, role, c_level|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  if user.has_role?(:call_centre_agent)
    assert user.certification_level == c_level.to_i
  else
    assert user.read_attribute(:certification_level).to_i == c_level.to_i
  end
end

Given /^user "([^"]*)" with role "([^"]*)" has certification level set to (\d+)$/ do |email, role, c_level|
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user.certification_level = c_level.to_i
  user.save
end

When /^user "([^"]*)" with role "([^"]*)" has attributes "([^"]*)"$/ do |email, role_name, options|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => { :email => email })
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  user.update_attributes(attrs)
end

When /^user "([^"]*)" with role "([^"]*)" added lead "([^"]*)" to cart$/ do |email, role_name, lead_name|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => { :email => email })
  lead = Lead.where(:header => lead_name).first
  Cart.new(user).add_lead(lead)
end

Given /^user "([^"]*)" with role "([^"]*)" comes from "([^"]*)"$/ do |email,role_name,country_name|
  address = "User::#{role_name.camelize}".constantize.where(:email => email).first.address
  address.country = Country.where(:name => country_name).first
  address.save
end

Given /^user "([^"]*)" with role "([^"]*)" has address "([^"]*)"$/ do |email,role_name,options|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => { :email => email })
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  user.address.update_attributes(attrs)
end

When /^I am signed up and confirmed as user with email "([^"]*)" and password "([^"]*)" and role "([^"]*)" for category "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email, password, role_name, category_name, options|
  std_opts = {:email => email, :password => password, :password_confirmation => password, :buying_categories => [Category.where(:name => category_name).first]}
  opts = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(std_opts) : std_opts
  u = "User::#{role_name.camelize}".constantize.make!(opts)
  u.confirm!
end

Then /^user "([^"]*)" should have role "([^"]*)"$/ do |email, role_name|
  User.where(:email => email).first.roles.should include(role_name.to_sym)
end

And /^user "([^"]*)" is confirmed/ do |email|
  User.where(:email => email).first.confirm!
end

When /^user "([^"]*)" is assigned to category "([^"]*)" as category buyer$/ do |email,category_name|
  u = User::CategoryBuyer.where(:email => email).first
  u.buying_categories << Category.where(:name => category_name)
end

Given /^customer "([^"]*)" has no subaccounts$/ do |email|
  customer = User::Customer.find_by_email(email)
  customer.subaccounts.each do |sa|
    sa.update_attribute(:parent_id, nil)
    sa.destroy
  end
end

When /^user "([^"]*)" has no buying categories$/ do |email|
  u = User::CategoryBuyer.where(:email => email).first
  u.buying_categories = []
  u.save!
end
