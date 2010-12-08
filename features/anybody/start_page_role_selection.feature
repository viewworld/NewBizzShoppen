@start_pages @m2
Feature: Start page role selection

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email buyer43@person.com and password supersecret and role customer

@m3 @ao @_done
Scenario: I can see welcome text fetch from the database
  And I open page in browser
  Then I should see "Blurb start page role selection"

@tgn @_done @_tested_elsewhere
Scenario: I can login to the system

@tgn @_done @_tested
Scenario: I can go to buyer page
  When I follow translated "home.show.view.buyer"
  Then I am on buyer home

@tgn @_done @_tested
Scenario: I can go to the agent page
  When I follow translated "home.show.view.agent"
  Then I am on agent home

@tgn @_done @_tested
Scenario: I can set remember me option by selecting a checkbox and logging in
  When I fill in "user_email" with "buyer43@person.com"
  And I fill in "user_password" with "supersecret"
  And I check "user_remember_me"
  And I press translated "home.show.view.sign_in"
  Then I should see translated "devise.sessions.signed_in"