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