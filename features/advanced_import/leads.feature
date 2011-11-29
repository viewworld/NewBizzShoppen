@m19 @advanced_import
Feature: Leads specific advanced import

    Background:
    Given I am on the homepage
    Given template named "Business template" for category "Business" is created by user "translator_call_centre@nbs.com" with role "call_centre"
    Given template named "Business template" has following fields "field #1:false:true:0,field #2:false:false:1,field #3:false:false:2,field #4:false:false:3"
    And there are no leads

  @added @selenium @_done @_tested
  Scenario: Admin can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as admin@nbs.com with password secret
    Then I use advanced import for leads as "admin"
    And lead "yessss" should be created by user "translator_call_centre_agent@nbs.com"
    And lead "nooooo" should be created by user "translator_call_centre_agent@nbs.com"

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I use advanced import for leads as "user"
    And lead "yessss" should be created by user "translator_call_centre@nbs.com"
    And lead "nooooo" should be created by user "translator_call_centre@nbs.com"

  @added @selenium @_done @_tested @faircalls
  Scenario: Call center agent can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I use advanced import for leads as "user"
    And lead "yessss" should be created by user "translator_call_centre_agent@nbs.com"
    And lead "nooooo" should be created by user "translator_call_centre_agent@nbs.com"

  @added @selenium @_done @_tested @faircalls
  Scenario: Agent can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    Given I visit domain http://faircalls.eu
    And I sign in as agent@nbs.com with password secret
    Then I use advanced import for leads as "user"
    And lead "yessss" should be created by user "agent@nbs.com"
    And lead "nooooo" should be created by user "agent@nbs.com"

  @_done @_tested_elsewhere
  Scenario: Admin can specify the user agent who will be put as the creator of imported leads

  @_done @_tested_elsewhere
  Scenario: I can see template fields in choose screen

  @_done @_tested_elsewhere
  Scenario: I can see template fields in preview screen

  @_deprecated
  Scenario: Lead category is taken from the file

  @_deprecated
  Scenario: When category is wrong or not exist then lead goes to trash category

  @_deprecated
  Scenario: Garbage category exist in the system