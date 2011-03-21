@$_admin @m6 @tgn @added
Feature: Creditors administration

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email admin99@nbs.com and password secret and role admin
  Then I sign in as admin99@nbs.com with password secret
  Given I have user with email big_buyer.biz@nbs.com and role customer
  And User big_buyer.biz@nbs.com with role customer is big buyer
  And a lead Super computers #1 exists within category Computers and is bought by user big_buyer.biz@nbs.com with role customer
  And user with email "big_buyer.biz@nbs.com" and role "customer" has invoice generated for all unpaid leads
  And all invoices for user with email "big_buyer.biz@nbs.com" and role "customer" are unpaid
  And last invoice for user "big_buyer.biz@nbs.com" with role "customer" is credited
  And a lead Super computers #2 exists within category Computers and is bought by user big_buyer.biz@nbs.com with role customer
  And user with email "big_buyer.biz@nbs.com" and role "customer" has invoice generated for all unpaid leads
  And last invoice for user "big_buyer.biz@nbs.com" with role "customer" is refunded for lines "Super computers #2"
  And I go to administration creditors

@_tested
Scenario: I can list all credits
  Then I should see "Credit"

@_tested
Scenario: I can list separately credits
  Then I should see "1/20"
