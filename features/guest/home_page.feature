@m5 @ao @home_page
Feature: Home page

  @_done @_tested @_deprecated
  Scenario: I can see icons representing roles for signup
#    Given I am on the home page
#    Then I should see CSS path "#buyer_sign_up img"
#    And I should see CSS path "#purchase_manager_sign_up img"
#    And I should see CSS path "#agent_sign_up img"

  @m8 @_requested @ao @_done @_tested
  Scenario: When user from Denmark goes to www.fairleads.com her should automatically get danish as default language.
    When browser accepts "en" locale
    And I am on the home page
    Then locale is set to "en" for translation "supplier_home.show.view.header"
    And I reset page
    When browser accepts "da" locale
    And I am on the home page
    Then locale is set to "da" for translation "supplier_home.show.view.header"

  # set up on server side
  @m8 @_requested @ao @_done @non_testable
  Scenario: If a user enters www.fairleads.dk he should be redirectoed to www.fairleads.com with danish selected as default.

  @m8 @_requested @tgn @_tested_elsewhere @_done
  Scenario: When a new user sigens in on fairleads, he should be redirected to his new role home page, not the site homepage

  @m8b @_requested @tgn @_tested @_done @faircalls
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
    And user "bob2@person.com" with role "call_centre_agent" has attributes "first_name:Elizer, company_name: Yudkowsky"
    And an user with role call_centre_agent and email bob2@person.com belongs to call centre bob@person.com
    And I sign in as bob2@person.com with password supersecret
    And I go to agent home
    And I should see "Welcome Elizer, Yudkowsky @ Xerox"
    And I should see "Blurb call centre home"
    Given I am not sign in
    Given I am signed up and confirmed as user with email bob3@person.com and password supersecret and role agent
    And I sign in as bob3@person.com with password supersecret
    And I go to agent home
    Then I should see "Welcome agent"
    And I should see "Blurb agent home"

  @m8 @_requested @tgn @_tested @_done
  Scenario: Make year automatically change in footer
    Given I go to the homepage
    Then I should see "2012 Fairleads Ltd"

  #7638
  @m20 @_requested @ao @_done @_tested
  Scenario: Frontpage for fairleads.com should be the supplier home page
    When I am on the home page
    Then I should see translated "supplier_home.show.view.header"

  #7747
  @m20 @_requested @ao @non_testable @_done
  Scenario: Integration with User Voice

  #9269
  @m26 @_requested @tgn @_done @_tested
  Scenario: I can see different terms and conditions page for fairleads,fairdeals and faircalls
    Given I am on the homepage
    And I follow "Terms & Conditions"
    Given I visit domain http://fairdeals.eu
    And I follow "Fairdeals Terms & Conditions"
    Given I visit domain http://faircalls.eu
    And I follow "Faircalls Terms & Conditions"

  #9564
  @m26 @_requested @tgn @_done @_tested
  Scenario: I should not see Browse leads from fairleads.com when I'm not logged in
    Given I am on the homepage
    And I am not sign in
    Then I should not see translated "layout.main_menu.shared.browse_leads"
    When I sign in as translator_customer@nbs.com with password secret
    Then I should see translated "layout.main_menu.shared.browse_leads"

  #10977
  @m32 @_requested
  Scenario: When I click on the latest deal on the public buyer home page then Fairdeals should open with that deal in new tab