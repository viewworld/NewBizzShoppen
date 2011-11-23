@subscriptions @m24
Feature: Subscriptions Paypal

Scenario: Billing cycle should be renamed to "Subscription period"

@subscriptions
Scenario: I can enter "Billing cycle" in weeks to make payments in smaller parts than subscrition period

@subscriptions @system
Scenario: Payable subscription is represented additionally by subperiods

@subscriptions @system
Scenario: Each subperiod has subscription lines with prices proportionally calculated

@subscriptions @system
Scenario: Each subperiod should have stored the total amount of it's subscription lines

@subscriptions @system
Scenario: Each subperiod should have it's billing date

@subscriptions @system
Scenario: Each subperiod is attached to an invoice

@subscriptions @system
Scenario: Each subperiod can be marked as paid

@subscriptions @system
Scenario: When subscription ends prematurly (upgrade or change by admin) then upcoming subperiods should be deleted

@subscriptions @system
Scenario: When subscription ends prematurly (upgrade or change by admin) then the current subperiod should be recalculated

@debtors
Scenario: User subscription debts should be based on subperiods

@debtors
Scenario: Subperiods for user are generated with each new subscription

@invoices
Scenario: Invoice for subscription should be generated from subperiod lines

@refunds
Scenario: When subperiod is recalculated then the unused amount should be refunded

@subscriptions
Scenario: "Billing period" should be renamed to "Billing date" (+/- weeks)

@subscriptions @system
Scenario: "Billing period" shuld be less than "Billing cycle"

@subscriptions @system
Scenario: "Billing date" (- weeks) cannot be applied to the first subperiod

Scenario: I can enable subscription to be handled by Paypal

Scenario: I can enter number of free deals in free period

Scenario: I can enable automatic downgrading

Scenario: I can select a downgrade subscription when automatic downgrading is enabled

Scenario: I can select only subscription which are not handled by paypal for automatic downgrading

Scenario: I can select only subscription with corresponding role for automatic downgrading

Scenario: I can enter the number of retries before automatic downgrading

Scenario: I can enable automatic generation of invoices for successful Paypal payments

Scenario: Invoice generated automatically for Paypal payment should by sent to user by email

Scenario: I should not be able to set "Number of free deals in free period" for other role than suppliers

Scenario: As supplier I cannot create new deals if I used my free deals limit

@system
Scenario: Number of available free deals should decrement each time a deal is created in free period

@system
Scenario: The number of retries should be saved in subperiod

@system
Scenario: Application should receive information from Paypal about payment status

Scenario: When the number of retries exceeds the subscription plan limit then the subscription should be downgraded

Scenario: When the number of retries exceeds the subscription plan limit then the recurring payment should be disabled in Paypal

Scenario: When user gets automatically downgraded then the last unpaid subperiod should be handled by Debtors

Scenario: When automatic invoicing is enabled then the payments for subperiods should not be displayed on Debtors page

Scenario: When automatic invoicing is disabled I can issue an invoice when subperiod is marked as paid by Paypal
