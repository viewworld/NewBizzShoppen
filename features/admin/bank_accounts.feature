@bank_accounts
Feature: Bank Accounts

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role supplier with attributes "first_name:Janko,last_name:Muzykant"
    Then I sign in as jon@lajoie.ca with password secret

  @added @m4b @_done
  Scenario: I can see a list of bank accounts in settings tab
    Given I follow translated "layout.main_menu.admin.global"
    Then I should see "2" rows in a table with headers within "#bank_accounts"

  @added @m4b @_done
  Scenario: I can add many bank accounts to one country
    Given there is a bank account for country "Denmark"
    And there is a bank account for country "Denmark"
    And I follow translated "layout.main_menu.admin.global"
    Then I should see "4" rows in a table with headers within "#bank_accounts"

  # @added @m4b @_done @_deprecated2014
  # Scenario: Only one bank account for each country can be a default bank account
  #   Given there is a bank account for country "Denmark"
  #   And I follow translated "layout.main_menu.admin.global"
  #   And I follow translated "administration.bank_accounts.index.view.id"
  #   Then checkbox with name like "country_default" should be checked in the "1" row of table "#bank_accounts"
  #   When there is a bank account for country "Denmark" with attributes "country_default:1"
  #   And I follow translated "layout.main_menu.admin.global"
  #   And I follow translated "administration.bank_accounts.index.view.id"
  #   Then checkbox with name like "country_default" should be checked in the "3" row of table "#bank_accounts"
  #   And checkbox with name like "country_default" should not be checked in the "1" row of table "#bank_accounts"
  #   And checkbox with name like "country_default" should not be checked in the "2" row of table "#bank_accounts"

  # @added @m4b @_done @_deprecated2014
  # Scenario: Different countries should have different country default bank accounts
  #   Given there is a bank account for country "United Kingdom" with attributes "country_default:1"
  #   And I follow translated "layout.main_menu.admin.global"
  #   And I follow translated "administration.bank_accounts.index.view.id"
  #   Then checkbox with name like "country_default" should be checked in the "1" row of table "#bank_accounts"
  #   And checkbox with name like "country_default" should be checked in the "2" row of table "#bank_accounts"

  # @added @m4b @_done @_deprecated2014
  # Scenario: Only one bank account can be a global default
  #   Given there is a bank account for country "Denmark" with attributes "global_default:1"
  #   And there is a bank account for country "United Kingdom" with attributes "global_default:1"
  #   And I follow translated "layout.main_menu.admin.global"
  #   And I follow translated "administration.bank_accounts.index.view.id"
  #   Then checkbox with name like "global_default" should be checked in the "3" row of table "#bank_accounts"
  #   And checkbox with name like "global_default" should not be checked in the "2" row of table "#bank_accounts"
  #   And checkbox with name like "global_default" should not be checked in the "1" row of table "#bank_accounts"

  # @added @m4b @_done @_deprecated2014
  # Scenario: Default bank for user's country should be used if available
  #   Given there is a bank account for country "United Kingdom" with attributes "country_default:1"
  #   And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:John,last_name:Rambo,country:2"
  #   And invoice exists for user "kastomer2@nbs.fake" with role "supplier"
  #   And I follow translated "layout.main_menu.admin.invoices"
  #   And I follow translated "administration.invoices.index.view.edit_invoice"
  #   Then "invoice_bank_account_id" should be selected for value "United Kingdom"

  # @added @m4b @_done @_deprecated2014
  # Scenario: Default bank for user's country should be used when there are more than one
  #   Given there is a bank account for country "United Kingdom" with attributes "bank_name:First"
  #   Given there is a bank account for country "United Kingdom" with attributes "country_default:1,bank_name:Second"
  #   Given there is a bank account for country "United Kingdom" with attributes "bank_name:Third"
  #   And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:John,last_name:Rambo,country:2"
  #   And invoice exists for user "kastomer2@nbs.fake" with role "supplier"
  #   And I follow translated "layout.main_menu.admin.invoices"
  #   And I follow translated "administration.invoices.index.view.edit_invoice"
  #   Then "invoice_bank_account_id" should be selected for value "United Kingdom"
  #   And "invoice_bank_account_id" should be selected for value "Second"

  # @added @m4b @_done @_deprecated2014
  # Scenario: Global default should be used when there's no country default for user's country
  #   Given there is a bank account for country "United Kingdom" with attributes "bank_name:First"
  #   And there is a bank account for country "Denmark" with attributes "global_default:1,bank_name:GlobalDefault"
  #   And there is a bank account for country "Denmark" with attributes "country_default:1,bank_name:CountryDefault"
  #   And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:John,last_name:Rambo,country:2"
  #   And invoice exists for user "kastomer2@nbs.fake" with role "supplier"
  #   And I follow translated "layout.main_menu.admin.invoices"
  #   And I follow translated "administration.invoices.index.view.edit_invoice"
  #   Then "invoice_bank_account_id" should be selected for value "Denmark"
  #   And "invoice_bank_account_id" should be selected for value "GlobalDefault"

  # @added @m4b @_done @_deprecated2014
  # Scenario: I should see bank details on invoice
  #   Given there is a bank account for country "United Kingdom" with attributes "country_default:1,bank_name:First UK Bank,iban_no:UK123123123,swift:UKBNK"
  #   And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:John,last_name:Rambo,country:2"
  #   And invoice exists for user "kastomer2@nbs.fake" with role "supplier"
  #   And I follow translated "layout.main_menu.admin.invoices"
  #   And I follow translated "administration.invoices.index.view.show_invoice"
  #   Then I should see "First UK Bank"
  #   And I should see "UK123123123"
  #   And I should see "UKBNK"

  # @added @m4b @_done @_deprecated2014
  # Scenario: I can change user's default bank
  #   Given there is a bank account for country "United Kingdom" with attributes "bank_name:First,country_default:1"
  #   And there is a bank account for country "Denmark" with attributes "global_default:1,bank_name:GlobalDefault"
  #   And there is a bank account for country "Denmark" with attributes "country_default:1,bank_name:CountryDefault"
  #   And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:John,last_name:Rambo,country:2"
  #   And I am on administration edit user kastomer2@nbs.fake
  #   Then "user_supplier_bank_account_id" should be selected for value "United Kingdom"
  #   When I select "Denmark / CountryDefault" from "user_supplier_bank_account_id"
  #   And I press translated "administration.users.edit.view.button_update_user"
  #   And invoice exists for user "kastomer2@nbs.fake" with role "supplier"
  #   And I follow translated "layout.main_menu.admin.invoices"
  #   And I follow translated "administration.invoices.index.view.edit_invoice"
  #   Then "invoice_bank_account_id" should be selected for value "Denmark"
  #   And "invoice_bank_account_id" should be selected for value "CountryDefault"

  # @selenium @added @m4b @_done @_deprecated2014
  # Scenario: I can change invoice's bank account
  #   Given there is a bank account for country "United Kingdom" with attributes "country_default:1,bank_name:First UK Bank,iban_no:UK123123123,swift:UKBNK"
  #   And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:John,last_name:Rambo,country:2"
  #   And invoice exists for user "kastomer2@nbs.fake" with role "supplier"
  #   And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  #   And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d{1,}/"
  #   Then I should see "First UK Bank"
  #   When I follow translated "administration.invoices.index.view.edit_invoice"
  #   And I select "Denmark / Default Bank" from "invoice_bank_account_id"
  #   And I follow translated "administration.invoices.edit.view.remove_line"
  #   And I wait 1 second
  #   And I press translated "administration.invoices.edit.view.save_button"
  #   And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  #   And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d{1,}/"
  #   Then I should see "Default Bank"
