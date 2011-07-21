# only final results
@m15 @result_values @requested @tgn @selenium
Feature: Result values

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I follow translated "layout.main_menu.call_centre.campaigns"
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
    And I check "result_is_success"
    And I press translated "campaigns.edit.button_update"

  # checkbox
  @_done @_tested
  Scenario: I can specify whether a given final result type should be included in campaign reporting or not
    And I follow translated "campaigns.edit.button_manage_result_types"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/results\/\d+\/edit/"
    And I check "result_is_reported"
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