Given /^template named "([^"]*)" for category "([^"]*)" is created by user "([^"]*)" with role "([^"]*)"$/ do |name, category_name, email, role|
  category = Category.find_by_name(category_name).last
  category = Category.make!(:name => category_name) if category.nil?
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user = "User::#{role.camelize}".constantize.make!(:email => email, :password => "secret", :password_confirmation => "secret") if user.nil?
  template = LeadTemplate.new(:current_user => user, :creator => user, :category => category)
  template.attributes = { :name => name }
  template.save!
end