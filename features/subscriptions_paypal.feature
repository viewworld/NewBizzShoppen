@subscriptions @m24
Feature: Subscriptions Paypal

  # -------------------------------------------------------------------------------------------------------------------
  # Subperiods
  # -------------------------------------------------------------------------------------------------------------------
  Scenario: Billing cycle should be renamed to "Subscription period"

  Scenario: I can enter "Billing cycle" in weeks to make payments in smaller parts than subscrition period

  @debtors
  Scenario: User subscription debts should be based on subperiods

  @debtors
  Scenario: Subperiods for user are generated with each new subscription

  @invoices @_done @_tested_elsewhere @rspec
  Scenario: Invoice for subscription should be generated from subperiod lines

  @refunds
  Scenario: When subperiod is recalculated then the unused amount should be refunded

  # -------------------------------------------------------------------------------------------------------------------
  # Subscription Plan set up (moved)
  # -------------------------------------------------------------------------------------------------------------------

  # -------------------------------------------------------------------------------------------------------------------
  # Invoicing
  # -------------------------------------------------------------------------------------------------------------------
  @_done @_tested_elsewhere @rspec
  Scenario: Paid invoice is generated for successful Paypal payments for subperiod

  Scenario: Unpaid invoice is generated when number of Paypal retries is exceeded

  Scenario: Invoice generated automatically for Paypal payment should by sent to user by email

  Scenario: When user cancels recurring billing in Paypal he should receive email to reactivate it

  Scenario: When user cancels recurring billing in Paypal and billing date comes an unpaid invoice should be generated

  Scenario: User should be able to pay pay the missing amount using link/button in the email he receives

  Scenario: User should be able to reactivate recurring payments using link/button in the email he receives

  Scenario: User should see the detailed information on the missing payments in the email he receives

  # -------------------------------------------------------------------------------------------------------------------
  # Signing in
  # -------------------------------------------------------------------------------------------------------------------
  Scenario: When user cancels recurring billing in Paypal he should be asked to reactivate recurring payments everytime he logs in

  Scenario: When user cancels recurring billing in Paypal and has unpaid invoices issued he should be asked to pay for them every time he logs in

  Scenario: When user cancels recurring billing in Paypal and has unpaid invoices he should not be able to use the application until he pays

  # -------------------------------------------------------------------------------------------------------------------
  # Signing up
  # -------------------------------------------------------------------------------------------------------------------
  Scenario: When must enter billing information at start is enabled then I must confirm recurring payment in Paypal as part of signup

  Scenario: When must enter billing information at start is enabled then free period is handled by Paypal

  Scenario: When must enter billing information at end of free period is enabled for my subscription I should recevive an email to confirm recurring payent in Paypal before free period ends

  Scenario: If I do not confirm recurring payments in Paypal the subscrption should behave as it has been canceled (issue unpaid invoice and send email, sing in restrictions)

  # -------------------------------------------------------------------------------------------------------------------
  # IPN
  # -------------------------------------------------------------------------------------------------------------------

  @system
  Scenario: The number of retries should be saved in subperiod

  @system
  Scenario: Application should receive information from Paypal about payment status

  Scenario: When the number of retries exceeds the subscription plan limit then the subscription should be downgraded

  Scenario: When the number of retries exceeds the subscription plan limit then the recurring payment should be disabled in Paypal

  Scenario: When user gets automatically downgraded then the last unpaid subperiod should be handled by Debtors

  Scenario: Payments for subperiods should not be displayed on Debtors page
