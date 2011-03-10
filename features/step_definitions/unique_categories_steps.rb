Given /^category "([^"]*)" is unique for user with email "([^"]*)" role "([^"]*)"$/ do |category_name, email, role|
  category = Category.find_by_name(category_name).last
  category = Category.make!(:name => category_name) if category.nil?
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
