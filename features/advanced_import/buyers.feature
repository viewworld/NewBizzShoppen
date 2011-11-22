@m19 @advanced_import
Feature: Buyers advanced import (buyer specific)

  Background:
    Given I am on the homepage

  @added @selenium @_done @_tested
  Scenario: Admin can import buyers from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as admin@nbs.com with password secret
    Then I use advanced import for users "suppliers"

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center can import buyers from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    Given user "translator_call_centre@nbs.com" has deal maker role enabled
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I use advanced import for users "suppliers"

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center agent can import buyers from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    Given user "translator_call_centre_agent@nbs.com" has deal maker role enabled
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I use advanced import for users "suppliers"

  @added @selenium @_done @_tested @faircalls
  Scenario: Agent can import buyers from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    Given user "agent@nbs.com" has deal maker role enabled
    And I sign in as agent@nbs.com with password secret
    Then I use advanced import for users "suppliers"