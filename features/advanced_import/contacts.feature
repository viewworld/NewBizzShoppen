@m19 @advanced_import
Feature: Contacts specific advanced import

  Background:
    Given I am on the homepage
    And campaign "Testing Two" should have "0" contacts

  @added @selenium
  Scenario: Admin can import contacts from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as admin@nbs.com with password secret
    Then I use advanced import for contacts

  @added @selenium
  Scenario: Call center can import contacts from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I use advanced import for contacts

  @added @selenium
  Scenario: Call center agent can contacts buyers from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    And I add user "translator_call_centre_agent@nbs.com" to campaign "Testing Two"
    Then I use advanced import for contacts

  @added @selenium
  Scenario: Agent can import contacts from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as agent@nbs.com with password secret
    And I add user "agent@nbs.com" to campaign "Testing Two"
    Then I use advanced import for contacts

  @_done @_tested_elsewhere
  Scenario: I can choose campaign where contacts should be imported (with select)