Given /^template named "([^"]*)" for category "([^"]*)" is created by user "([^"]*)" with role "([^"]*)"$/ do |name, category_name, email, role|
  category = Category.where(:name => category_name).first
  category = LeadCategory.make!(:name => category_name) if category.nil?
  user = "User::#{role.camelize}".constantize.first(:conditions => { :email => email })
  user = "User::#{role.camelize}".constantize.make!(:email => email, :password => "secret", :password_confirmation => "secret") if user.nil?
  template = LeadTemplate.new(:current_user => user, :creator => user, :category => category)
  template.attributes = { :name => name }
  template.save!
end

Given /^template named "([^"]*)" (is|is not) mandatory$/ do |name, is_mandatory|
  template = LeadTemplate.where(:name => name).first
  template.update_attributes(:is_mandatory => is_mandatory != "is not" )
end

Given /^template named "([^"]*)" (is|is not) active$/ do |name, is_active|
  template = LeadTemplate.where(:name => name).first
  template.update_attributes(:is_active => is_active != "is not" )
end

Given /^template named "([^"]*)" (is|is not) global$/ do |name, is_global|
  template = LeadTemplate.where(:name => name).first
  template.update_attributes(:is_global => is_global != "is not" )
end

#fields are entered as four values: name:is_hidden:is_mandatory :field_type -- example -- computer count:false:true:1, conditions:true:false:3
Given /^template named "([^"]*)" has following fields "([^"]*)"$/ do |name, fields|
  template = LeadTemplate.where(:name => name).first
  fields.split(",").map { |f| f.to_s.strip.split(':') }.each do |f_name, f_is_hidden, f_is_mandatory, f_field_type|
    template.lead_template_fields.create(:name => f_name, :is_hidden => f_is_hidden == "true" ? true : false,
                                         :field_type => f_field_type.to_i,
                                         :is_mandatory => f_is_mandatory == "true" ? true : false)
  end
end

#values are entered as pairs field name:
Given /^template named "([^"]*)" for lead "([^"]*)" has values "([^"]*)"$/ do |template_name, lead_header, values|
  lead = Lead.where(:header => lead_header).first
  template = LeadTemplate.where(:name => template_name).first
  values.split(",").map{ |v| v.to_s.strip.split(":") }.each do |field_name, value|
    lead_template_field = template.lead_template_fields.detect { |ltf| ltf.name == field_name }
    LeadTemplateValue.create(:lead_template_field => lead_template_field, :value => value, :lead => lead)
  end
end

Given /^template named "([^"]*)" is filled out by someone$/ do |name|
  template = LeadTemplate.where(:name => name).first
  template.lead_template_fields.create(:name => "Some field", :field_type => 0) if template.lead_template_fields.empty?
  template.reload
  LeadTemplateValue.create(:lead_template_field => template.lead_template_fields.first, :value => "Some value")
end