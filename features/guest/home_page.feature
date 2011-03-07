@m5 @ao
Feature: Home page

  @_done @_tested
  Scenario: I can see icons representing roles for signup
    Given I am on the home page
    Then I should see CSS path "#buyer_sign_up img"
    And I should see CSS path "#purchase_manager_sign_up img"
    And I should see CSS path "#agent_sign_up img"
