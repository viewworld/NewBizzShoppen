@m21 @requested @subscriptions
Feature: Subscription backend

@non_testable @_done @tgn
Scenario: Existing accounts should have subscription assigned free one (each role should have free subscription)

@tested_elsewhere @_done @tgn
Scenario: The billing cycle on paid subscription starts after the free period

@tested_elsewhere @_done @tgn
Scenario: Rake task reviews users' subscriptions on a daily basis and prolongs them unless cancelled

@backlog @requested
Scenario: Payable subscription is represented additionally by subperiods with price and payment progress (invoiced?, billed_at)

@backlog @requested
Scenario: Each subperiod should have corrected amount of partial payment calculated

@backlog @requested
Scenario: Payment progress of payable subscription is updated by Paypal IPN

@backlog @requested
Scenario: Each subperiod is marked as paid if IPN notification confirms its payment

@backlog @requested
Scenario: The subperiod is marked as NOT paid if IPN notification confirms that payment failed

@backlog @requested
Scenario: When my payment is successful then invoice is generated and sent to the customer if subscription requires that

@backlog @requested
Scenario: When my payment is successful then I am added to debtors if subscription does not require auto invoice creation/sending

@backlog @requested
Scenario: When user cancels his/hers recurring payment directly in paypal then subscription is cancelled through IPN notification

@backlog @requested
Scenario: When user cancels his/hers recurring payment directly in paypal then the debt is created from unpaid upcoming periods through IPN notification

@backlog @requested
Scenario: When recurring payment profile is created in paypal, it should be defined in weeks

@backlog @requested
Scenario: When recurring payment profile is created in paypal, it should have correct frequency based on the subperiods of user subscription

@backlog @requested
Scenario: When recurring payment profile is created in paypal, it should have correct amount for period payment

@backlog @requested
Scenario: When recurring payment profile is created in paypal, it should have the same currency as subscription for which it is created

@backlog @requested
Scenario: Rake task to review cancelled subscriptions in order to check when they expire and then cancel the paypal profile