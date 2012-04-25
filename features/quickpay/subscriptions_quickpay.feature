@m34 @_requested
Feature: Subscriptions Quickpay

  Scenario: Paid invoice is generated for successful Quickpay payments for subperiod

  Scenario: Unpaid invoice is generated when number of Quickpay retries is exceeded

  Scenario: Invoice generated automatically for Quickpay payment should by sent to user by email

  Scenario: User should be able to pay the missing amount using link/button in the email he receives

  Scenario: User should see the detailed information on the missing payments in the email he receives

  Scenario: The number of retries should be saved in subperiod

  Scenario: When the number of retries exceeds the subscription plan limit then the subscription should be downgraded

  Scenario: When the number of retries exceeds the subscription plan limit then the recurring payment should be disabled in Quickpay

  Scenario: When user gets automatically downgraded then the last unpaid subperiod should be handled by Quickpay manual payments