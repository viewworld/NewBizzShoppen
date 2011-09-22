@advanced_import @m17 @is @$_call_centre
Feature: Lead Advanced Import

  Background:
    Given I am on the homepage
    And I sign in as translator_call_centre@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.campaigns"
    And I follow translated "campaigns.table.name"
    And I follow translated "campaigns.table.name"
    And I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
    And I should not see translated "campaigns.edit.button_remove_last_import"
    And I follow translated "campaigns.edit.button_import_contacts"
    And campaign "Testing Two" should have "0" contacts

  @_done @_tested
  Scenario: I can import contact from spreadsheet (ods, xls, xlsx) with regular import
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_import_form"
    And I should see translated "contacts.import_xls.flash.unknown_format"
    And attach the file "sample image" to "attachment" within "#contact_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_import_form"
    And I should see translated "contacts.import_xls.flash.unknown_format"
    And attach the file "contact advanced import spreadsheet" to "attachment" within "#contact_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_import_form"
    And campaign "Testing Two" should have "2" contacts
    And I should see "Bon Jovi inc."
    And I should see "Mleko company"
    And I should not see "888 422 633"

  @_done @_tested_elsewhere
  Scenario: I can import contact from spreadsheet (ods, xls, xlsx) with advanced import

