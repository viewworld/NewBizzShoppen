@m5 @ao
Feature: Home page

  @_done @_tested
  Scenario: I can see icons representing roles for signup
    Given I am on the home page
    Then I should see CSS path "#buyer_sign_up img"
    And I should see CSS path "#purchase_manager_sign_up img"
    And I should see CSS path "#agent_sign_up img"

  @m8 @requested
  Scenario: When user from Denmark goes to www.fairleads.com her should automatically get danish as default language.

  @m8 @requested
  Scenario: If a user enters www.fairleads.dk he should be redirectoed to www.fairleads.com with danish selected as default.

  @m8 @requested
  Scenario: When a new user sigens in on fairleads, he should be redirected to his new role home page, not the site homepage