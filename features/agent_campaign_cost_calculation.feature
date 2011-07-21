@m15 @cost_calculation @requested @_tgn
Feature: Cost calculation

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I follow translated "layout.main_menu.call_centre.campaigns"

  # radiobuttons for the following 4 options
  @$_administrator @$_call_centre @selenium @_done @_tested
  Scenario: I can select a fixed cost for campaign and enter value
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
    And I choose "campaign_cost_type_0"
    And I fill in "campaign_fixed_cost_value" with "2012"
    And I press "campaign_submit"

  @$_administrator @$_call_centre @selenium @_done @_tested
  Scenario: I can select a agent's billing rate
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
    And I choose "campaign_cost_type_1"
    And I press "campaign_submit"

  @$_administrator @$_call_centre @selenium @_done @_tested
  Scenario: I can select fixed hourly rate and enter value
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
    And I choose "campaign_cost_type_2"
    And I fill in "campaign_fixed_cost_value" with "211"
    And I press "campaign_submit"

  @$_administrator @$_call_centre @selenium @_done @_tested
  Scenario: I can select not to calculate costs
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

  @$_administrator @$_call_centre @_done @_tested
  Scenario: I can specify agent's billing rate
    Given I follow translated "layout.main_menu.admin.users"
    And I select "Agent" from "search_with_role"
    And I press translated "administration.users.index.view.search_button"
    And I follow translated "administration.users.index.view.edit"
    And I fill in "user_agent_billing_rate" with "21"
    And I select "DKK" from "user_agent_currency_id"
    And I press translated "administration.users.edit.view.button_update_user"
    And I should see translated "administration.users.update.flash.user_update_successful"

  @$_administrator @$_call_centre @_done @non_testable
  Scenario: All rates should be stored additionally in Euro for reporting

  @$_call_centre_agent @_done @non_testable
  Scenario: Agent timesheets should include current agent's billing rate
