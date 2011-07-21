@advanced_import @m17 @is @$_call_centre
Feature: Lead Advanced Import
  Background:
    Given I am on the homepage
     And I sign in as translator_call_centre@nbs.com with password secret
     And I follow translated "layout.main_menu.call_centre.campaigns"

  @wip @selenium
  Scenario: I can import contact from spreadsheet (ods, xls, xlsx) with advanced import
    Then I follow translated "campaigns.table.name"
    When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"