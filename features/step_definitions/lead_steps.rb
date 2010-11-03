When /^I follow translated "([^"]*)" for lead "([^"]*)"$/ do |link_name, lead_name|
  I18n.locale = :en
  dom_id      = ActionController::RecordIdentifier.dom_id(Lead.find_by_header(lead_name).last)
  Then %{I follow "#{I18n.t(link_name)}" within "li##{dom_id}"}
end

Given /^pagination page size for leads is set to (\d+)$/ do |n|
  Settings.stubs(:default_leads_per_page).returns(3)
end

#Given /^a lead exists with #([^#]*)# within category "([^"]*)"$/ do |pickle_params,category_name|
#  category = Category.find_by_name(category_name).last
#  Given %{a lead exists with #{pickle_params}, category_id: #{category.id}}
#end

And /Is nice$/ do
  throw [Category.order("id ASC").last, Lead.order("id ASC").last]
end