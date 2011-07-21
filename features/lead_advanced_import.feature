@m17 @is
Feature: Lead Advanced Import

  Background:
    Given I am on the homepage
    Given template named "Business template" for category "Business" is created by user "translator_call_centre@nbs.com" with role "call_centre"
    Given template named "Business template" has following fields "field #1:false:true:0,field #2:false:false:1,field #3:false:false:2,field #4:false:false:3"
    And there are no leads

  @selenium @_done @tested
  Scenario: Admin can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as admin@nbs.com with password secret
    And I follow translated "layout.main_menu.admin.leads"
    And I follow "Import"
    And I should see "John Smith" within "#lead_advanced_import_form"
    And I select "John Smith" from "creator_id"
    And lead advanced import all correct

  @selenium @_done @tested
  Scenario: Agent can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as agent@nbs.com with password secret
    And I follow translated "layout.main_menu.agent.leads"
    And I follow "Import"
    And I should not see "John Smith" within "#lead_advanced_import_form"
    And lead advanced import all correct

  @selenium @_done @tested
  Scenario: Call center agent can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre_agent.leads"
    And I follow "Import"
    And I should not see "John Smith" within "#lead_advanced_import_form"
    And lead advanced import all correct

  @selenium @_done @tested
  Scenario: Call center can import leads from spreadsheet (ods, xls, xlsx) with advanced import
    And I sign in as translator_call_centre@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.leads"
    And I follow "Import"
    And I should not see "John Smith" within "#lead_advanced_import_form"
    And lead advanced import all correct

  @wip @added @_done @tested
  Scenario: I can cancel choosing fields
    And I sign in as admin@nbs.com with password secret
    And I follow translated "layout.main_menu.admin.leads"
    And lead advanced import wrong files, fields and cancel button
    Then I go to the logout page
    And I sign in as agent@nbs.com with password secret
    And I follow translated "layout.main_menu.agent.leads"
    And lead advanced import wrong files, fields and cancel button
    Then I go to the logout page
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre_agent.leads"
    And lead advanced import wrong files, fields and cancel button
    Then I go to the logout page
    And I sign in as translator_call_centre@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.leads"
    And lead advanced import wrong files, fields and cancel button