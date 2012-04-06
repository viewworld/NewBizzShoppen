@m15 @campaign_targets @$_administrator @_requested @tgn
Feature: Agent campaign targets

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/\/campaigns/"

  @_tested @selenium @_tested @_done
  Scenario: When creating new campaign I can select a currency
    And I open page in browser
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

  # Number
  @_done @tested_elsewhere
  Scenario: When creating new campaign I can specify the 'Finish contacts per hour'

  # Expected. Only final results has value
  @_done @tested_elsewhere
  Scenario: When creating new campaign I can specify the 'Production value per hour'

  # Number of completed contacts with a successfull result Vs number of finished contacts
  @_done @tested_elsewhere
  Scenario: When creating new campaign I can specify the 'Success rate'

