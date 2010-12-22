@invoices @$_admin @m4 @ao @noguess
Feature: Invoices administration

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "first_name:Janko,last_name:Muzykant"
  Then I sign in as jon@lajoie.ca with password secret

@tbd
Scenario: I can create new invoice for user
  When I follow translated "layout.main_menu.admin.invoices"
  And I select "Janko Muzykant" from "invoice_user_id"
  And I press translated "administration.invoices.index.view.create_invoice"
  Then I should see "was successfully created"

@_todo
Scenario: I can see list of invoices pending creation

@_todo
Scenario: I can create new invoice from suggestion on invoices pending creation listing

@tbd
Scenario: I can see invoice details
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see translated "administration.invoices.show.view.header"

@tbd
Scenario: I can edit invoice’s customer information - name, address, vat no
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_customer_name" with "NewCustomerName"
  And I fill in "invoice_customer_address" with "NewAddress"
  And I fill in "invoice_customer_vat_no" with "NewVatNo"
  And I fill in "invoice_invoice_lines_attributes_0_name" with "Lead"
  And I fill in "invoice_invoice_lines_attributes_0_pkwiu" with "123"
  And I fill in "invoice_invoice_lines_attributes_0_unit" with "pcs"
  And I fill in "invoice_invoice_lines_attributes_0_quantity" with "1"
  And I fill in "invoice_invoice_lines_attributes_0_vat_rate" with ".22"
  And I fill in "invoice_invoice_lines_attributes_0_netto_price" with "100"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "successfully updated"
  And I should see "NewCustomerName"
  And I should see "NewAddress"
  And I should see "NewVatNo"

@tbd
Scenario: I can edit invoice’s seller information - name, address, vat no
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_seller_name" with "NewSellerName"
  And I fill in "invoice_seller_address" with "NewSellerAddress"
  And I fill in "invoice_seller_first_name" with "NewFirstName"
  And I fill in "invoice_seller_last_name" with "NewLastName"
  And I fill in "invoice_seller_vat_no" with "NewSellerVatNo"
  And I fill in "invoice_invoice_lines_attributes_0_name" with "Lead"
  And I fill in "invoice_invoice_lines_attributes_0_pkwiu" with "123"
  And I fill in "invoice_invoice_lines_attributes_0_unit" with "pcs"
  And I fill in "invoice_invoice_lines_attributes_0_quantity" with "1"
  And I fill in "invoice_invoice_lines_attributes_0_vat_rate" with ".22"
  And I fill in "invoice_invoice_lines_attributes_0_netto_price" with "100"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "successfully updated"
  And I should see "NewSellerName"
  And I should see "NewSellerAddress"
  And I should see "NewSellerVatNo"

@_todo
Scenario: Invoice created has its number automatically generated

Scenario: I can edit following additional information-  need example of norwegian invoice with comments

@tbd
Scenario: I can add custom invoice line to invoice
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_invoice_lines_attributes_0_name" with "AddedLineOne"
  And I fill in "invoice_invoice_lines_attributes_0_pkwiu" with "123"
  And I fill in "invoice_invoice_lines_attributes_0_unit" with "pcs"
  And I fill in "invoice_invoice_lines_attributes_0_quantity" with "1"
  And I fill in "invoice_invoice_lines_attributes_0_vat_rate" with ".22"
  And I fill in "invoice_invoice_lines_attributes_0_netto_price" with "100"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "successfully updated"
  And I follow translated "administration.invoices.index.view.edit_invoice"

Scenario: I can remove invoice line from invoice

Scenario: I can edit invoice line within invoice

Scenario: Invoice line’s netto/brutto fields are automatically updated on edit

Scenario: I can mark an invoice as paid by filling in amount and date fields

Scenario: I can list all invoices an see following columns -  number, customer, total, payment status

Scenario: I can sort invoices listing by following columns -  number, customer, total

Scenario: I can filter invoices list by following parameters - creation range, payment status, customer   

Scenario: I can download invoice as PDF file

Scenario: I can send invoice to given email address (as an attachment)

Scenario: I can print out invoice (bypassing PDF)

Scenario: I can credit an invoice ...