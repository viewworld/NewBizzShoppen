@m34 @_requested
Feature: Signing up with Quickpay

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I make sure Paypal subscriptions are enabled

  @_done @_tested  @selenium
  Scenario: User can choose either paypal or quickpay
    Given setting for "email_verification_for_suppliers" is set to "0"
    And there are no subscription plans
    And there is subscription plan named "Supplier Paypal" for role "category_supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0,use_online_payment:1" and price "200"
    And subscription plan named "Supplier Paypal" has currency named "EUR"
    And there is subscription plan named "Supplier Quickpay" for role "category_supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0,use_online_payment:1" and price "200"
    And subscription plan named "Supplier Quickpay" has currency named "DKK"
    When I go to supplier sign up
    And I choose subscription named "Supplier Paypal"
    And I press translated "common.payment_methods.paypal_button"
    And I choose subscription named "Supplier Quickpay"
    And I press translated "common.payment_methods.quickpay_button"

  @_done @_non_testable
  Scenario: When must enter billing information at start is enabled then I must confirm recurring payment in Quickpay as part of signup

  @_done @_non_testable
  Scenario: When must enter billing information at start is enabled and user choses Quickpay then confirmation is done as part of signup and free period is applied

  @_done @_non_testable
  Scenario: When must enter billing information at end of free period is enabled for my subscription I should recevive an email to confirm recurring payent in Quickpay before free period ends

  @_done @_tested_elsewhere
  Scenario: If I do not confirm recurring payments in Quickpay the subscrption should behave as it has been canceled (issue unpaid invoice and send email, sign in restrictions)