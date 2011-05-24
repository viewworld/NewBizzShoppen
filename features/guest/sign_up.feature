@user_accounts
Feature: Sign up feature

  @m6 @ao @_done @_tested
  Scenario: When I sign up set the country accordingly to selected language
    When I make sure current locale is "en"
    And I am on agent sign up page
    Then "user_agent_address_attributes_country_id" should be selected for value "United Kingdom"
    When I make sure current locale is "dk"
    And I am on buyer sign up page
    Then "user_customer_address_attributes_country_id" should be selected for value "Denmark"

  @m11 @requested
  Scenario: When I am on sign up page, the coutry should be selected to my browser locale/country