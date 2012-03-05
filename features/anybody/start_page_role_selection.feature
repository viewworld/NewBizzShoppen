@start_pages @m2
Feature: Start page role selection

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email buyer43@person.com and password supersecret and role supplier

@m3 @ao @_done @_deprecated
Scenario: I can see welcome text fetch from the database
#  Then I should see "Blurb start page role selection"

@tgn @_done @_tested_elsewhere @_deprecated
Scenario: I can login to the system

@tgn @_done @_tested @_deprecated
Scenario: I can go to buyer page
#  When I follow translated "home.show.view.buyer"
#  Then I am on buyer home

@tgn @_done @_tested @_deprecated
Scenario: I can go to the agent page
#  When I follow translated "home.show.view.agent"
#  Then I am on agent home

@tgn @_done @_tested @_deprecated
Scenario: I can set remember me option by selecting a checkbox and logging in
#  When I fill in "user_email" with "buyer43@person.com"
#  And I fill in "user_password" with "supersecret"
#  And I check "user_remember_me"
#  And I press translated "home.show.view.sign_in"
#  Then I should see translated "devise.sessions.signed_in"

#7455
@m19 @_requested @_done @_tested @faircalls
Scenario: For each role homepage there should be two separate blurbs: for logged in and logged out user
  #buyer
  Given I am not sign in
  And I visit domain http://fairleads.eu
  And I am on the supplier home page
  And I should see "Blurb supplier home"
  And I should not see "Blurb supplier home logged in"
  And I sign in as buyer@nbs.com with password secret
  And I am on the supplier home page
  And I should see "Blurb supplier home logged in"
  #agent
  Given I am not sign in
  And I visit domain http://faircalls.eu
  And I am on the agent home page
  And I should see "Blurb agent home"
  And I should not see "Blurb agent home logged in"
  And I sign in as agent@nbs.com with password secret
  And I am on the agent home page
  And I should see "Blurb agent home logged in"
  #purchase manager
  # home page for member is deprecated
#  Given I am not sign in
#  And I visit domain http://fairdeals.eu
#  And I am on the member home page
#  And I should see "Blurb member home"
#  And I should not see "Blurb agent home logged in"
#  And I sign in as translator_purchase_manager@nbs.com with password secret
#  And I am on the member home page
#  And I should see "Blurb member home logged in"

#7452
@m19 @_requested @_done @_tested @faircalls
Scenario: When user logs out then he lands on his specific role home page
  #buyer
  Given I am not sign in
  And I visit domain http://fairleads.eu
  And I am on the supplier home page
  And I sign in as buyer@nbs.com with password secret
  And I should be on supplier home
  Then I am not sign in
  And I should be on supplier home
  #agent
  Given I am not sign in
  And I visit domain http://faircalls.eu
  And I am on the agent home page
  And I sign in as agent@nbs.com with password secret
  And I should be on agent home
  Then I am not sign in
  And I should be on agent home
  #purchase manager
  # home page for member is deprecated
#  Given I am not sign in
#  And I visit domain http://fairdeals.eu
#  And I am on the member home page
#  And I sign in as translator_purchase_manager@nbs.com with password secret
#  And I should be on member home
#  Then I am not sign in
#  And I should be on the homepage