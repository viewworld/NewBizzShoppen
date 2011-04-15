Then /^I click xpath "([^\"]*)"$/ do |locator|
  page.find(:xpath, locator).click
end

Then /^agent for "([^\"]*)" is blank$/ do |comapny_name|
  Contact.find_by_company_name(comapny_name).agent == nil
end

Then /^agent for "([^\"]*)" is "([^\"]*)"$/ do |comapny_name, agent_name|
  Contact.find_by_company_name(comapny_name).agent.full_name == "John Smith"
end

Then /^I execute js for display action block$/ do
  page.execute_script("$(\"table[id='call_results'] tr:eq(2) div ul\").attr('style','display:block')")
end

When /^I confirm a js popup on the next step$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end
