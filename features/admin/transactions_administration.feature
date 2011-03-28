@transactions @$_admin @m4 @tgn
Feature: Transactions administration

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I have user with email gerard.jones@paerson22.com and role customer
  And user gerard.jones@paerson22.com with role customer exists with attributes "first_name:John,last_name:Kohen"
  And I have user with email lead_user.jones@paerson22.com and role lead_user
  And lead Monitors deal exists within category Computers
  And lead Printers deal exists within category Computers
  And lead Monitors deal exists with attributes "price:321.23"
  And lead Monitors deal is bought by user gerard.jones@paerson22.com with role customer and is assigned to user lead_user.jones@paerson22.com with role lead_user
  And lead Printers deal is bought by user gerard.jones@paerson22.com with role customer and is assigned to user lead_user.jones@paerson22.com with role lead_user
  And user with email "gerard.jones@paerson22.com" and role "customer" has invoice for lead "Monitors deal" and transaction created by paypal
  And user with email "gerard.jones@paerson22.com" and role "customer" has invoice for lead "Printers deal" and transaction created manually
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I go to administration transactions

@_tested
Scenario: I can see a listing of all transactions registered in system
  Then I should see "321.23"
  And I should see "Paypal"

@_tested
Scenario: I can filter listing of transactions by invoice number
  When I fill in "search_with_keyword" with "John Kohen"
  And I press translated "administration.payment_transactions.index.view.search_button"
  Then I should see "Manual"

@_tested
Scenario: I can create transaction (manual) for given invoice (need to supply amount and date)
  When I go to administration invoices
  Then I follow translated "administration.invoices.index.view.add_transaction"
  And I fill in "manual_transaction_amount" with "291.99"
  And I fill in "manual_transaction_paid_at" with "12-12-2010 00:00:00"
  And I press translated "administration.payment_transactions.new.view.button_create"
  Then I should see translated "flash.payment_transactions.create.notice"

@_tested @added
Scenario: I can edit transaction (manual) for given invoice
  Then I follow translated "administration.payment_transactions.index.view.edit"
  And I fill in "payment_transaction_amount" with "121.99"
  And I fill in "payment_transaction_paid_at" with "01-12-2010 00:00:00"
  And I press translated "administration.payment_transactions.edit.view.button_update"
  Then I should see translated "flash.payment_transactions.update.notice"
  And I should see "121.99"

@_tested
Scenario: I can create more than one transaction for given invoice
  When I go to administration invoices
  Then I follow translated "administration.invoices.index.view.add_transaction"
  And I fill in "manual_transaction_amount" with "291.99"
  And I fill in "manual_transaction_paid_at" with "12-12-2010 00:00:00"
  And I press translated "administration.payment_transactions.new.view.button_create"
  Then I should see translated "flash.payment_transactions.create.notice"
  When I go to administration invoices
  Then I follow translated "administration.invoices.index.view.add_transaction"
  And I fill in "manual_transaction_amount" with "10.99"
  And I fill in "manual_transaction_paid_at" with "14-12-2010 00:00:00"
  And I press translated "administration.payment_transactions.new.view.button_create"
  Then I should see translated "flash.payment_transactions.create.notice"

@m6 @tgn @_tested
Scenario: I can refund a transaction manually (what is the implication??)
  Given there are no invoices
  Given I have user with email big_buyer.biz@nbs.com and role customer
  And User big_buyer.biz@nbs.com with role customer is big buyer
  And a lead Super computers #1 exists within category Computers and is bought by user big_buyer.biz@nbs.com with role customer
  And lead "Super computers #1" has attributes "price:99.99"
  And user with email "big_buyer.biz@nbs.com" and role "customer" has invoice generated for all unpaid leads
  When I click hidden link by url regex "/administration\/invoicing\/invoices/"
  Then I follow translated "administration.invoices.index.view.edit_invoice"
  And I check "invoice_invoice_lines_attributes_0_is_credited"
  And I press translated "administration.invoices.edit.view.save_button"
  When I click hidden link by url regex "/administration\/invoicing\/invoices/"
  Then I should see "0.00"

@m5 @added @tgn @sprint_5_corrections @_tested
Scenario: I can search for a transaction by a combination of keyword: contact name, company name, lead name, invoice number and a specific time period (date from to date to)
  Given VAT ratio is set to 0.0
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And user "bigbuyer1@person.com" with role "customer" has attributes "not_charge_vat:1"
  Given a lead TV ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead TV ultimate deal exists with attributes "price:77.99,contact_name:Jill Johanssen,company_name:AIG Inc"
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  Given first invoice for user "bigbuyer1@person.com" with role "customer" exists with attributes "sale_date:2010-12-11"
  Given a lead Wires ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And lead Wires ultimate deal exists with attributes "price:88.32,contact_name:Tom Blanq,company_name:Xerox"
  And user with email "bigbuyer1@person.com" and role "customer" has invoice generated for all unpaid leads
  And I am not sign in
  Then I sign in as bob@person.com with password supersecret
  And I go to administration transactions
  When I fill in "search_with_keyword" with "1"
  And I press translated "administration.payment_transactions.index.view.search_button"
  Then I should see "1/201"
  When I fill in "search_with_keyword" with "jill johanssen"
  And I press translated "administration.payment_transactions.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"
  When I fill in "search_with_keyword" with "xerox"
  And I press translated "administration.payment_transactions.index.view.search_button"
  Then I should not see "77.99"
  Then I should see "88.32"
  When I fill in "search_with_keyword" with "tv ultimate"
  And I press translated "administration.payment_transactions.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"
  When I fill in "search_with_keyword" with ""
  And I fill in "search_with_sale_date_after_and_including" with "2010-12-10"
  And I fill in "search_with_sale_date_before_and_including" with "2011-01-10"
  And I press translated "administration.payment_transactions.index.view.search_button"
  Then I should see "77.99"
  Then I should not see "88.32"

@requested @m8
Scenario: Show company name in listing