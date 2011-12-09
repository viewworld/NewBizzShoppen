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

  Scenario: Invoice generated automatically for Paypal payment should by sent to user by email

  Scenario: When user cancels recurring billing in Paypal he should receive email to reactivate it

  Scenario: When user cancels recurring billing in Paypal and billing date comes an unpaid invoice should be generated

  Scenario: User should be able to pay pay the missing amount using link/button in the email he receives

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

