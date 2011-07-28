Given /^category "([^"]*)" is unique for user with email "([^"]*)" role "([^"]*)"$/ do |category_name, email, role|
  category = Category.where(:name => category_name).first
  category = LeadCategory.make!(:name => category_name) if category.nil?
  user = "User::#{role.camelize}".constantize.where(:email => email).first
  user = "User::#{role.camelize}".constantize.make!(:email => email) if user.nil?
  category.update_attribute(role == "customer" ? :is_customer_unique : :is_agent_unique, true)
  if role == "customer"
    category.is_customer_unique = true
    category.customers << user
  else
    category.is_agent_unique = true
    category.agents << user
  end
  category.save
end

Given /^category "([^"]*)" is unique for some (agents|customers) users and (is|is not) auto buy$/ do |category_name, user_role, is_auto_buy|
  category = Category.where(:name => category_name).first
  category = LeadCategory.make!(:name => category_name) if category.nil?

  if user_role == "customers"
    category.is_customer_unique = true
    category.auto_buy = is_auto_buy == "is" ? true : false
  elsif user_role == "agents"
    category.is_agent_unique = true
  end

  category.save
end

Given /^category named "([^"]*)" should be unique for "([^"]*)"$/ do |name, email|
  category = Category.where(:name => name).first
  user = User.where(:email => email).first

  if user.buyer?
    assert category.is_customer_unique?
  else
    assert category.is_agent_unique?
  end

  assert category.category_customers.map(&:user).include?(user)
end