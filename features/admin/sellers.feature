@m5 @sellers @ao
Feature: Sellers

  Background:
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret

  @_done
  Scenario: I can see Sellers list
    When a seller exists
    And I follow translated "layout.main_menu.admin.sellers"
    Then I should see "1" rows in a table within "#sellers"

  @selenium @_done
  Scenario: I can create a new seller
    When I follow translated "layout.main_menu.admin.sellers"
    And I follow translated "administration.sellers.index.view.add_seller"
    And I fill in "seller_name" with "SellerOne"
    And I fill in "seller_first_name" with "Danny"
    And I fill in "seller_last_name" with "DeVito"
    And I fill in "seller_address" with "Holiłoód, Kalifornia"
    And I select "Denmark" from "seller_country_id"
    And I fill in "seller_vat_no" with "666-66-66-66"
    And I press translated "administration.sellers.new.view.button_create"
    And I am on administration sellers page
    Then I should see "1" rows in a table within "#sellers"

  # Address, Name, Email, Bank account, Payment deadline, Default VAT rate (from created), Invoice information -> There should be a custom text in the bottom of invoice page.
  @_done
  Scenario: Seller should contain all information required to generate invoices
    When a seller exists
    And I follow translated "layout.main_menu.admin.sellers"
    And I follow translated "administration.sellers.index.view.show"
    Then I should see translated "administration.sellers.show.view.name"
    And I should see translated "administration.sellers.show.view.first_name"
    And I should see translated "administration.sellers.show.view.last_name"
    And I should see translated "administration.sellers.show.view.address"
    And I should see translated "administration.sellers.show.view.vat_no"
    And I should see translated "administration.sellers.show.view.country"

  @_done
  Scenario: Invoice number should be scoped to Seller
    When a seller exists with attributes "name:SellerOne"
    And a seller exists with attributes "name:SellerTwo"
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
    When a seller exists with attributes "name:SellerOne"
    And a seller exists with attributes "name:SellerTwo"
    And I follow translated "layout.main_menu.admin.sellers"
    And I click hidden link by url regex "/administration\/sellers\/1\/edit/"
    And I check "seller_default"
    And I press translated "administration.sellers.edit.view.button_update"
    And I follow translated "layout.main_menu.admin.sellers"
    Then the "default_1" checkbox should be checked
    When I click hidden link by url regex "/administration\/sellers\/2\/edit/"
    And I check "seller_default"
    And I press translated "administration.sellers.edit.view.button_update"
    And I follow translated "layout.main_menu.admin.sellers"
    Then the "default_1" checkbox should not be checked
    Then the "default_2" checkbox should be checked



