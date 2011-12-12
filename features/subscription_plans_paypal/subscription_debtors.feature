@subscriptions @m24 @requested @debtors
Feature: Subscription debtors

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And I sign in as jon@lajoie.ca with password secret

  @_done @_tested
  Scenario: Payments for Paypal subperiods should not be displayed on Debtors page
    Given someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role supplier with attributes "first_name:Steve,last_name:Vai,company_name:Vaicom"
    And subscription plan exists with attributes "name:Premium supplier,subscription_period:12,use_paypal:true"
    And subscription plan has currency named "DKK"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
    And user with email "kastomer@nbs.fake" upgrades to subscription named "Premium supplier"
    And user with email "kastomer@nbs.fake" has billing date today for active subscription
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I fill in "search_with_keyword" with "kastomer@nbs.fake"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    Then I should see translated "common.nothing_to_display"

  @added @_done @_tested
  Scenario: Payments for non-Paypal subperiods should be displayed on Debtors page
    Given someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role supplier with attributes "first_name:Steve,last_name:Vai,company_name:Vaicom"
    And subscription plan exists with attributes "name:Premium supplier,subscription_period:12,use_paypal:false"
    And subscription plan has currency named "DKK"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
    And user with email "kastomer@nbs.fake" upgrades to subscription named "Premium supplier"
    And user with email "kastomer@nbs.fake" has billing date today for active subscription
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I fill in "search_with_keyword" with "kastomer@nbs.fake"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    Then I should see "2" rows in a table within "#invoices_list"
