@m5 @sellers @ao
Feature: Sellers

  Background:
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret

  @_done
  Scenario: I can see Sellers list
    When I follow translated "layout.main_menu.admin.sellers"
    Then I should see "1" rows in a table with headers within "#sellers"

  # there is always one default seller from seed
  @selenium @_done
  Scenario: I can create a new seller
    When I click hidden link by url regex "/administration\/sellers/"
    And I follow translated "administration.sellers.index.view.add_seller"
    And I fill in "seller_company_name" with "SellerOne"
    And I fill in "seller_first_name" with "Danny"
    And I fill in "seller_last_name" with "DeVito"
    And I fill in "seller_address_attributes_address_line_1" with "Szwarcenegera 1"
    And I fill in "seller_address_attributes_address_line_2" with "Holiłód"
    And I fill in "seller_address_attributes_address_line_3" with "Kalifornia"
    And I fill in "seller_address_attributes_zip_code" with "01-123"
    And I select "Denmark" from "seller_address_attributes_country_id"
    And I fill in "seller_vat_no" with "666-66-66-66"
    And I press translated "administration.sellers.new.view.button_create"
    And I am on administration sellers page
    Then I should see "2" rows in a table with headers within "#sellers"

  # Address, Name, Email, Bank account, Payment deadline, Default VAT rate (from created), Invoice information -> There should be a custom text in the bottom of invoice page.
  @_done
  Scenario: Seller should contain all information required to generate invoices
    When I follow translated "layout.main_menu.admin.sellers"
    And I follow translated "administration.sellers.index.view.show"
    Then I should see translated "administration.sellers.show.view.first_name"
    And I should see translated "administration.sellers.show.view.last_name"
    And I should see translated "administration.sellers.show.view.address_line_1"
    And I should see translated "administration.sellers.show.view.address_line_2"
    And I should see translated "administration.sellers.show.view.address_line_3"
    And I should see translated "administration.sellers.show.view.zip_code"
    And I should see translated "administration.sellers.show.view.vat_no"
    And I should see translated "administration.sellers.show.view.country"

  @_done
  Scenario: Invoice number should be scoped to Seller
    When there is a seller with attributes "company_name:SellerOne"
    And there is a seller with attributes "company_name:SellerTwo"
    And I follow translated "layout.main_menu.admin.invoices"
    And I select "SellerOne" from "invoice_seller_id"
    And I press translated "administration.invoices.index.view.create_invoice"
    And I follow translated "layout.main_menu.admin.invoices"
    And I select "SellerTwo" from "invoice_seller_id"
    And I press translated "administration.invoices.index.view.create_invoice"
    And I follow translated "layout.main_menu.admin.invoices"
    Then I should see "1/201" in the "1" row of table "#invoices tbody"
    And I should see "1/201" in the "2" row of table "#invoices tbody"

  @selenium @_done
  Scenario: One seller can be selected as default
    When there is a seller with attributes "company_name:SellerOne"
    And there is a seller with attributes "company_name:SellerTwo"
    And I click hidden link by url regex "/administration\/sellers/"
    And I am on administration seller SellerOne edit page
    And I check "seller_default"
    And I press translated "administration.sellers.edit.view.button_update"
    Then the "default" checkbox should be checked
    And I am on administration seller SellerTwo edit page
    And I check "seller_default"
    And I press translated "administration.sellers.edit.view.button_update"
    Then the "default" checkbox should be checked
    When I am on administration SellerOne seller page
    Then the "default" checkbox should not be checked

  @added @selenium @_done @_tested
  Scenario: I can specify company name when creating new seller
    When I click hidden link by url regex "/administration\/sellers/"
    And I follow translated "administration.sellers.index.view.add_seller"
    Then I should see CSS path "#seller_company_name"

  @added @selenium @_done @_tested
  Scenario: Sellers should have invoice note information
    When I click hidden link by url regex "/administration\/sellers/"
    And I follow translated "administration.sellers.index.view.add_seller"
    Then I should see CSS path "#seller_note_input"

  @m6 @selenium @_done @_tested
  Scenario: I should be able to select bank account for each seller (by default the default bank account for new sellers)
    When I click hidden link by url regex "/administration\/sellers/"
    And I follow translated "administration.sellers.index.view.add_seller"
    Then I should see CSS path "#seller_bank_account_id"

  @added @m6 @selenium @_done @_tested
  Scenario: Global default bank should be selected for new seller
    When there is a bank account for country "United Kingdom"
    And bank account for country "Denmark" has attributes "global_default:1"
    And I click hidden link by url regex "/administration\/sellers/"
    And I follow translated "administration.sellers.index.view.add_seller"
    Then "seller_bank_account_id" should be selected for "1"
    When bank account for country "United Kingdom" has attributes "global_default:1"
    And I click hidden link by url regex "/administration\/sellers$/"
    And I follow translated "administration.sellers.index.view.add_seller"
    And I open page in browser
    Then "seller_bank_account_id" should be selected for "1"
