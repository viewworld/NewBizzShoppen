# only final results
@m15 @result_values @_requested @tgn @selenium
Feature: Result values

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/\/callers\/campaigns$/"
    Given I follow translated "campaigns.header.new_campaign_button"
    And I fill in "campaign_name" with "Testing Template"
    And I fill in "campaign_max_contact_number" with "18"
    And I fill in "campaign_start_date" with "2011-11-11"
    And I fill in "campaign_end_date" with "2011-12-12"
    And I select "Leisure" from "campaign_category_id"
    And I select "United Kingdom" from "campaign_country_id"
    And I select "DKK" from "campaign_currency_id"
    And I fill in "campaign_finished_contacts_per_hour" with "4"
    And I fill in "campaign_production_value_per_hour" with "3342"
    And I fill in "campaign_success_rate" with "48"
    And I choose "campaign_cost_type_3"
    And I press "campaign_submit"

  @_tested @_done
  Scenario: It should be possible to assign a value to a result
    And I follow translated "campaigns.edit.button_manage_result_types"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/results\/\d+\/edit/"
    And I fill in "result_campaigns_results_attributes_0_value" with "2159.99"
    And I press translated "campaigns.edit.button_update"

  @_done @tested_elsewhere
  Scenario: Result 'Upgraded to lead' should have a value of created lead

  @_done @tested_elsewhere
  Scenario: I can specify result value for each final result type when I assign result types to campaign

  # checkbox
  @_done @_tested
  Scenario: I can specify that a given final result counts as success
    And I follow translated "campaigns.edit.button_manage_result_types"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/results\/\d+\/edit/"
    And I check "result_campaigns_results_attributes_0_is_success"
    And I press translated "campaigns.edit.button_update"

  # checkbox
  @_done @_tested
  Scenario: I can specify whether a given final result type should be included in campaign reporting or not
    And I follow translated "campaigns.edit.button_manage_result_types"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/results\/\d+\/edit/"
    And I check "result_campaigns_results_attributes_0_is_reported"
    And I press translated "campaigns.edit.button_update"

  # like  "0,4" for result pr. hour means that 10 hours of work creates 4 result of the given type.
  @_done @_tested
  Scenario: I can specify the expected completed results per hour rate when assigning results to project
    And I follow translated "campaigns.edit.button_manage_result_types"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/results\/\d+\/edit/"
    And I fill in "result_campaigns_results_attributes_0_expected_completed_per_hour" with "0.9"
    And I press translated "campaigns.edit.button_update"

  # no matter what currency is selected
  @_done @non_testable
  Scenario: All result values should be stored additionally in Euro

  #9889
  @m28 @_requested @tgn @_done @_tested
  Scenario: I can check if the field for any given result should be used for dynamic value calculation if it is of the number type
    Given the custom final result with name "Upgrade to supplier (manual)" is created by "blazejek@gmail.com"
    And result "Upgrade to supplier (manual)" is assigned to campaign "Testing Template"
    And result named "Upgrade to supplier (manual)" has field with attributes "field_type:0,name:Sold items1"
    And result named "Upgrade to supplier (manual)" has field with attributes "field_type:0,name:Sold items2"
    And I follow translated "campaigns.edit.button_manage_result_types"
    And I follow edit page for result named "Upgrade to supplier (manual)" for campaign "Testing Template"
    And I check "result_campaigns_results_attributes_0_is_dynamic_value"
    And I select "Number" from "result_result_fields_attributes_0_field_type"
    And I select "Number" from "result_result_fields_attributes_1_field_type"
    And I check "result_result_fields_attributes_0_campaigns_result_fields_attributes_0_is_dynamic_value"
    And I check "result_result_fields_attributes_1_campaigns_result_fields_attributes_0_is_dynamic_value"
    And I fill in "result_result_fields_attributes_0_campaigns_result_fields_attributes_0_dynamic_euro_value" with "100"
    And I fill in "result_result_fields_attributes_1_campaigns_result_fields_attributes_0_dynamic_euro_value" with "200"
    And I press translated "campaigns.edit.button_update"
    And I follow edit page for result named "Upgrade to supplier (manual)" for campaign "Testing Template"
    Then the "result_result_fields_attributes_0_campaigns_result_fields_attributes_0_dynamic_euro_value" field should contain "100"
    Then the "result_result_fields_attributes_1_campaigns_result_fields_attributes_0_dynamic_euro_value" field should contain "200"

  #9889
  @m28 @_requested @tgn @_done @_tested_elsewhere
  Scenario: I can enter amount in Euro for dynamic value calculation if type is selected for calculation

  #9889
  @m28 @_requested @tgn @_done @_tested_elsewhere
  Scenario: I can check that value for result should be calculated dynamically based on the sum of fields' values

  #10960
  @m32 @_requested @_done @_tested_elsewhere @_rspec @tgn
  Scenario: I should be able to mark given result as reported per campaign

  #10960
  @m32 @_requested @_done @_tested_elsewhere @_rspec @tgn
  Scenario: I should be able to mark given result as success per campaign

  #10960
  @m32 @_requested @_done @_tested @tgn
  Scenario: When I mark one result as reported and/or success in one campaign then it should not be reported/success in others where that I didn't mark it
    And the custom final result with name "Call disturbed" is created by "blazejek@gmail.com"
    And result "Call disturbed" is assigned to campaign "Testing One"
    And I go to edit result "Call disturbed" for campaign "Testing One"
    And I check "result_campaigns_results_attributes_0_is_reported"
    And I check "result_campaigns_results_attributes_0_is_success"
    And I press translated "campaigns.edit.button_update"
    And I go to edit result "Call disturbed" for campaign "Testing One"
    And the "result_campaigns_results_attributes_0_is_reported" checkbox should be checked
    And the "result_campaigns_results_attributes_0_is_success" checkbox should be checked
    And result "Call disturbed" is assigned to campaign "Testing Two"
    And I go to edit result "Call disturbed" for campaign "Testing Two"
    And the "result_campaigns_results_attributes_0_is_reported" checkbox should not be checked
    And the "result_campaigns_results_attributes_0_is_success" checkbox should not be checked

  #10862
  @m32 @_requested @_done @_tested_elsewhere @tgn
  Scenario: I can archive/retrieve selected results

  #10862
  @m32 @_requested @_done @_tested @tgn
  Scenario: When result is assigned to some campaigns and then archived it should not be visible under any other campaign to which it is not assigned
    And the custom final result with name "Call disturbed" is created by "blazejek@gmail.com"
    And result "Call disturbed" is assigned to campaign "Testing One"
    And I go to results management for campaign Testing One
    And I should see "Call disturbed"
    And I go to results management for campaign Testing Two
    And I should see "Call disturbed"
    And result named "Call disturbed" has attributes "is_archived:1"
    And I go to results management for campaign Testing One
    And I should see "Call disturbed"
    And I go to results management for campaign Testing Two
    And I should not see "Call disturbed"

  #10862
  @m32 @_requested @_done @_tested @tgn
  Scenario: I can manage the results globally outside the campaign context from Settings
    Given I click hidden link by url regex "/administration\/results/"
    And I should see "Upgrade to supplier"
    And I should see "Not in"
    And I fill in "search_with_keyword" with "upgrade to member"
    And I press translated "administration.results.index.view.search.search_button"
    And display all hidden actions
    And I follow translated "administration.results.index.view.edit"
    And I check "result_is_archived"
    And I press translated "administration.results.edit.view.button_update"
    Then I should not see "Upgrade to member"
    And I select "Yes" from "search_with_archived"
    And I press translated "administration.results.index.view.search.search_button"
    Then I should see "Upgrade to member"

  #10861
  @m32 @_requested @tgn @_done @_tested
  Scenario: I can mark result as global
    Given I go to results management for campaign Testing One
    And I follow translated "results.index.button_add_result_type"
    And I fill in "result_name" with "Global call interrupted"
    And I press translated "campaigns.new.button_create"
    Then I should see "Global call interrupted"
    And result "Global call interrupted" should not be assigned to campaign "Testing One"
    Given I go to results management for campaign Testing Two
    Then I should see "Global call interrupted"
    Given I go to results management for campaign Testing One
    And I follow translated "results.index.button_add_result_type"
    And I fill in "result_name" with "Local call interrupted"
    And I uncheck "result_is_global"
    And I press translated "campaigns.new.button_create"
    Then I should see "Local call interrupted"
    And result "Local call interrupted" should be assigned to campaign "Testing One"
    Given I go to results management for campaign Testing Two
    Then I should not see "Local call interrupted"
    Given I go to edit result "Local call interrupted" for campaign "Testing One"
    And I check "result_is_global"
    And I press translated "campaigns.edit.button_update"
    And result "Local call interrupted" should be assigned to campaign "Testing One"
    Given I go to results management for campaign Testing Two
    Then I should see "Local call interrupted"
    And I check result "Local call interrupted"
    And I press translated "results.index.button_assign_result_types"
    And result "Local call interrupted" should be assigned to campaign "Testing Two"
    Given I go to edit result "Local call interrupted" for campaign "Testing Two"
    And the "result_is_global" field should be disabled

  #10861
  @m32 @_requested @tgn @_done @_tested_elsewhere
  Scenario: I can mark result as local (visible to only one campaign)

  #10861
  @m32 @_requested @tgn @_done @_tested_elsewhere
  Scenario: Global and local result should be applied to campaign report

  #10861
  @m32 @_requested @tgn @_done @_tested_elsewhere
  Scenario: Global and local result should be applied to agent timesheets