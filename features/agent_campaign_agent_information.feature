# The values should be calculated on all activities (all campaigns)
@m15 @$_call_centre_agent @agent_information @requested @ao @nontestable @$_remove
Feature: Agent information
  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And there are no campaigns
    And campaign report data is generated
    And I visit domain http://faircalls.eu
    And I sign in as testreportscca01@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre_agent.campaigns"

  @_done @_tested @selenium
  Scenario: I can see my created value Today
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/agent_work_screen/"
    And I wait 5 second
    And I should see "created today: €130 (€130)"
    And I should see "this week: €130 (€130)"
    And I should see "this quarter: €"
    And I should see "this year: €"

  @_done @tested_elsewhere
  Scenario: I can see my created value this week

  @_done @tested_elsewhere
  Scenario: I can see my created value this quarter

  @_done @tested_elsewhere
  Scenario: I can see my created value this year

  @_done @_tested @selenium
  Scenario: I can see Top agent name for Today
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/agent_work_screen/"
    And I wait 5 second
    And I should see "created today: €130 (€130)"
    And I should see "this week: €130 (€130)"
    And I should see "this quarter: €"
    And I should see "this year: €"

  @_done @tested_elsewhere
  Scenario: I can see Top agent name for this week

  @_done @tested_elsewhere
  Scenario: I can see Top agent name for this quarter

  @_done @tested_elsewhere
  Scenario: I can see Top agent name for this year