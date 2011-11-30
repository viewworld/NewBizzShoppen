Then /^there should be "([^"]*)" voucher numbers for deal "([^"]*)"$/ do |vouchers, deal|
  Deal.where(:header => deal).first.voucher_numbers.size.should == vouchers.to_i
end

Then /^voucher number with index "([^"]*)" for deal "([^"]*)" has number "([^"]*)" and state "([^"]*)"$/ do |index, deal, number, state|
  deal = Deal.where(:header => deal).first
  deal.voucher_numbers[index.to_i].update_attributes(:number => number, :state => state, :deal_unique_id => deal.deal_unique_id)
end

Then /^I enable voucher with role "([^"]*)"$/ do |role|
  steps %Q{
    Then I am on the #{role} deal edit page for super
    Then I check "deal_voucher_enabled"
    Then I should not see translated "shared.deals.form.edit_voucher_number_link"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then I fill in "deal_deal_price" with "2"
    Then I fill in "deal_discounted_price" with "1"
    Then I fill in "deal_voucher_max_number" with "error"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then I fill in "deal_voucher_max_number" with "0"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then I fill in "deal_voucher_max_number" with "2"
    Then I choose "deal_voucher_until_type_1"
    Then I fill in "deal_voucher_number_of_weeks" with "error"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then I fill in "deal_voucher_number_of_weeks" with "0"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then I fill in "deal_voucher_number_of_weeks" with "2"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then there should be "2" voucher numbers for deal "super"
    Then I am on the #{role} deal edit page for super
    Then I should see translated "shared.deals.form.edit_voucher_number_link"
    Then I fill in "deal_voucher_max_number" with "1"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then there should be "1" voucher numbers for deal "super"
    Then I am on the #{role} deal edit page for super
    Then I fill in "deal_voucher_max_number" with "3"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then there should be "3" voucher numbers for deal "super"
    Then I am on the #{role} deal edit page for super
    Then voucher number with index "0" for deal "super" has number "000000001" and state "active"
    Then voucher number with index "1" for deal "super" has number "000000002" and state "active"
    Then I fill in "deal_voucher_max_number" with "1"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then I fill in "deal_voucher_max_number" with "2"
    Then I am on the #{role} deal edit page for super
    Then I fill in "deal_voucher_max_number" with "4"
    Then I press translated "#{role}.deals.edit.view.update_button"
    Then there should be "4" voucher numbers for deal "super"
    Then I am on the #{role} deal edit page for super
    Then I follow translated "shared.deals.form.edit_voucher_number_link"
    Then I should see translated "voucher_numbers.edit.header"
    Then I fill in "deal_voucher_numbers_attributes_2_number" with "000000003"
    Then I fill in "deal_voucher_numbers_attributes_3_number" with "000000003"
    Then I press translated "voucher_numbers.edit.update_button"
    Then I should see translated "voucher_numbers.update.flash.the_same_number"
    Then I fill in "deal_voucher_numbers_attributes_2_number" with "000000003"
    Then I fill in "deal_voucher_numbers_attributes_3_number" with "00000004"
    Then I press translated "voucher_numbers.edit.update_button"
    Then I should see translated "models.voucher_number.validates_format_of_number"
    Then I fill in "deal_voucher_numbers_attributes_3_number" with "000000004"
    Then I press translated "voucher_numbers.edit.update_button"
    Then I should see translated "voucher_numbers.update.flash.success"
    Then I follow translated "voucher_numbers.edit.back_link"
    Then I fill in "deal_voucher_max_number" with "3"}
end

Then /^I add picture for voucher with role "([^"]*)"$/ do |role|
  user_name = role.include?("call_centre") ? "translator_#{role}" : role
  unless role == "admin"
    steps %Q{
    Then there are no object for model "Deal"
    Then I visit domain http://faircalls.eu
    Then user "#{user_name}@nbs.com" has deal maker role enabled}
  end
  steps %Q{
    Then I sign in as #{user_name}@nbs.com with password secret
    Then a deal is created by "#{user_name}@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1"
    Then I am on the #{role == "admin" ? "administration" : role} deal edit page for super
    Then attach the file "sample image" to "deal_voucher_heading_picture_attributes_asset"
    Then I press translated "#{role == "admin" ? "administration" : role}.deals.edit.view.update_button"
    Then I am on the #{role == "admin" ? "administration" : role} deal edit page for super
    Then I should see translated "deals.common.assets.view.voucher_heading_picture_label"
    Then I follow translated logout link for #{user_name}@nbs.com}
end

Then /^I validate voucher with deal header "([^"]*)" and number "([^"]*)" then I should see message "([^"]*)"$/ do |deal, voucher_number, message|
  deal_id = (deal == "error" ? "error" : Deal.where(:header => deal).first.deal_unique_id)
  steps %Q{
  Then I fill in "deal_unique_id" with "#{deal_id}"
  Then I fill in "voucher_number" with "#{voucher_number}"
  Then I press translated "validate_voucher.show.validate_button"
  Then I should see translated "#{message}"}
end

Then /^voucher number with number "([^"]*)" for deal "([^"]*)" should have state "([^"]*)"$/ do |number, deal, state|
  VoucherNumber.where(:number => number, :deal_unique_id => Deal.where(:header => deal).first.deal_unique_id).first.state.should == state
end