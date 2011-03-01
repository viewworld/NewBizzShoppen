@invoices @$_admin @m4 @noguess
Feature: Invoices administration

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "first_name:Janko,last_name:Muzykant,company_name:Cello Ltd"
  And there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123" for country "Denmark"
  Then I sign in as jon@lajoie.ca with password secret

@_done @ao
Scenario: I can create new invoice for user
  When I follow translated "layout.main_menu.admin.invoices"
  And I select "Cello Ltd, kastomer@nbs.fake" from "invoice_user_id"
  And I select "DannyTheSeller" from "invoice_seller_id"
  And I press translated "administration.invoices.index.view.create_invoice"
  Then I should see "was successfully created"

@tgn @_tested
Scenario: I can see list of invoices pending creation
  Given I am not sign in
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And I have user with email bigbuyer2@person.com and role customer
  And User bigbuyer2@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And a lead Monitors ultimate deal2 exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And a lead Monitors ultimate deal3 exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:304.35,currency_id:1"
  And lead Monitors ultimate deal2 exists with attributes "price:20.11,currency_id:1"
  And lead Monitors ultimate deal3 exists with attributes "price:21.11,currency_id:1"
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration upcoming invoices
  Then I should see "304.35"
  Then I should see "41.22"

@m5 @ao @added @_done @_tested
Scenario: I can see list of invoices pending creation grouped by currency
  Given I am not sign in
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And I have user with email bigbuyer2@person.com and role customer
  And User bigbuyer2@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And a lead Monitors ultimate deal2 exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And a lead Monitors ultimate deal3 exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And a lead Monitors ultimate deal4 exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:304.35,currency_id:1"
  And lead Monitors ultimate deal2 exists with attributes "price:20.11,currency_id:1"
  And lead Monitors ultimate deal3 exists with attributes "price:21.11,currency_id:2"
  And lead Monitors ultimate deal4 exists with attributes "price:66.69,currency_id:3"
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration upcoming invoices
  Then I should see "304.35"
  Then I should see "20.11"
  Then I should see "21.11"
  Then I should see "66.69"

@m5 @added @tgn @sprint_5_corrections @_tested
Scenario: I can search for invoices by a combination of keywords: contact name, company name, lead name, invoice number
  Given VAT ratio is set to 0.0
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  Given a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:77.99,contact_name:Jill Johanssen,company_name:AIG Inc"
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  Given a lead Mouses ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Mouses ultimate deal exists with attributes "price:88.32,contact_name:Tom Blanq,company_name:Xerox"
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  Given I am not sign in
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration invoices
  When I fill in "search_with_keyword" with "jill johanssen"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"
  When I fill in "search_with_keyword" with "xerox"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should not see "77.99"
  Then I should see "88.32"
  When I fill in "search_with_keyword" with "monitors ultimate"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"
  When I fill in "search_with_keyword" with "1"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should see "1/201"

@m5 @added @tgn @sprint_5_corrections @_tested
Scenario: I can search for invoices pending creation by a combination of keywords: contact name, company name, lead name and a specific time period (date from to date to)
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  Given a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:77.99,contact_name:Jill Johanssen,company_name:AIG Inc"
  And a lead purchase for lead "Monitors ultimate deal" by user "bigbuyer1@person.com" with role "customer" exists with attributes "assigned_at:2011-01-01"
  Given I have user with email bigbuyer2@person.com and role customer
  And User bigbuyer2@person.com with role customer is big buyer
  Given a lead Mouses ultimate deal exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And lead Mouses ultimate deal exists with attributes "price:88.32,contact_name:Tom Blanq,company_name:Xerox"
  And a lead purchase for lead "Mouses ultimate deal" by user "bigbuyer2@person.com" with role "customer" exists with attributes "assigned_at:2011-01-10"
  Given I am not sign in
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration upcoming invoices
  When I fill in "search_with_not_invoiced_keyword" with "jill johanssen"
  And I press translated "administration.upcoming_invoices.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"
  When I fill in "search_with_not_invoiced_keyword" with "xerox"
  And I press translated "administration.upcoming_invoices.index.view.search_button"
  Then I should not see "77.99"
  Then I should see "88.32"
  When I fill in "search_with_not_invoiced_keyword" with "monitors ultimate"
  And I press translated "administration.upcoming_invoices.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"
  When I fill in "search_with_not_invoiced_keyword" with ""
  And I fill in "search_with_assigned_at_date_after_and_including" with "2011-01-05"
  And I fill in "search_with_assigned_at_date_before_and_including" with "2011-01-11"
  And I press translated "administration.upcoming_invoices.index.view.search_button"
  Then I should not see "77.99"
  Then I should see "88.32"

@m5 @added @tgn @sprint_5_corrections @_tested
Scenario: I should see on the upper right corner there should be a total of the upcoming invoices
  Given I go to administration upcoming invoices
  And I should see translated "administration.upcoming_invoices.index.view.total"
  And I should see "2"

@m5 @added @tgn @sprint_5_corrections @_tested
Scenario: I should be able to write a custom text on the invoice
  Given invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "vat_paid_in_customer_country:1"
  And I go to administration invoices
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_details" with "Some details for invoice"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "Some details for invoice"

@tgn @_tested
Scenario: I can create new invoice from suggestion on invoices pending creation listing
  Given I am not sign in
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And a lead Monitors ultimate deal2 exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And a lead Monitors ultimate deal3 exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:304.35,currency_id:1"
  And lead Monitors ultimate deal2 exists with attributes "price:20.11,currency_id:1"
  And lead Monitors ultimate deal3 exists with attributes "price:21.11,currency_id:1"
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration upcoming invoices
  And I follow translated "administration.upcoming_invoices.index.view.create_invoice"
  Then I press translated "administration.invoices.new.view.button_create"
  Then I should see translated "administration.invoices.show.view.header"
  And I go to administration invoices
  And I follow translated "administration.invoices.index.view.show_invoice"
  And I should see "304.35"
  And I should see "20.11"
  And I should see "21.11"

@_done @ao
Scenario: I can see invoice details
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see translated "administration.invoices.show.view.header"

@selenium @ao @_done
Scenario: I can edit invoice’s customer information - name, address, vat no
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d+\/edit/"
  And I fill in "invoice_customer_name" with "NewCustomerName"
  And I fill in "invoice_customer_address_attributes_address_line_1" with "NewStreet"
  And I fill in "invoice_customer_address_attributes_address_line_2" with "NewCity"
  And I fill in "invoice_customer_address_attributes_address_line_3" with "NewCounty"
  And I fill in "invoice_customer_address_attributes_zip_code" with "NewZipCode"
  And I fill in "invoice_customer_vat_no" with "NewVatNo"
  And I fill in the last field with id like "_name" with "Lead" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_quantity" with "1" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_vat_rate" with "22" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_netto_price" with "100" within ".invoice_inline_inputs"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "successfully updated"
  And I should see "NewCustomerName"
  And I should see "NewStreet"
  And I should see "NewCity"
  And I should see "NewCounty"
  And I should see "NewZipCode"
  And I should see "NewVatNo"

@selenium @ao @_done
Scenario: I can edit invoice’s seller information - name, address, vat no
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d+\/edit/"
  And I fill in "invoice_seller_name" with "NewSellerName"
  And I fill in "invoice_seller_address_attributes_address_line_1" with "NewStreet"
  And I fill in "invoice_seller_address_attributes_address_line_2" with "NewCity"
  And I fill in "invoice_seller_address_attributes_address_line_3" with "NewCounty"
  And I fill in "invoice_seller_address_attributes_zip_code" with "NewZipCode"
  And I fill in "invoice_seller_first_name" with "NewFirstName"
  And I fill in "invoice_seller_last_name" with "NewLastName"
  And I fill in "invoice_seller_vat_no" with "NewSellerVatNo"
  And I fill in the last field with id like "_name" with "Lead" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_quantity" with "1" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_vat_rate" with "22" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_netto_price" with "100" within ".invoice_inline_inputs"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "successfully updated"
  And I should see "NewSellerName"
  And I should see "NewStreet"
  And I should see "NewCity"
  And I should see "NewCounty"
  And I should see "NewZipCode"
  And I should see "NewSellerVatNo"

@_done @ao
Scenario: Invoice created has its number automatically generated
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I follow translated "layout.main_menu.admin.invoices"
  Then I should see "1/201" within "#invoices"

@tgn
Scenario: I can edit following additional information-  need example of norwegian invoice with comments

@selenium @ao @_done
Scenario: I can add custom invoice line to invoice
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d+\/edit/"
  And I fill in the last field with id like "_name" with "AddedLineOne" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_quantity" with "1" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_vat_rate" with "22" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_netto_price" with "100" within ".invoice_inline_inputs"
  And I press translated "administration.invoices.edit.view.save_button"
  Then I should see "successfully updated"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain "AddedLineOne"

@_done @ao @selenium
Scenario: I can remove invoice line from invoice
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d+\/edit/"
  And I follow translated "administration.invoices.edit.view.remove_line"
  And I press translated "administration.invoices.edit.view.save_button"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain ""

@_done @ao
Scenario: I can edit invoice line within invoice
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  And I fill in "invoice_invoice_lines_attributes_0_name" with "EditedLine"
  And I press translated "administration.invoices.edit.view.save_button"
  And I follow translated "administration.invoices.index.view.edit_invoice"
  Then the "invoice_invoice_lines_attributes_0_name" field should contain "EditedLine"

@selenium @ao @_done
Scenario: Invoice line’s netto/brutto fields are automatically updated on edit
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  And I click hidden link by url regex "/administration\/invoicing\/invoices\/\d+\/edit/"
  And I follow "add_fields_invoice_lines"
  And I fill in the last field with id like "_quantity" with "2" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_netto_price" with "100" within ".invoice_inline_inputs"
  And I fill in the last field with id like "_vat_rate" with "22" within ".invoice_inline_inputs"
  Then the "1" field with id like "_netto_value" should contain "200.00"
  And the "1" field with id like "_vat_value" should contain "44.00"
  And the "1" field with id like "_brutto_value" should contain "244.00"

@_done @ao
Scenario: I can mark an invoice as paid by clicking on Set as paid shortcut
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "netto_price:100,quantity:1,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.set_as_paid"
  And I follow translated "layout.main_menu.admin.invoices"
  Then I should see "Paid" within "#invoices"

@_done @ao
Scenario: I can list all invoices an see following columns -  number, customer, total, payment status
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And I follow translated "layout.main_menu.admin.invoices"
  Then I should see translated "administration.invoices.index.view.sale_date"
  And I should see translated "administration.invoices.index.view.invoice_number"
  And I should see translated "administration.invoices.index.view.customer"
  And I should see translated "administration.invoices.index.view.total"
  And I should see translated "administration.invoices.index.view.status"

@_done @ao
Scenario: I can sort invoices listing by following columns -  number, customer, total
  Given there is a seller with attributes "company_name:SellerTwo" for country "United Kingdom"
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And someone is signed up and confirmed as user with email ader_kastomer@nbs.fake and password secret and role customer with attributes "first_name:Ferdek,last_name:Kiepski"
  And invoice exists for user "ader_kastomer@nbs.fake" with role "customer" with seller "SellerTwo"
  And invoice exists for user "ader_kastomer@nbs.fake" with role "customer" with seller "SellerTwo"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.invoice_number"
  Then I should see "Janko Muzykant" before "Ferdek Kiepski"
  When I follow translated "administration.invoices.index.view.invoice_number"
  Then I should see "Ferdek Kiepski" before "Janko Muzykant"
  When I follow translated "administration.invoices.index.view.total"
  Then I should see "Janko Muzykant" before "Ferdek Kiepski"
  When I follow translated "administration.invoices.index.view.total"
  Then I should see "Ferdek Kiepski" before "Janko Muzykant"
  When I follow translated "administration.invoices.index.view.customer"
  Then I should see "Ferdek Kiepski" before "Janko Muzykant"
  When I follow translated "administration.invoices.index.view.customer"
  Then I should see "Janko Muzykant" before "Ferdek Kiepski"

@ao @_done
Scenario: I can filter invoices list by following parameters - creation range, payment status, customer
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And someone is signed up and confirmed as user with email ader_kastomer@nbs.fake and password secret and role customer with attributes "first_name:Ferdek,last_name:Kiepski"
  And invoice exists for user "ader_kastomer@nbs.fake" with role "customer"
  And first invoice for user "ader_kastomer@nbs.fake" with role "customer" is created at "2000-01-01"
  And first invoice for user "ader_kastomer@nbs.fake" with role "customer" is paid
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

@ao @_done
Scenario: I can download invoice as PDF file
  When invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "vat_paid_in_customer_country:0"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  And I follow translated PDF link "administration.invoices.show.view.download_pdf"
  Then I should see "Janko Muzykant"
  And I should see "122"

@_done @ao @_tested
Scenario: I can send invoice to given email address (as an attachment)
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  And I follow translated "administration.invoices.show.view.send"
  Then the "email_template_preview_recipients" field should contain "kastomer@nbs.fake"
  And I should see translated "administration.invoices.mailing.new.view.attachment"
  When I press translated "administration.invoices.mailing.new.view.send"
  Then I should see translated "flash.bulk_lead_share_by_email.actions.create.notice"

@tgn @_done @non_testable
Scenario: I can print out invoice (bypassing PDF)

@tgn
Scenario: I can credit an invoice ...

@tgn @added @_tested @selenium
Scenario: I can bulk set selected invoices as paid
  Given invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice exists for user "kastomer@nbs.fake" with role "customer"
  When I click hidden link by url regex "/administration\/invoicing\/invoices/"
  Then I check "mark_all"
  And I follow translated "administration.invoices.index.view.bulk_set_as_paid"
  Then I should see translated "flash.bulk_invoice_update.update.notice"
  Then I should see "Paid"

@tgn @added @_tested
Scenario: I can create invoice for any customer from users tab
  Given I go to administration users
  And I click hidden translated link "administration.users.index.view.create_invoice"
  Then I press translated "administration.invoices.new.view.button_create"
  And I should see translated "administration.invoices.edit.view.form.general_information"

@tgn @added @_tested
Scenario: I can create invoice for any customer from users tab
  Given I go to administration users
  And I click hidden translated link "administration.users.index.view.create_invoice"
  Then I press translated "administration.invoices.new.view.button_create"
  And I should see translated "administration.invoices.edit.view.form.general_information"

@added @m4b @_done
Scenario: EAN should be visible if filled
  When invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "ean_number:123456"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see translated "administration.invoices.show.view.ean_number"

@added @m4b @_done
Scenario: EAN should not be visible if not filled
  When invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should not see translated "administration.invoices.show.view.ean_number"

@added @m4b @_done
Scenario: I should not see amounts grouped by vat rate when vat is paid in customer country
  When user "kastomer@nbs.fake" with role "customer" has attributes "not_charge_vat:1"
  And invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should not see translated "administration.invoices.show.view.including"
  And I should not see "122" within ".totals"

@added @m4b @_done
Scenario: I should see amounts grouped by vat rate when vat is not paid in customer country
  When user "kastomer@nbs.fake" with role "customer" has attributes "not_charge_vat:0"
  And invoice exists for user "kastomer@nbs.fake" with role "customer"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see translated "administration.invoices.show.view.vat_spec"
  And I should see "122" within ".totals"

@added @m4b @_done
Scenario: We do not need to generate a copy of the invoice, just the orininal
  When invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "vat_paid_in_customer_country:0"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I follow translated "layout.main_menu.admin.invoices"
  And I follow translated "administration.invoices.index.view.show_invoice"
  And I follow translated PDF link "administration.invoices.show.view.download_pdf"
  Then I should not see "ORIGINAL"
  And I should not see "COPY"

@added @m4b @selenium @_done
  Scenario: When you edit an invoice you should have the option to cancel the edit invoice
  When invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "vat_paid_in_customer_country:0"
  And invoice line for first invoice exists for user "kastomer@nbs.fake" with role "customer" with attributes "quantity:1,netto_price:100,vat_rate:22,netto_value:100,brutto_value:122"
  And I click hidden link by url regex "/administration\/invoicing\/invoices/"
  And I click hidden link by url regex "/administration\/invoicing\/invoices\/(\d+)\/edit/"
  And I press translated "common.cancel_link"
  Then I should be on administration invoices page

@m5 @sellers @ao @_done
Scenario: When creating new invoice a default seller should be selected
  When there is a seller with attributes "company_name:SellerOne" for country "Denmark"
  And there is a seller with attributes "company_name:DefaultSeller,default:1" for country "Denmark"
  And there is a seller with attributes "company_name:SellerThree" for country "Denmark"
  And someone is signed up and confirmed as user with email customer_one@nbs.fake and password secret and role customer with attributes "first_name:John 1,last_name:Smith,country:2"
  And User customer_one@nbs.fake with role customer is big buyer
  And a lead LeadOne exists within category Computers and is bought by user customer_one@nbs.fake with role customer
  And I follow translated "layout.main_menu.admin.upcoming_invoices"
  And I follow translated "administration.upcoming_invoices.index.view.create_invoice"
  And I press translated "administration.invoices.new.view.button_create"
  Then the "invoice_seller_name" field should contain "DefaultSeller"

@m5 @tgn @_tested
Scenario: Include users name, company and user email when filtering invoices
  Given I have user with email bigbuyer1@person.com and role customer
  And user bigbuyer1@person.com with role customer exists with attributes "first_name:John, last_name:Havranek"
  And User bigbuyer1@person.com with role customer is big buyer
  Given a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:77.99,contact_name:Jill Johanssen,company_name:AIG Inc"
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  Given I have user with email bigbuyer2@person.com and role customer
  And user bigbuyer2@person.com with role customer exists with attributes "first_name:Albert, last_name:Bohema"
  And User bigbuyer2@person.com with role customer is big buyer
  Given a lead Mouses 2 ultimate deal exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And lead Mouses 2 ultimate deal exists with attributes "price:88.32,contact_name:Tom Blanq,company_name:Xerox"
  And user with email "bigbuyer2@person.com" and role "customer" has invoice generated for all unpaid leads
  And first invoice for user "bigbuyer2@person.com" with role "customer" exists with attributes "customer_name: Jared Diamond"
  And I go to administration invoices
  When I fill in "search_with_keyword" with "havranek"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should see "77.99"
  And I should not see "88.32"
  When I fill in "search_with_keyword" with "bigbuyer2@person.com"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should see "88.32"
  And I should not see "77.99"
  When I fill in "search_with_keyword" with "jared diamond"
  And I press translated "administration.invoices.index.view.search_button"
  Then I should see "88.32"
  And I should not see "77.99"

@m5 @tgn @_tested
Scenario: On Invoices listing there should be sums present in top right hand corner (total, total paid, total unpaid)
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  Given a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  Given I have user with email bigbuyer2@person.com and role customer
  And User bigbuyer2@person.com with role customer is big buyer
  Given a lead Mouses 2 ultimate deal exists within category Computers and is bought by user bigbuyer2@person.com with role customer
  And user with email "bigbuyer2@person.com" and role "customer" has invoice generated for all unpaid leads
   Given I have user with email bigbuyer3@person.com and role customer
  And User bigbuyer3@person.com with role customer is big buyer
  Given a lead Mouses 3 ultimate deal exists within category Computers and is bought by user bigbuyer3@person.com with role customer
  And user with email "bigbuyer3@person.com" and role "customer" has invoice generated for all unpaid leads
  And first invoice for user "bigbuyer3@person.com" is not paid
  And I go to administration invoices
  Then I should see "Total: 3"
  And I should see "Paid: 2"
  And I should see "Unpaid: 1"

@added @m5 @ao @_done @_tested
Scenario: I should see payment details
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Monitors ultimate deal exists with attributes "price:304.35,currency_id:1"
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  And I go to administration invoices
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see CSS path "div.status_data"

@added @ao @m5 @_done @_tested
Scenario: I can see customer and seller addresses on invoice
  Given there is a seller with attributes "company_name:Selleo,default:1" for country "Denmark"
  And seller "Selleo" has address "address_line_1:Kaminskiego"
  And someone is signed up and confirmed as user with email bigbuyer666@nbs.com and password secret and role customer
  And User bigbuyer666@nbs.com with role customer is big buyer
  And user "bigbuyer666@nbs.com" with role "customer" has address "address_line_1:Michalowicza"
  And a lead Klawiaturyyy exists within category Computers and is bought by user bigbuyer666@nbs.com with role customer
  And user with email "bigbuyer666@nbs.com" and role "customer" has invoice generated for all unpaid leads
  And I go to administration invoices
  And I follow translated "administration.invoices.index.view.show_invoice"
  Then I should see "Kaminskiego" within ".from_to_table tr:nth-child(2) td:nth-child(1)"
  And I should see "Michalowicza" within ".from_to_table tr:nth-child(2) td:nth-child(2)"
