@m5 @ao @home_page
Feature: Home page

  @_done @_tested
  Scenario: I can see icons representing roles for signup
    Given I am on the home page
    Then I should see CSS path "#buyer_sign_up img"
    And I should see CSS path "#purchase_manager_sign_up img"
    And I should see CSS path "#agent_sign_up img"

  @m8 @requested @ao @_done @_tested
  Scenario: When user from Denmark goes to www.fairleads.com her should automatically get danish as default language.
    When browser accepts "en" locale
    And I am on the home page
    Then I should see "Home"
    When browser accepts "da" locale
    And I am on the home page
    Then I should see "Hjemmeside"

  @m8 @requested @ao
  Scenario: If a user enters www.fairleads.dk he should be redirectoed to www.fairleads.com with danish selected as default.

  @m8 @requested @tgn
  Scenario: When a new user sigens in on fairleads, he should be redirected to his new role home page, not the site homepage

  @m8b @requested
  Scenario: Call centre/call centre admin should share the homepage with agent -- correct the cc/cc agent welcome message (move it from the site home to agent home)

  @m8 @requested @tgn @_tested
  Scenario: Make year automatically change in footer
    Given I go to the homepage
    Then I should see "2011 Fairleads Ltd"