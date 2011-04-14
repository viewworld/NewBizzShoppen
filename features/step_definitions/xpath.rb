Then /^I click xpath "([^\"]*)"$/ do |locator|
  page.find(:xpath, locator).click
end

Then /^agent for "([^\"]*)" is blank$/ do |comapny_name|
  Contact.find_by_company_name(comapny_name).agent == nil
end

Then /^agent for "([^\"]*)" is "([^\"]*)"$/ do |comapny_name, agent_name|
  Contact.find_by_company_name(comapny_name).agent.full_name == "John Smith"
end