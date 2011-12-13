@invoices @$_system @m4 @tgn @noguess
Feature: Automatic transaction based invoice creation

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I have user with email gerard.jones@paerson22.com and role supplier
  And user gerard.jones@paerson22.com with role supplier exists with attributes "first_name:John,last_name:Kohen,company_name:Xerox"
  And User gerard.jones@paerson22.com with role supplier is big buyer
  And an user with role lead_user and email lead_user.jones@paerson22.com exists as subaccount for customer gerard.jones@paerson22.com
  And lead Monitors deal exists within category Computers
  And lead Printers deal exists within category Computers
  And lead Monitors deal exists with attributes "price:321.23,currency_id:1"
  And lead Printers deal exists with attributes "currency_id:1"
  And lead Monitors deal is bought by user gerard.jones@paerson22.com with role supplier and is assigned to user lead_user.jones@paerson22.com with role lead_user
  And lead Printers deal is bought by user gerard.jones@paerson22.com with role supplier and is assigned to user lead_user.jones@paerson22.com with role lead_user
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"

@_done @_tested_elsewhere
Scenario: Create an invoice if a new paypal transaction (payment for cart content has been confirmed) is created in the system

@_done
Scenario: Invoice lines for manually created invoice should be automatically generated
  Given lead Monitors deal exists with currency "DKK"
  And lead Printers deal exists with currency "DKK"
  When I go to administration invoices
  And I select "Xerox, gerard.jones@paerson22.com" from "invoice_user_id"
  And I select "DannyTheSeller" from "invoice_seller_id"
  And I press translated "administration.invoices.index.view.create_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain "Monitors deal"
  And the "invoice_invoice_lines_attributes_1_name" field should contain "Printers deal"

@added @m5 @ao @_done @_tested
Scenario: Invoice should be created per currency
  When lead Keyboards deal exists within category Computers
  And lead Keyboards deal exists with attributes "price:868.68,currency_id:2"
  And lead Keyboards deal is bought by user gerard.jones@paerson22.com with role supplier and is assigned to user lead_user.jones@paerson22.com with role lead_user
  When I go to administration upcoming invoices
  Then I should see "4" rows in a table with headers within "table.generic"
  When I follow translated "administration.upcoming_invoices.index.view.create_invoice" within "tbody#invoices_list tr:nth-of-type(1)"
  Then "invoice_currency_id" should be selected for "1"
  And the "invoice_invoice_lines_attributes_0_name" field should contain "Monitors deal"
  And the "invoice_invoice_lines_attributes_1_name" field should contain "Printers deal"
  When I go to administration upcoming invoices
  Then I should see "3" rows in a table with headers within "table.generic"
  When I follow translated "administration.upcoming_invoices.index.view.create_invoice" within "tbody#invoices_list tr:nth-of-type(1)"
  Then "invoice_currency_id" should be selected for "2"
  And the "invoice_invoice_lines_attributes_0_name" field should contain "Keyboards deal"
