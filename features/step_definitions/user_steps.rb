Given /^no user exists with an email of (.+) and role (.+)$/ do |email, role|
  assert "User::#{role.camelize}".constantize.first(:conditions => {:email => email}).nil?
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
  unless u = User.where(:email => email).first
    u = "User::#{role.camelize}".constantize.make!(opts)
  end
  u.confirm!
end

Given /^user "([^"]*)" has team buyers enabled$/ do |email|
  user = User.where(:email => email).first.with_role

  if user.active_subscription.payable?
    user.active_subscription.update_attribute(:team_buyers, true)
  else
    subscription_plan = SubscriptionPlan.make!(:assigned_roles => [user.role.to_sym], :subscription_period => 12, :team_buyers => true)
    subscription_plan.subscription_plan_lines.make!
    user.upgrade_subscription!(subscription_plan)
  end
end

Given /^user "([^"]*)" has premium deals enabled$/ do |email|
  user = User.where(:email => email).first.with_role
  if user.active_subscription.payable?
    user.active_subscription.update_attribute(:premium_deals, true)
  else
    subscription_plan = SubscriptionPlan.make!(:assigned_roles => [user.role.to_sym], :subscription_period => 12, :premium_deals => true)
    subscription_plan.subscription_plan_lines.make!
    user.upgrade_subscription!(subscription_plan)
  end
end

Given /^user "([^"]*)" has deal maker role enabled$/ do |email|
  user = User.where(:email => email).first.with_role
  if user.has_any_role?(:agent, :call_centre, :call_centre_agent)
    user.deal_maker_role_enabled = true
    user.save
  elsif user.active_subscription.payable?
    user.active_subscription.update_attribute(:deal_maker, true)
  else
    subscription_plan = SubscriptionPlan.make!(:assigned_roles => [user.role.to_sym], :subscription_period => 12, :deal_maker => true, :big_buyer => true)
    subscription_plan.subscription_plan_lines.make!
    user.upgrade_subscription!(subscription_plan)
  end
end

Given /^user "([^"]*)" with role "([^"]*)" is confirmed$/ do |email, role|
  "User::#{role.camelize}".constantize.where(:email => email).first.confirm!
end

Then /^I have not confirmed user with email (.+) and role (.+)$/ do |email, role|
  "User::#{role.camelize}".constantize.make!(:email => email)
end

Then /^I have user with email (.+) and role (.+)$/ do |email, role|
  u = "User::#{role.camelize}".constantize.make!(:email => email)
  u.confirm!
end

Then /^I have user with email (.+) role (.+) first_name (.+) last_name (.+) and company_name (.+)$/ do |email, role, first_name, last_name, company_name|
  u = "User::#{role.camelize}".constantize.make!(:email => email, :first_name => first_name, :last_name => last_name, :company_name => company_name)
  u.confirm!
end

Then /User with email (.+) don't have interests/ do |email|
  user = User::Supplier.find_by_email(email)
  user.categories = []
  user.save
end

Then /^User with email (.+) has blank company name$/ do |email|
  User.find_by_email(email).update_attribute(:company_name, nil)
end

Given /^I follow "([^"]*)" within table row with value "([^"]*)"$/ do |link_name, value|
  pending
end

Then /^a confirmation message should be sent to (.+)$/ do |email|
  assert ActionMailer::Base.deliveries.size > 0
  assert ActionMailer::Base.deliveries.last.to.include?(email)
end

Then /^a confirmation message to (.+) should include confirmation link$/ do |email|
  user = "User::Abstract".constantize.first(:conditions => {:email => email})
  assert ActionMailer::Base.deliveries.last.body.raw_source.include?("/users/confirmation?confirmation_token=#{user.confirmation_token}")
end

Then /^confirmation link should confirm account for (.+)$/ do |email|
  user = "User::Abstract".constantize.first(:conditions => {:email => email})
  visit "/users/confirmation?confirmation_token=#{user.confirmation_token}"
end

Then /^a password reset message should be sent to (.+)$/ do |email|
  assert ActionMailer::Base.deliveries.size > 0
end

Then /^a call_center password reset message should be sent to (.+)$/ do |email|
  assert ActionMailer::Base.deliveries.last.to.include?(email)
  assert ActionMailer::Base.deliveries.last.body.include?(email)
end

When /^I follow the confirmation link sent to (.+) with role (.+)$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  visit "/users/confirmation?confirmation_token=#{user.confirmation_token}"
end

When /^I follow the password reset link sent to (.+) with role (.+)$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.send(:generate_reset_password_token!)
  visit "/users/password/edit?reset_password_token=#{user.reset_password_token}"
end

When /^I request password reset link to be sent to (.+)$/ do |email|
  Given %{I go to reset password}
  And %{I fill in "user_email" with "#{email}"}
  Then %{I press translated "devise.passwords.button_create"}
end

When /^I follow reset link after I complete reset password using link sent to (.+) and role (.+)$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.send(:generate_reset_password_token!)
  prev_token = user.reset_password_token
  user.send(:generate_reset_password_token!)
  visit "/users/password/edit?reset_password_token=#{prev_token}"
end

Given /^User (.+) with role (.+) has leads$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  Lead.make!(:creator => user)
end

And /^an user with role (.+) and email (.+) exists as subaccount for customer (.+)$/ do |role, sub_email, customer_email|
  customer = User::Supplier.first(:conditions => {:email => customer_email})
  if customer.nil?
    customer = User::Supplier.make!(:email => customer_email, :password => 'secret', :password_confirmation => 'secret')
  end

  sub_user = "User::#{role.camelize}".constantize.first(:conditions => {:email => sub_email})

  if sub_user.nil?
    sub_user = "User::#{role.camelize}".constantize.make!(:email => sub_email, :password => 'secret', :password_confirmation => 'secret', :parent_id => customer.id)
  else
    sub_user.update_attribute(:parent_id, customer.id)
  end
  sub_user.confirm!
end

Then /^User (.+) with role (.+) is blocked$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.update_attribute(:locked, true)
end

Then /^User (.+) with role (.+) is big buyer$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  if user.active_subscription.payable?
    user.active_subscription.update_attribute(:big_buyer, true)
  else
    subscription_plan = SubscriptionPlan.make!(:assigned_roles => [user.role.to_sym], :subscription_period => 12, :big_buyer => true, :currency => Currency.find_by_name("DKK"))
    subscription_plan.subscription_plan_lines.make!(:price => 10)
    user.upgrade_subscription!(subscription_plan)
  end
end

Then /^User (.+) with role (.+) is from country (.+)$/ do |email, role, country_name|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.address.update_attribute(:country, Country.where(:name => country_name).first)
end

Then /^user (.+) with role (.+) exists with attributes "([^"]*)"$/ do |email, role, options|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
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
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.subaccounts.each do |subaccount|
    LeadRequest.all(:conditions => {:requested_by => subaccount.id}).each(&:destroy)
  end
  user.subaccounts.each(&:destroy)
  user.reload
end

Then /^user (.+) with role (.+) should not be confirmed$/ do |email, role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  assert user.confirmed_at.blank?
end

Then /^user "([^"]*)" with role "([^"]*)" also has role "([^"]*)"$/ do |email, role, other_role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  assert user.has_role?(other_role.to_sym)
end

Then /^user "([^"]*)" with role "([^"]*)" should not have role "([^"]*)"$/ do |email, role, other_role|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  assert !user.has_role?(other_role.to_sym)
end

Given /^all users have refreshed cache counters$/ do
  [:refresh_subaccounts_counters, :refresh_agent_counters, :refresh_supplier_counters].each do |method|
    CommonStats.new.send(method)
  end
end

Given /^user "([^"]*)" with role "([^"]*)" has interest in following categories "([^"]*)"$/ do |email, role, category_names|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.categories = category_names.split(",").map { |name| Category.where(:name => name).last }
  user.save
end

Given /^user "([^"]*)" with role "([^"]*)" has certification level (\d+)$/ do |email, role, c_level|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  if user.has_role?(:call_centre_agent)
    assert user.certification_level == c_level.to_i
  else
    assert user.read_attribute(:certification_level).to_i == c_level.to_i
  end
end

Given /^user "([^"]*)" with role "([^"]*)" has certification level set to (\d+)$/ do |email, role, c_level|
  user = "User::#{role.camelize}".constantize.first(:conditions => {:email => email})
  user.certification_level = c_level.to_i
  user.save
end

When /^user "([^"]*)" with role "([^"]*)" has attributes "([^"]*)"$/ do |email, role_name, options|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => {:email => email})
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  user.update_attributes(attrs)
end

When /^user "([^"]*)" with role "([^"]*)" should have attributes "([^"]*)"$/ do |email, role_name, options|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => {:email => email})
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  attrs.each_pair do |method, value|
    assert user.send(method) == eval(value)
  end
end

When /^user "([^"]*)" with role "([^"]*)" added lead "([^"]*)" to cart$/ do |email, role_name, lead_name|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => {:email => email})
  lead = Lead.where(:header => lead_name).first
  Cart.new(user).add_lead(lead)
end

Given /^user "([^"]*)" with role "([^"]*)" comes from "([^"]*)"$/ do |email, role_name, country_name|
  address = "User::#{role_name.camelize}".constantize.where(:email => email).first.address
  address.country = Country.where(:name => country_name).first
  address.save
end

Given /^user "([^"]*)" with role "([^"]*)" has address "([^"]*)"$/ do |email, role_name, options|
  user = "User::#{role_name.camelize}".constantize.first(:conditions => {:email => email})
  attrs = Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys
  user.address.update_attributes(attrs)
end

When /^I am signed up and confirmed as user with email "([^"]*)" and password "([^"]*)" and role "([^"]*)" for category "([^"]*)"(?: with attributes "([^"]*)")?$/ do |email, password, role_name, category_name, options|
  std_opts = {:email => email, :password => password, :password_confirmation => password, :buying_categories => [Category.where(:name => category_name).first]}
  opts = options ? Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys.merge(std_opts) : std_opts
  u = "User::#{role_name.camelize}".constantize.make!(opts)
  u.confirm!
  u.buying_categories = std_opts[:buying_categories]
  u.save
end

Then /^user "([^"]*)" should have role "([^"]*)"$/ do |email, role_name|
  User.where(:email => email).first.roles.should include(role_name.to_sym)
end

And /^user "([^"]*)" is confirmed/ do |email|
  User.where(:email => email).first.confirm!
end

When /^user "([^"]*)" is assigned to category "([^"]*)" as category buyer$/ do |email, category_name|
  u = User::CategorySupplier.where(:email => email).first
  u.buying_categories << Category.where(:name => category_name)
end

Given /^customer "([^"]*)" has no subaccounts$/ do |email|
  customer = User::Supplier.find_by_email(email)
  customer.subaccounts.each do |sa|
    sa.update_attribute(:parent_id, nil)
    sa.destroy
  end
end

When /^user "([^"]*)" has no buying categories$/ do |email|
  u = User::CategorySupplier.where(:email => email).first
  u.buying_categories = []
  u.save!
end

Given /^I am a translator for role "([^"]*)" with email "([^"]*)" and password "([^"]*)"$/ do |role, email, password|
  user = "User::#{role.camelize}".constantize.make!(:email => email, :password => password, :password_confirmation => password)
  user.confirm!
  user.roles << :translator
  user.save
end

When /^user with email "([^"]*)" is a subaccount of user with email "([^"]*)" and role "([^"]*)"$/ do |email, parent_email, parent_role|
  if parent_email.present?
    user = User.find_by_email(email).with_role
    parent = "User::#{parent_role.camelize}".constantize.make!(:email => parent_email, :password => "secret", :password_confirmation => "secret")
    user.update_attribute(:parent_id, parent.id)
  end
end

Given /^user with email "([^"]*)" has logged before$/ do |email|
  user = User.find_by_email(email)
  user.update_attribute(:sign_in_count, 10)
end

Given /^big buyer purchase limit is set to (\d+)$/ do |limit|
  Settings.stubs(:big_supplier_purchase_limit).returns(limit.to_f)
end

Given /^user "([^"]*)" should (be|not be) big buyer$/ do |email, is_big_buyer|
  assert User.find_by_email(email).big_buyer? == (is_big_buyer == "be")
end

Given /^user "([^"]*)" should (be|not be) deal maker$/ do |email, is_deal_maker|
  assert User.find_by_email(email).deal_maker? == (is_deal_maker == "be")
end

When /^big buyer purchase limit for user "([^"]*)" is set to (\d+)$/ do |email, limit|
  User.find_by_email(email).update_attribute(:big_buyer_purchase_limit, limit)
end

Then /^user "([^"]*)" has profile copied from lead "([^"]*)"$/ do |email, lead_header|
  u = User.find_by_email(email).with_role
  lead = Lead.where(:header => lead_header).first
  [:address_line_1, :address_line_2, :address_line_3, :zip_code, :country_id, :region_id].each do |field|
    assert u.address.send(field) == lead.send(field)
  end
  assert u.full_name == lead.contact_name
  assert u.screen_name == "#{lead.contact_name.split(' ').first}, #{lead.company_name}"
end

Then /^user "([^"]*)" is no longer category buyer as all his subaccounts$/ do |email|
  user = User.find_by_email(email)
  user.has_role?(:category_buyer).should == false
  user.subaccounts.each { |sub_account| sub_account.has_role?(:category_buyer).should == false }
end

When /^user "([^"]*)" has assigned role "([^"]*)"$/ do |email, role|
  user = User.where(:email => email).first.with_role
  user.roles << role.to_sym
  user.save
end

Given /^there are no object for model "([^"]*)"$/ do |model|
  model.constantize.destroy_all
end

Given /^there is bounced email for "([^"]*)"$/ do |email|
  ArchivedEmail.make!(:bounced, :to => email)
end


Given /^user should exist with email "([^"]*)" and role "([^"]*)"$/ do |email, role|
  assert User.where(:email => email).first.has_role?(role.to_sym)
end

Given /^user with email "([^"]*)" is a test account$/ do |email|
  User.where(:email => email).first.with_role.update_attribute(:test_account, true)
end