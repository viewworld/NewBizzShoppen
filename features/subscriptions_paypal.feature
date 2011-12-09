@subscriptions @m24
Feature: Subscriptions Paypal

  # -------------------------------------------------------------------------------------------------------------------
  # Subperiods
  # -------------------------------------------------------------------------------------------------------------------
  @non_testable @_done
  Scenario: Billing cycle should be renamed to "Subscription period"

  @non_testable @_done
  Scenario: I can enter "Billing cycle" in weeks to make payments in smaller parts than subscrition period

  # -------------------------------------------------------------------------------------------------------------------
  # Subscription Plan set up (moved)
  # -------------------------------------------------------------------------------------------------------------------

  # -------------------------------------------------------------------------------------------------------------------
  # Invoicing
  # -------------------------------------------------------------------------------------------------------------------
  @_done @_tested_elsewhere @rspec
  Scenario: Paid invoice is generated for successful Paypal payments for subperiod

  @_done @_tested_elsewhere @rspec
  Scenario: Unpaid invoice is generated when number of Paypal retries is exceeded

  @_done @_tested
  Scenario: Invoice generated automatically for Paypal payment should by sent to user by email
    Given user with email "kastomer@nbs.fake" and password "secret" and role "supplier" exists with confirmed paypal subscription named "Paypal for supp" with attributes "subscription_period:3,billing_cycle:1"
    And the current subperiod for user "kastomer@nbs.fake" is auto paid by paypal
    Then last email sent should have been sent to recipient "kastomer@nbs.fake"
    And last email sent should have subject "Invoice"

  @_done @_tested
  Scenario: When user cancels recurring billing in Paypal he should receive email to reactivate it
    Given user with email "kastomer@nbs.fake" and password "secret" and role "supplier" exists with confirmed paypal subscription named "Paypal for supp" with attributes "subscription_period:3,billing_cycle:1"
    And active subscription for user "kastomer@nbs.fake" has been canceled in paypal
    Then last email sent should have been sent to recipient "kastomer@nbs.fake"
    And last email sent should have subject "Paypal recurring payment cancelled. Reactivate it!"

  Scenario: When user cancels recurring billing in Paypal and billing date comes an unpaid invoice should be generated

  Scenario: User should be able to pay the missing amount using link/button in the email he receives

  Scenario: User should be able to reactivate recurring payments using link/button in the email he receives

  Scenario: User should see the detailed information on the missing payments in the email he receives

  # -------------------------------------------------------------------------------------------------------------------
  # Signing in MOVED
  # -------------------------------------------------------------------------------------------------------------------

  # -------------------------------------------------------------------------------------------------------------------
  # Signing up MOVED
  # -------------------------------------------------------------------------------------------------------------------

  # -------------------------------------------------------------------------------------------------------------------
  # IPN
  # -------------------------------------------------------------------------------------------------------------------

  @system
  Scenario: The number of retries should be saved in subperiod

  @system @non_testable
  Scenario: Application should receive information from Paypal about payment status

  Scenario: When the number of retries exceeds the subscription plan limit then the subscription should be downgraded

  Scenario: When the number of retries exceeds the subscription plan limit then the recurring payment should be disabled in Paypal

  Scenario: When user gets automatically downgraded then the last unpaid subperiod should be handled by Paypal manual payments

