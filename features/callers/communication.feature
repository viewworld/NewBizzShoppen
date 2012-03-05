@m25 @is @callers_communication
Feature: Callers communication

  #8820
  @_done @_tested @_requested
  Scenario: I can see full list of Communication items when I click "Complete list" on faircalls home page
    Given I visit domain http://faircalls.eu
    And campaign report data is generated
    And additional campaign report data is generated
    And I sign in as testreportscc@nbs.com with password secret
    Then I follow translated "agent_home.show.view.complete_list_link" within "#communication"
    Then I follow "Back"
    Then I follow translated "agent_home.show.view.complete_list_link" within "#communication"
    Then I should see "Additional materials sent"
    Given I follow translated logout link for testreportscc@nbs.com
    And I sign in as testreportscca01@nbs.com with password secret
    Then I follow translated "agent_home.show.view.complete_list_link" within "#communication"
    Then I follow "Back"
    Then I follow translated "agent_home.show.view.complete_list_link" within "#communication"
    Then I should see "Additional materials sent"
    Given I follow translated logout link for testreportscca01@nbs.com
