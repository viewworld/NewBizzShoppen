Given /^campaign named "([^"]*)" exists with attributes "([^"]*)"$/ do |campaign_name, options|
  campaign = Campaign.where(:name => campaign_name).first
  campaign.update_attributes(Hash[*options.split(/[,:]/).map(&:strip)].symbolize_keys)
end

Given /^I edit campaign "([^\"]*)"$/ do |campaign_name|
  visit "/callers/campaigns/#{Campaign.find_by_name(campaign_name).id}/edit"
end

Given /^I edit contact "([^\"]*)"$/ do |company_name|
  contact = Contact.find_by_company_name(company_name)
  visit "/callers/campaigns/#{contact.campaign_id}/contacts/#{contact.id}/edit"
end

Given /^I am adding "([^\"]*)" result for contact "([^\"]*)"$/ do |result_name, company_name|
  visit "/callers/contacts/#{Contact.find_by_company_name(company_name).id}/call_results/new?result_id=#{Result.find_by_name(result_name).id}"
end

Given /^I am adding (call log|final) result in campaign "([^\"]*)"$/ do |result_type, campaign_name|
  visit "/callers/campaigns/#{Campaign.find_by_name(campaign_name).id}/results/new?type=#{result_type}"
end

Given /^the custom ([^\"]*) result with name "([^\"]*)" is created by "([^\"]*)"$/ do |result_type, name, email|
  Result.create :name => name, :final => (result_type == "final"), :creator => User.find_by_email(email).with_role
end

Given /^I check result "([^\"]*)"$/ do |result_name|
  check("result_ids_#{Result.find_by_name(result_name).id}")
end

Given /^result "([^\"]*)" is assigned to campaign "([^\"]*)"$/ do |result_name, campaign_name|
  Campaign.find_by_name(campaign_name).results << Result.find_by_name(result_name)
end

Given /^result "([^\"]*)" should be assigned to campaign "([^\"]*)"$/ do |result_name, campaign_name|
  Campaign.find_by_name(campaign_name).results.include? Result.find_by_name(result_name)
end

Given /^result "([^\"]*)" has (mandatory|optional) "([^\"]*)" field$/ do |result_name, type, field|
  field_data = field.split("/")
  ResultField.create :name => field_data[0], :field_type => "ResultField::#{field_data[1]}".constantize, :result => Result.find_by_name(result_name), :is_mandatory => (type == "mandatory")
end

Given /^I fill in "([^\"]*)" field with future datetime$/ do |field_name|
  fill_in(field_name, :with => (DateTime.now + 1.day).strftime("%Y-%m-%d %H:%M"))
end

Given /^I fill in "([^\"]*)" field with future date$/ do |field_name|
  fill_in(field_name, :with => (DateTime.now + 1.day).strftime("%Y-%m-%d"))
end

Given /^contact "([^\"]*)" should be pending$/ do |company_name|
  contact = Contact.find_by_company_name(company_name)
  assert contact.pending?
  assert (not Contact.available_to_assign.include?(contact))
end

Given /^contact "([^\"]*)" should be at bottom of the list$/ do |company_name|
  contact = Contact.find_by_company_name(company_name)
  assert contact.last?
end

Given /^contact "([^\"]*)" should be completed$/ do |company_name|
  contact = Contact.find_by_company_name(company_name)
  assert contact.completed?
end

Given /^contact "([^\"]*)" should be upgraded to lead$/ do |company_name|
  assert Contact.find_by_company_name(company_name).completed?
  assert Lead.find_by_company_name(company_name).present?
end

Given /^I fill in "([^\"]*)" with import data for contacts$/ do |field_name|
  formatted_rows = "\"Company name\"\t\"Company phone number\"\t\"Company website\"\t\"Address line 1\"\t\"Address line 2\"\t\"Address line 3\"\t\"Zip code\"\t\"Country\"\t\"Region\"\t\"Company vat no\"\t\"Company ean number\"\t\"Contact name\"\t\"Direct phone number\"\t\"Phone number\"\t\"Email address\"\t\"Linkedin url\"\t\"Facebook url\"\t\"Note\"\r\n\"Greg and sons\"\t\"888 112 113\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"Denmark\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\r\n\"Little Franky\"\t\"510 333 333\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"Denmark\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\r\n\"Boiled fisher\"\t\"888 422 633\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"Denmark\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\r\n\"Novik company\"\t\"602 222 333\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"Denmark\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\"\t\"\""
  fill_in(field_name, :with => formatted_rows)
end

Given /^imported contacts should be in campaign "([^\"]*)"$/ do |campaign_name|
  campaign = Campaign.find_by_name(campaign_name)
  ["Greg and sons", "Little Franky", "Boiled fisher", "Novik company"].each do |company_name|
    assert Contact.find_by_company_name(company_name).campaign_id == campaign.id
  end
end

Given /^user "([^\"]*)" (has|has not) contacts assigned in campaign "([^\"]*)"$/ do |email, status, campaign_name|
  contacts = User.find_by_email(email).with_role.contacts
  assert (status == "has not" ? contacts.blank? : (contacts.count == Campaign.find_by_name(campaign_name).max_contact_number))
end

Given /^user "([^\"]*)" should see his (available|pending) contacts$/ do |email, status|
  User.find_by_email(email).with_role.contacts.with_pending_status(status == "pending").each do |c|
    Then 'I should see "' + c.company_name + '"'
  end
end

When /^there are no more active contacts for agent "([^"]*)"$/ do |email|
  user = User.where(:email => email).first.with_role
  user.contacts.with_pending_status(false)
end

Then /^current call back result for contact "([^"]*)" has date set to time now "([^"]*)" 15 minutes$/ do |name, sign|
  ccr = Contact.find_by_company_name(name).current_call_result
  rv = ccr.result_values.first
  if sign == "-"
    rv.value = (Time.now-15.minutes).strftime("%Y-%m-%d %H:%M")
  else
    rv.value = (Time.now+15.minutes).strftime("%Y-%m-%d %H:%M")
  end
  rv.save!
  ccr.save!
end