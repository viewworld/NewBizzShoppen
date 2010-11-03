When /^I follow translated "([^"]*)" for lead "([^"]*)"$/ do |link_name, lead_name|
  I18n.locale = :en
  dom_id      = ActionController::RecordIdentifier.dom_id(Lead.find_by_header(lead_name).last)
  Then %{I follow "#{I18n.t(link_name)}" within "li##{dom_id}"}
end

Given /^pagination page size for leads is set to (\d+)$/ do |n|
  Settings.stubs(:default_leads_per_page).returns(3)
end
