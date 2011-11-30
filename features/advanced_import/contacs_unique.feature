#8059
@advanced_import @uniq_import @m23 @is @requested
Feature: Contacts Advanced Import Unique

  Background:
    Given I am on the homepage
    And campaign "Testing Two" should have "0" contacts

  @added @selenium @_done @_tested
  Scenario: Admin can import contacts from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as admin@nbs.com with password secret
    Then I use advanced import for contacts unique

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center can import contacts from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I use advanced import for contacts unique
    And user "translator_call_centre@nbs.com" has not contacts assigned in campaign "Testing Two"

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center agent can contacts buyers from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    And user "translator_call_centre_agent@nbs.com" has not contacts assigned in campaign "Testing Two"
    And I add user "translator_call_centre_agent@nbs.com" to campaign "Testing Two"
    Then I use advanced import for contacts unique
    And user "translator_call_centre_agent@nbs.com" has contacts assigned in campaign "Testing Two"

  @added @selenium @_done @_tested @faircalls
  Scenario: Agent can import contacts from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    And I sign in as agent@nbs.com with password secret
    And user "agent@nbs.com" has not contacts assigned in campaign "Testing Two"
    And I add user "agent@nbs.com" to campaign "Testing Two"
    Then I use advanced import for contacts unique
    And user "agent@nbs.com" has contacts assigned in campaign "Testing Two"

  @_done @_tested_elsewhere
  Scenario: I can check 'only unique' checkbox in contact advanced import form

  @_done @_tested_elsewhere
  Scenario: If 'only unique' is checked then if company name, company CVR and contact email are validated

  @_done @_tested_elsewhere
  Scenario: Contact is not imported if only unique is checked and validation fails

  @_done @_tested_elsewhere
  Scenario: If contact is not imported then message about it is displayed