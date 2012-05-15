@m34 @_requested
Feature: Signing up with Quickpay

  Scenario: User can choose either paypal or quickpay

  @_done @_non_testable
  Scenario: When must enter billing information at start is enabled then I must confirm recurring payment in Quickpay as part of signup

  @_done @_non_testable
  Scenario: When must enter billing information at start is enabled and user choses Quickpay then confirmation is done as part of signup and free period is applied

  Scenario: When must enter billing information at end of free period is enabled for my subscription I should recevive an email to confirm recurring payent in Quickpay before free period ends

  Scenario: If I do not confirm recurring payments in Quickpay the subscrption should behave as it has been canceled (issue unpaid invoice and send email, sign in restrictions)