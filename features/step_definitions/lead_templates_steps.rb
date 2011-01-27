Given /^template named "([^"]*)" for category "([^"]*)" is created by user "([^"]*)" with role "([^"]*)"$/ do |name, category_name, email, role|
  category = Category.find_by_name(category_name).last
  category = Category.make!(:name => category_name) if category.nil?
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user = "User::#{role.camelize}".constantize.make!(:email => email, :password => "secret", :password_confirmation => "secret") if user.nil?
  template = LeadTemplate.new(:current_user => user, :creator => user, :category => category)
  template.attributes = { :name => name }
  template.save!
end

Given /^template named "([^"]*)" is filled out by someone$/ do |name|
  template = LeadTemplate.find_by_name(name)
  template.lead_template_fields.create(:name => "Some field", :field_type => 0) if template.lead_template_fields.empty?
  template.reload
  LeadTemplateValue.create(:lead_template_field => template.lead_template_fields.first, :value => "Some value")
end