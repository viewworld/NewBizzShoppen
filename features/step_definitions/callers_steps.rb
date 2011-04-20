Then /^I click xpath "([^\"]*)"$/ do |locator|
  page.find(:xpath, locator).click
end

Then /^agent for "([^\"]*)" is blank$/ do |comapny_name|
  Contact.find_by_company_name(comapny_name).agent == nil
end

Then /^agent for "([^\"]*)" is "([^\"]*)"$/ do |comapny_name, agent_name|
  Contact.find_by_company_name(comapny_name).agent.full_name == "John Smith"
end

Then /^I execute js for display action block for "([^\"]*)"$/ do |name|
  page.execute_script("$(\"table[id='#{name}'] tr:eq(2) div ul\").attr('style','display:block')")
end

Then /^I execute js for select agent_ids "([^\"]*)" to set selected as "([^\"]*)"$/ do |number, value|
  page.execute_script("$(\"select[id=agent_ids] option:eq(#{number})\").attr('selected',#{value})")
end

When /^I confirm a js popup on the next step$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end

Then /^I should see today date in results table$/ do
  Then %{I should see "#{Date.today.strftime(DateCalculator::FORMAT)}" within "#call_results"}
end

Then /^I should see start week date and and week date in results table$/ do
  Then %{I should see "#{Date.today.beginning_of_week.strftime(DateCalculator::FORMAT)}" within "#call_results"}
  Then %{I should see "#{Date.today.end_of_week.strftime(DateCalculator::FORMAT)}" within "#call_results"}
end

Then /^I should see start month date and and month date in results table$/ do
  Then %{I should see "#{Date.today.beginning_of_month.strftime(DateCalculator::FORMAT)}" within "#call_results"}
  Then %{I should see "#{Date.today.end_of_month.strftime(DateCalculator::FORMAT)}" within "#call_results"}
end

Then /^I should see whole campaign dates in results table for campaign "([^\"]*)"$/ do |campaign_name|
  campaign = Campaign.find_by_name(campaign_name)
  Then %{I should see "#{campaign.start_date.strftime(DateCalculator::FORMAT)}" within "#call_results"}
  Then %{I should see "#{campaign.end_date.strftime(DateCalculator::FORMAT)}" within "#call_results"}
end

Then /^I create call result$/ do
  CallResult.create(:contact_id => Contact.find_by_company_name("Bon Jovi inc.").id,
                    :result_id => Result.find_by_name("Call back").id,
                    :creator_id => User.find_by_email("translator_call_centre_agent@nbs.com").id,
                    :creator_type => "User::CallCentreAgent",
                    :result_values_attributes => [{:value => "#{(Campaign.find_by_name("Testing One").start_date).to_s} 12:12",
                                                   :result_field_id => ResultField.find_by_name("Call back date")}])
end

Then /^I add user "([^\"]*)" to campaign "([^\"]*)"$/ do |user_email, campaign_name|
  CampaignsUser.create(:campaign_id => Campaign.find_by_name(campaign_name).id, :user_id => User.find_by_email(user_email).id)
end