@invoices @$_admin @m4 @ao @noguess
Feature: Invoices administration

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "first_name:Janko,last_name:Muzykant"
  Then I sign in as jon@lajoie.ca with password secret

@_done
Scenario: I can create new invoice for user
  When I follow translated "layout.main_menu.admin.invoices"
  And I select "Janko Muzykant" from "invoice_user_id"
  And I press translated "administration.invoices.index.view.create_invoice"
  Then I should see "was successfully created"

@_todo
Scenario: I can see list of invoices pending creation

@_todo
Scenario: I can create new invoice from suggestion on invoices pending creation listing

@_done
Scenario: I can see invoice details
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see translated "administration.invoices.show.view.header"

@_done
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

@_done
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

@wip
Scenario: Invoice created has its number automatically generated
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  Then I should see "1/201" within "#invoices"

Scenario: I can edit following additional information-  need example of norwegian invoice with comments

@_done
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
  Then the "invoice_invoice_lines_attributes_0_name" field should contain "AddedLineOne"

@_done
Scenario: I can remove invoice line from invoice
  When invoice exists for user "kastomer@nbs.fake"
  And invoice line for first invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I follow translated "administration.invoices.edit.view.remove_line"
  And I press translated "administration.invoices.edit.view.save_button"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain ""

@_done
Scenario: I can edit invoice line within invoice
  When invoice exists for user "kastomer@nbs.fake"
  And invoice line for first invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_invoice_lines_attributes_0_name" with "EditedLine"
  And I press translated "administration.invoices.edit.view.save_button"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain "EditedLine"

@selenium @_done
Scenario: Invoice line’s netto/brutto fields are automatically updated on edit
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_invoice_lines_attributes_0_quantity" with "2"
  And I fill in "invoice_invoice_lines_attributes_0_netto_price" with "100"
  And I fill in "invoice_invoice_lines_attributes_0_vat_rate" with "0.22"
  Then the "invoice_invoice_lines_attributes_0_netto_value" field should contain "200.00"
  And the "invoice_invoice_lines_attributes_0_vat_value" field should contain "44.00"
  And the "invoice_invoice_lines_attributes_0_brutto_value" field should contain "244.00"

@_done
Scenario: I can mark an invoice as paid by filling in amount and date fields
  When invoice exists for user "kastomer@nbs.fake"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with attributes "netto_price:100,quantity:1,vat_rate:0.22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.set_as_paid"
  And I fill in "invoice_cash_flow" with "122"
  And I press translated "administration.invoices.cash_flow.view.save_button"
  And I follow translated "administration.invoices.show.view.go_back"
  Then I should see "Paid" within "#invoices"

@_done
Scenario: I can list all invoices an see following columns -  number, customer, total, payment status
  When invoice exists for user "kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  Then I should see translated "administration.invoices.index.view.sale_date"
  And I should see translated "administration.invoices.index.view.invoice_number"
  And I should see translated "administration.invoices.index.view.customer"
  And I should see translated "administration.invoices.index.view.total"
  And I should see translated "administration.invoices.index.view.paid_at"

@_done
Scenario: I can sort invoices listing by following columns -  number, customer, total
  When invoice exists for user "kastomer@nbs.fake"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with attributes "quantity:1,netto_price:100,vat_rate:0.22,netto_value:100,brutto_value:122"
  And someone is signed up and confirmed as user with email ader_kastomer@nbs.fake and password secret and role customer with attributes "first_name:Ferdek,last_name:Kiepski"
  And invoice exists for user "ader_kastomer@nbs.fake"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.invoice_number"
  Then I should see "Janko Muzykant" before "Ferdek Kiepski"
  When I follow translated "administration.invoices.index.view.invoice_number"
  Then I should see "Ferdek Kiepski" before "Janko Muzykant"
  When I follow translated "administration.invoices.index.view.total"
  Then I should see "Ferdek Kiepski" before "Janko Muzykant"
  When I follow translated "administration.invoices.index.view.total"
  Then I should see "Janko Muzykant" before "Ferdek Kiepski"
  When I follow translated "administration.invoices.index.view.customer"
  Then I should see "Ferdek Kiepski" before "Janko Muzykant"
  When I follow translated "administration.invoices.index.view.customer"
  Then I should see "Janko Muzykant" before "Ferdek Kiepski"

@_done
Scenario: I can filter invoices list by following parameters - creation range, payment status, customer
  When invoice exists for user "kastomer@nbs.fake"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with attributes "quantity:1,netto_price:100,vat_rate:0.22,netto_value:100,brutto_value:122"
  And someone is signed up and confirmed as user with email ader_kastomer@nbs.fake and password secret and role customer with attributes "first_name:Ferdek,last_name:Kiepski"
  And invoice exists for user "ader_kastomer@nbs.fake"
  And first invoice for user "ader_kastomer@nbs.fake" is created at "2000-01-01"
  And first invoice for user "ader_kastomer@nbs.fake" is paid
  And I follow translated "layout.main_menu.admin.invoices"
  When I fill in "search_with_keyword" with "Janko Muzykant"
  And I press translated "administration.invoices.index.view.search_label"
  Then I should see "Janko Muzykant" within "#invoices"
  And I should not see "Ferdek Kiepski" within "#invoices"
  When I fill in "search_with_keyword" with ""
  And I fill in "search_with_sale_date_after_and_including" with "2000-01-01"
  And I fill in "search_with_sale_date_before_and_including" with "2000-01-01"
  And I press translated "administration.invoices.index.view.search_label"
  Then I should see "Ferdek Kiepski" within "#invoices"
  And I should not see "Janko Muzykant" within "#invoices"
  When I fill in "search_with_sale_date_after_and_including" with ""
  And I fill in "search_with_sale_date_before_and_including" with ""
  And I select translated "administration.invoices.index.view.not_paid" from "search_with_paid"
  And I press translated "administration.invoices.index.view.search_label"
  Then I should see "Janko Muzykant" within "#invoices"
  And I should not see "Ferdek Kiepski" within "#invoices"
  When I select translated "administration.invoices.index.view.paid" from "search_with_paid"
  And I press translated "administration.invoices.index.view.search_label"
  Then I should see "Ferdek Kiepski" within "#invoices"
  And I should not see "Janko Muzykant" within "#invoices"

@_done
Scenario: I can download invoice as PDF file
  When invoice exists for user "kastomer@nbs.fake"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with attributes "quantity:1,netto_price:100,vat_rate:0.22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  And I follow translated PDF link "administration.invoices.show.view.download_pdf"
  Then I should see "Janko Muzykant"
  And I should see "122"

@wip
Scenario: I can send invoice to given email address (as an attachment)


Scenario: I can print out invoice (bypassing PDF)

Scenario: I can credit an invoice ...