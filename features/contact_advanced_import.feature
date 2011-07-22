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

  @_done @_tested @selenium
  Scenario: I can import contact from spreadsheet (ods, xls, xlsx) with advanced import
    #wrong imports
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_advanced_import_form"
    And I should see translated "callers.advanced_import.choose.flash.error_wrong_file"
    And attach the file "wcai spreadsheet" to "attachment" within "#contact_advanced_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_advanced_import_form"
    And I should see translated "callers.advanced_import.choose.flash.error_wrong_title"
    And attach the file "sample image" to "attachment" within "#contact_advanced_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_advanced_import_form"
    And I should see translated "callers.advanced_import.choose.flash.error_wrong_file"
    #first correct import
    And attach the file "contact advanced import spreadsheet" to "attachment" within "#contact_advanced_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_advanced_import_form"
    And I should see translated "callers.advanced_import.choose.view.contact_fields_label"
    And I follow translated "callers.advanced_import.choose.view.cancel_button"
    And attach the file "contact advanced import spreadsheet" to "attachment" within "#contact_advanced_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_advanced_import_form"
    And I should see "Company name *"
    And I press translated "callers.advanced_import.choose.view.next_button"
    And I should see "1/4"
    And I follow translated "callers.advanced_import.preview.view.cancel_button"
    And I press translated "callers.advanced_import.choose.view.next_button"
    And I follow translated "callers.advanced_import.preview.view.next_contact_button"
    And I should see "2/4"
    And I follow translated "callers.advanced_import.preview.view.last_contact_button"
    And I should see "4/4"
    And I press translated "callers.advanced_import.preview.view.import_button"
    And I should see translated "callers.advanced_import.create.flash.success" with options "counter:2 / 4"
    And I should see translated "campaigns.edit.button_remove_last_import"
    And campaign "Testing Two" should have "2" contacts
    #second correct import
    And I follow translated "campaigns.edit.button_import_contacts"
    And attach the file "contact advanced import spreadsheet" to "attachment" within "#contact_advanced_import_form"
    And I press translated "contacts.new.advanced_import_from_excel_button" within "#contact_advanced_import_form"
    And I press translated "callers.advanced_import.choose.view.next_button"
    And I press translated "callers.advanced_import.preview.view.import_button"
    And I should see translated "callers.advanced_import.create.flash.success" with options "counter:2 / 4"
    And campaign "Testing Two" should have "4" contacts
    #remoce last import
    And I confirm a js popup on the next step
    And I follow translated "campaigns.edit.button_remove_last_import"
    And I should see translated "callers.advanced_import.destroy.flash.success"
    And I should not see translated "campaigns.edit.button_remove_last_import"
    And campaign "Testing Two" should have "2" contacts