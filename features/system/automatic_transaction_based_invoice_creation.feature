@invoices @$_system @m4 @tgn @noguess
Feature: Automatic transaction based invoice creation

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I have user with email gerard.jones@paerson22.com and role customer
  And user gerard.jones@paerson22.com with role customer exists with attributes "first_name:John,last_name:Kohen"
  And User gerard.jones@paerson22.com with role customer is big buyer
  And I have user with email lead_user.jones@paerson22.com and role lead_user
  And lead Monitors deal exists within category Computers
  And lead Printers deal exists within category Computers
  And lead Monitors deal exists with attributes "price:321.23"
  And lead Monitors deal is bought by user gerard.jones@paerson22.com with role customer and is assigned to user lead_user.jones@paerson22.com with role lead_user
  And lead Printers deal is bought by user gerard.jones@paerson22.com with role customer and is assigned to user lead_user.jones@paerson22.com with role lead_user
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And there is a seller with attributes "company_name:DannyTheSeller,name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"

@_done @tested_elsewhere
Scenario: Create an invoice if a new paypal transaction (payment for cart content has been confirmed) is created in the system

@_done
Scenario: Invoice lines for manually created invoice should be automatically generated
  When I go to administration invoices
  And I select "John Kohen" from "invoice_user_id"
  And I select "DannyTheSeller" from "invoice_seller_id"
  And I press translated "administration.invoices.index.view.create_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain "Monitors deal"
  And the "invoice_invoice_lines_attributes_1_name" field should contain "Printers deal"