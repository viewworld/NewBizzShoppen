#8060
@m23 @campaign_crm @$_administrator @$_call_centre @$_call_centre_agent @$_agent @_requested @is
Feature: Agent campaign crm

  Background:
    Given I am on the homepage
  
  @added @selenium @_done @_tested
  Scenario: Admin can enable crm while create are edit campaign
    And I sign in as admin@nbs.com with password secret
    And I click hidden link by url regex "/\/callers\/campaigns$/"
    Then I can enable crm while create are edit campaign

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center can enable crm while create are edit campaign
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
  And I click hidden link by url regex "/\/callers\/campaigns$/"
    Then I can enable crm while create are edit campaign

  @_done @_tested_elsewhere
  Scenario: When I set up a campaign I can enable a CRM

  @_done @_tested_elsewhere
  Scenario: I can select that related call results are filtered by company name (radio button)

  @_done @_tested_elsewhere
  Scenario: I can select that related call results are filtered by vat number (radio button)

  @_done @_tested_elsewhere
  Scenario: I can select that related call results are filtered by contact email (radio button)

  @_done @_tested_elsewhere
  Scenario: I can select that related call results are filtered by all must match (radio button)

  @_done @_tested_elsewhere
  Scenario: I can assign campaigns that I have access to for CRM scope

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center can see crm on work screen
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    And I can see call results from other campaign

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center agent can see crm on work screen
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    And I can see call results from other campaign

  @added @selenium @_done @_tested @faircalls
  Scenario: Agent can see crm on work screen
    Given I visit domain http://faircalls.eu
    And I sign in as agent@nbs.com with password secret
    And I prepare date for crm work screen call results test for agent
    And I can see call results from other campaign

  @_done @_tested_elsewhere
  Scenario: As an agent I should see call result history for campaigns that I do not have access to (but my call centre does)

  @_done @_tested_elsewhere
  Scenario: As an agent I should not see call result history for which my call centre does not have access to

  @_done @_tested_elsewhere
  Scenario: CRM history should be presented in Call log for given contact

  @_done @_tested_elsewhere
  Scenario: CRM history rows should be shown with additional info about contact name and campaign name