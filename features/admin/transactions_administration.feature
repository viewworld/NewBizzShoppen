@transactions @$_admin @m4 @tgn
Feature: Transactions administration

Background:
  Given I am on the homepage
  And I make sure current locale is English
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
  And I fill in "manual_transaction_amount" with "121.99"
  And I fill in "manual_transaction_paid_at" with "01-12-2010 00:00:00"
  And I press translated "administration.payment_transactions.edit.view.button_update"
  Then I should see translated "flash.payment_transactions.update.notice"

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

@m0
Scenario: I can refund a transaction manually (what is the implication??)

@m5 @added @tgn @sprint_5_corrections
Scenario: I can search for a transaction by a combination of keyword: contact name, company name, lead name, invoice number and a specific time period (date from to date to)