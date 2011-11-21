@faircalls @ao
Feature: Faircalls home page

#7843
@m20 @requested @_done @_tested
Scenario: When I go to faircalls.de or faircalls.eu I should be redirected to agent home page
  When I visit domain http://faircalls.dk
  Then I should see translated "agent_home.show.view.header"

#7843
@m20 @requested @_done @_tested
Scenario: My locale should be based on the domain from which I entered
  When I visit domain http://faircalls.dk
  Then locale should be set to "da"
  When I visit domain http://faircalls.eu
  Then locale should be set to "en"

@m22 @requested
Scenario: I should not see browse deals and browse leads tabs when on agent home page

#8388
@m23 @requested @_done @_tested
Scenario: When I am logged in I should see value created bar over the blurb (bar fro agent work screen)
  When I visit domain http://faircalls.dk
  Then I should not see translated "agent_work_screen.index.agent_information.value_created"
  And I should not see translated "agent_work_screen.index.agent_information.time"
  When I sign in as translator_call_centre_agent@nbs.com with password secret
  Then I should see translated "agent_work_screen.index.agent_information.value_created"
  And I should see translated "agent_work_screen.index.agent_information.time"

#8388
# Use abbreviations if the value including the current values can't stay on one line.
@m23 @requested @_done @_tested
Scenario: I should see additional information in the bar Time: Today (HH/MM)
  When I visit domain http://faircalls.dk
  And I sign in as translator_call_centre_agent@nbs.com with password secret
  Then I should see "Time: Today"

#8388
# Use abbreviations if the value including the current values can't stay on one line.
@m23 @requested @_done @_tested
Scenario: I should see additional information in the bar Time: This Week (HH/MM)
  When I visit domain http://faircalls.dk
  And I sign in as translator_call_centre_agent@nbs.com with password secret
  Then I should see "This week"

#8388
# Use abbreviations if the value including the current values can't stay on one line.
@m23 @requested @_done @_tested
Scenario: I should see additional information in the bar Time: Last 4 Weeks (HH/MM)
  When I visit domain http://faircalls.dk
  And I sign in as translator_call_centre_agent@nbs.com with password secret
  Then I should see "Last 4 weeks"

#8387
@m23 @requested
Scenario: I should see my active "Campaigns" in the left box

#8387
@m23 @requested
Scenario: I should see Campaign name, Pending Contacts, Call Backs, Completion for each campaign in the "Campaigns" box

#8387
@m23 @requested
Scenario: When I click a campaign in "Campaigns" box then I should be redirected to agent work screen for that campaign

#8387
@m23 @requested
Scenario: I should see my latest call log "History" in the middle box

#8387
@m23 @requested
Scenario: I should see Company name, result, date for each log in "History" box

#8387
@m23 @requested
Scenario: When I click a call log in the "History" box then I should be redirected to agent work screen with that item selected

#8387
@m23 @requested
Scenario: I should see my latest mails and comments in the "Communication" box

#8387
@m23 @requested
Scenario: I should see email address, date, status (bounce/delivered) in "Communication" box

#8387
@m23 @requested
Scenario: When I click on an email then I should be redirected to the agent work screen wth that item selected
