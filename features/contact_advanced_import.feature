@advanced_import @m17 @is @$_call_centre @faircalls
Feature: Lead Advanced Import

  Background:
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    And I click hidden link by url regex "/\/callers\/campaigns$/"
    Given I select "all" from "search_with_state"
    Then I press translated "campaigns.filter.search_button"
    And I follow translated "campaigns.table.name"
    And I follow translated "campaigns.table.name"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
    And I follow translated "campaigns.edit.button_import_contacts"
    And campaign "Testing Two" should have "0" contacts

  @_done @_tested
  Scenario: I can import contact from spreadsheet (ods, xls, xlsx) with regular import
    And I press translated "contacts.new.import_from_excel_button" within "#contact_import_form"
    And I should see translated "contacts.import_xls.flash.unknown_format"
    And attach the file "sample image" to "attachment" within "#contact_import_form"
    And I press translated "contacts.new.import_from_excel_button" within "#contact_import_form"
    And I should see translated "contacts.import_xls.flash.unknown_format"
    And attach the file "contact3allgood_adv_import" to "attachment" within "#contact_import_form"
    And I press translated "contacts.new.import_from_excel_button" within "#contact_import_form"
    And campaign "Testing Two" should have "2" contacts
    And I should see "Bon Jovi inc."
    And I should see "Mleko company"
    And I should not see "888 422 633"
    And I follow translated "campaigns.edit.button_import_contacts"
    And attach the file "contact3allgood_adv_import" to "attachment" within "#contact_import_form"
    And I check "unique_only"
    And I press translated "contacts.new.import_from_excel_button" within "#contact_import_form"
    And campaign "Testing Two" should have "2" contacts
    And I follow translated "campaigns.edit.button_import_contacts"
    And attach the file "contact3allgood_adv_import" to "attachment" within "#contact_import_form"
    And I press translated "contacts.new.import_from_excel_button" within "#contact_import_form"
    And campaign "Testing Two" should have "4" contacts