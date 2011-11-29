@m5 @ao @home_page
Feature: Home page

  @_done @_tested @_deprecated
  Scenario: I can see icons representing roles for signup
#    Given I am on the home page
#    Then I should see CSS path "#buyer_sign_up img"
#    And I should see CSS path "#purchase_manager_sign_up img"
#    And I should see CSS path "#agent_sign_up img"

  @m8 @requested @ao @_done @_tested
  Scenario: When user from Denmark goes to www.fairleads.com her should automatically get danish as default language.
    When browser accepts "en" locale
    And I am on the home page
    Then locale is set to "en" for translation "supplier_home.show.view.header"
    And I reset page
    When browser accepts "da" locale
    And I am on the home page
    Then locale is set to "da" for translation "supplier_home.show.view.header"

  # set up on server side
  @m8 @requested @ao @_done @non_testable
  Scenario: If a user enters www.fairleads.dk he should be redirectoed to www.fairleads.com with danish selected as default.

  @m8 @requested @tgn @_tested_elsewhere @_done
  Scenario: When a new user sigens in on fairleads, he should be redirected to his new role home page, not the site homepage

  @m8b @requested @tgn @_tested @_done @faircalls
  Scenario: Call centre/call centre admin should share the homepage with agent -- correct the cc/cc agent welcome message (move it from the site home to agent home)
    Given I visit domain http://faircalls.eu
    And I am on the home page
    And I am signed up and confirmed as user with email bob@person.com and password supersecret and role call_centre
    And user "bob@person.com" with role "call_centre" has attributes "company_name: Xerox"
    And I sign in as bob@person.com with password supersecret
    Then I should see "Welcome Xerox"
    And I should see "Blurb call centre home"
    Given I am not sign in
    Given I am signed up and confirmed as user with email bob2@person.com and password supersecret and role call_centre_agent
    And user "bob2@person.com" with role "call_centre_agent" has attributes "screen_name: Yudkowsky"
    And an user with role call_centre_agent and email bob2@person.com belongs to call centre bob@person.com
    And I sign in as bob2@person.com with password supersecret
    And I go to agent home
    And I should see "Welcome Yudkowsky @ Xerox"
    And I should see "Blurb call centre home"
    Given I am not sign in
    Given I am signed up and confirmed as user with email bob3@person.com and password supersecret and role agent
    And I sign in as bob3@person.com with password supersecret
    And I go to agent home
    Then I should see "Welcome agent"
    And I should see "Blurb agent home"

  @m8 @requested @tgn @_tested @_done
  Scenario: Make year automatically change in footer
    Given I go to the homepage
    Then I should see "2011 Fairleads Ltd"

  #7638
  @m20 @requested @ao @_done @_tested
  Scenario: Frontpage for fairleads.com should be the supplier home page
    When I am on the home page
    Then I should see translated "supplier_home.show.view.header"

  #7747
  @m20 @requested @ao @non_testable @_done
  Scenario: Integration with User Voice