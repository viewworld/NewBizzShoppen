Given /^category "([^"]*)" is unique for user with email "([^"]*)" role "([^"]*)"$/ do |category_name, email, role|
  category = Category.find_by_name(category_name).last
  user = "User::#{role.camelize}".constantize.where(:email => email).first
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
