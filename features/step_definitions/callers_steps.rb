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

Then /^contact row for "([^\"]*)" has class "([^\"]*)"$/ do |name, css_class|
  page.all(:css, "tr[id='contact_row_id_#{Contact.find_by_company_name(name).id}'][class*='#{css_class}']").size.should == 1
end

Then /^contact row for "([^\"]*)" has not class "([^\"]*)"$/ do |name, css_class|
  page.all(:css, "tr[id='contact_row_id_#{Contact.find_by_company_name(name).id}'][class*='#{css_class}']").size.should == 0
end

Then /^contact result date value is set to Time.now plus 4.days$/ do
  Then %{I fill in "call_result_result_values_attributes_0_value" with "#{(Time.now+4.days).strftime("%Y-%m-%d %H:%M")}" within "#agent_work_screen_call_result"}
end

Then /^display all hidden actions$/ do
  page.execute_script("$('tr .td_actions ul').attr('style', 'display: block');")
end

Then /^I follow contact action "([^\"]*)" within tr "([^\"]*)"$/ do |action, name|
  steps %Q{
  Then display all hidden actions
  Then I follow translated "#{action}" within "#contact_row_id_#{Contact.find_by_company_name(name).id}"
  Then I wait 3 second
}
end

Then /^I change result for current contact to "([^\"]*)"$/ do |result|
  steps %Q{
  Then I follow translated "agent_work_screen.index.show_call_log_for_current_contact"
  Then display all hidden actions
  Then I follow translated "call_results.table.edit_link"
  Then I select "#{result}" from "call_result_result_id"
  Then I wait 3 second
  #{"Then contact result date value is set to Time.now plus 4.days" if result == "Call back"}
  Then I follow translated "call_results.edit.save_button"
  Then I wait 3 second
}
end

Then /^I add result "([^\"]*)" for current contact$/ do |result|
  steps %Q{
  Then I select "#{result}" from "selected_result_id"
  Then I follow translated "call_results.edit.button_new_result"
  #{"Then contact result date value is set to Time.now plus 4.days" if result == "Call back"}
  Then I follow translated "call_results.new.save_button" within "#agent_work_screen_call_result"
  Then I wait 3 second
}
end

Then /^I remove result for current contact$/ do ||
  steps %Q{
  Then I follow translated "agent_work_screen.index.show_call_log_for_current_contact"
  Then display all hidden actions
  Then I confirm a js popup on the next step
  Then I follow translated "call_results.table.remove_link"
  Then I wait 3 second
}
end

Then /^I execute js for select agent_ids "([^\"]*)" to set selected as "([^\"]*)"$/ do |number, value|
  page.execute_script("$(\"select[id=agent_ids] option:eq(#{number})\").attr('selected',#{value})")
end

When /^I confirm a js popup on the next step$/ do
  page.evaluate_script("window.alert = function(msg) { return true; }")
  page.evaluate_script("window.confirm = function(msg) { return true; }")
end

When /^I confirm a js prompt with "([^\"]*)" on the next step$/ do |value|
  page.evaluate_script("window.prompt = function(msg) { return '#{value}'; }")
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