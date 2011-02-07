@invoices @$_customer @m5 @noguess @ao
Feature: Invoices administration as customer

  Background:
    Given I am on the homepage
    And I make sure current locale is English
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
    Then I sign in as jon@lajoie.ca with password secret
    When invoice exists for user "jon@lajoie.ca"
    And invoice line for first invoice exists for user "jon@lajoie.ca" with attributes "netto_price:100,quantity:1,vat_rate:23,netto_value:100,brutto_value:123"
    And I follow translated "layout.main_menu.customer.invoices"

  @_done
  Scenario: I can see a list of my invoices
    Then I should see "2" rows in a table within "#invoices"

  @_done
  Scenario: I can see number of my invoice
    Then I should see translated "customer.invoices.index.view.invoice_number"
    And I should see /\d.\d{4}/ within "#invoices"

  @_done
  Scenario: I can see payment status of my invoice
    Then I should see translated "customer.invoices.index.view.status"
    And I should see "New" within "#invoices"

  @_done
  Scenario: I can see total value of my invoice
    Then I should see translated "customer.invoices.index.view.total"
    And I should see /\d{1,}\.\d{2}/

  @_done
  Scenario: I can see invoice details
    When I follow translated "customer.invoices.index.view.show_invoice"
    Then I should see translated "customer.invoices.show.view.from"
    And I should see translated "customer.invoices.show.view.total"
    And I should see translated "customer.invoices.show.view.payment_method"
    And I should see translated "customer.invoices.show.view.status"

  @_done
  Scenario: I can download invoice as PDF file
    When I follow translated "customer.invoices.index.view.show_invoice"
    And I follow translated PDF link "customer.invoices.show.view.download_pdf"
    Then I should see translated "customer.invoices.show.view.from"
    And I should see translated "customer.invoices.show.view.total"
    And I should see translated "customer.invoices.show.view.payment_method"
