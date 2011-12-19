@m25 @is @callers_history
Feature: Callers history

  #8820
  @_done @_tested @requested
  Scenario: I can see full list of History items when I click "Complete list" on faircalls home page
    Given I visit domain http://faircalls.eu
    And campaign report data is generated
    And additional campaign report data is generated
    And I sign in as testreportscc@nbs.com with password secret
    Then I follow translated "agent_home.show.view.complete_list_link" within "#history"
    Then I follow "Back"
    Then I follow translated "agent_home.show.view.complete_list_link" within "#history"
    Then I should see "Aaaaa company name"
    Then I should see "TEST Result 01"
    Given I follow translated logout link for testreportscc@nbs.com
    And I sign in as testreportscca01@nbs.com with password secret
    Then I follow translated "agent_home.show.view.complete_list_link" within "#history"
    Then I follow "Back"
    Then I follow translated "agent_home.show.view.complete_list_link" within "#history"
    Then I should see "Aaaaa company name"
    Then I should see "TEST Result 01"
    Given I follow translated logout link for testreportscca01@nbs.com