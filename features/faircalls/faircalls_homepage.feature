@faircalls @ao
Feature: Faircalls home page

  # #7843
  # @m20 @_requested @_done @_tested @faircalls @_deprecated2014
  # Scenario: When I go to faircalls.de or faircalls.eu I should be redirected to agent home page
  #   When I visit domain http://faircalls.dk
  #   Then I should see translated "agent_home.show.view.header"

  #   #7843
  # @m20 @_requested @_done @_tested @faircalls @_deprecated2014
  # Scenario: My locale should be based on the domain from which I entered
  #   When I visit domain http://faircalls.dk
  #   Then locale should be set to "da"
  #   When I visit domain http://faircalls.eu
  #   Then locale should be set to "en"

  # @m22 @_requested
  # Scenario: I should not see browse deals and browse leads tabs when on agent home page

  #   #8388
  # @m23 @_requested @_done @_tested @faircalls @_deprecated2014
  # Scenario: When I am logged in I should see value created bar over the blurb (bar fro agent work screen)
  #   When I visit domain http://faircalls.dk
  #   Then I should not see translated "agent_work_screen.index.agent_information.value_created"
  #   And I should not see translated "agent_work_screen.index.agent_information.time"
  #   When I sign in as translator_call_centre_agent@nbs.com with password secret
  #   Then I should see translated "agent_work_screen.index.agent_information.value_created"
  #   And I should see translated "agent_work_screen.index.agent_information.time"

  #   #8388
  #   # Use abbreviations if the value including the current values can't stay on one line.
  # @m23 @_requested @_done @_tested @faircalls @_deprecated2014
  # Scenario: I should see additional information in the bar Time: Today (HH/MM)
  #   When I visit domain http://faircalls.dk
  #   And I sign in as translator_call_centre_agent@nbs.com with password secret
  #   Then I should see "Time: Today"

  #   #8388
  #   # Use abbreviations if the value including the current values can't stay on one line.
  # @m23 @_requested @_done @_tested @faircalls  @_deprecated2014
  # Scenario: I should see additional information in the bar Time: This Week (HH/MM)
  #   When I visit domain http://faircalls.dk
  #   And I sign in as translator_call_centre_agent@nbs.com with password secret
  #   Then I should see "This week"

  #   #8388
  #   # Use abbreviations if the value including the current values can't stay on one line.
  # @m23 @_requested @_done @_tested @faircalls @_deprecated2014
  # Scenario: I should see additional information in the bar Time: Last 4 Weeks (HH/MM)
  #   When I visit domain http://faircalls.dk
  #   And I sign in as translator_call_centre_agent@nbs.com with password secret
  #   Then I should see "Last 4 weeks"

  #   #8387
  # @m23 @_requested @tgn @_done @_tested @faircalls @_deprecated2014
  # Scenario: I should see my active "Campaigns" in the left box
  #   When I visit domain http://faircalls.eu
  #   And there are no campaigns
  #   And campaign report data is generated
  #   And additional campaign report data is generated
  #   And I sign in as testreportscca01@nbs.com with password secret
  #   And I should see "TestCampaignReport1"
  #   And I should see "TestCampaignReport2"
  #   And I should see "Pending contacts: 2"
  #   And I should see "Call backs: 1"
  #   And I should see "Completion: 66%"
  #   When I follow "TestCampaignReport1" within "#campaigns"
  #   Then I should see "Agent work screen - TestCampaignReport1"

  #   #8387
  # @m23 @_requested @tgn @_done @_tested_elsewhere @_deprecated2014-blank
  # Scenario: I should see Campaign name, Pending Contacts, Call Backs, Completion for each campaign in the "Campaigns" box

  #   #8387
  # @m23 @_requested @tgn @_done @_tested_elsewhere @_deprecated2014-blank
  # Scenario: When I click a campaign in "Campaigns" box then I should be redirected to agent work screen for that campaign

  #   #8387
  # @m23 @_requested @selenium @tgn @_done @_tested @faircalls @_deprecated2014-blank
  # Scenario: I should see my latest call log "History" in the middle box
  #   Given I am on the homepage
  #   When I visit domain http://faircalls.eu
  #   And there are no campaigns
  #   And campaign report data is generated
  #   And additional campaign report data is generated
  #   And I sign in as testreportscca01@nbs.com with password secret
  #   And I should see "TEST Result"
  #   When I follow "Aaaaa company name"
  #   And I wait 10 second
  #   Then "call_result_result_id" should be selected for value "TEST Result 01"

  #   #8387
  # @m23 @_requested @tgn @_done @_tested_elsewhere @_deprecated2014-blank
  # Scenario: I should see Company name, result, date for each log in "History" box

  #   #8387
  # @m23 @_requested @tgn @_done @_tested_elsewhere @_deprecated2014-blank
  # Scenario: When I click a call log in the "History" box then I should be redirected to agent work screen with that item selected

    #8387
  @m23 @_requested @selenium @tgn @_done @_tested @faircalls
  Scenario: I should see my latest mails and comments in the "Communication" box
    Given I am on the homepage
    When I visit domain http://faircalls.eu
    And there are no campaigns
    And campaign report data is generated
    And additional campaign report data is generated
    And I sign in as testreportscca01@nbs.com with password secret
    And I should see "some.recipient@somewhere.com"
    And I should see translated "models.archived_emails.status.status1"
    When I follow "Additional materials sent"
    And I wait 10 second
    Then I should see "Test body for additional materials"

    # #8387
  # @m23 @_requested @tgn @_done @_tested_elsewhere @_deprecated2014-blank
  # Scenario: I should see email address, date, status (bounce/delivered) in "Communication" box

    # #8387
  # @m23 @_requested @tgn @_done @_tested_elsewhere @_deprecated2014-blank
  # Scenario: When I click on an email then I should be redirected to the agent work screen wth that item selected
