Feature: Subscription plan setup

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/administration\/subscription_plans$/"

  Scenario: "Billing period" should be renamed to "Billing date" (+/- weeks)

  @system
  Scenario: "Billing period" shuld be less than "Billing cycle"

  @system
  Scenario: "Billing date" (- weeks) cannot be applied to the first subperiod

  Scenario: I can enable subscription to be handled by Paypal

  Scenario: I can enter number of free deals in free period

  Scenario: I can enable automatic downgrading

  Scenario: I can select a downgrade subscription when automatic downgrading is enabled

  Scenario: I can select only subscription which are not handled by paypal for automatic downgrading

  Scenario: I can select only subscription with corresponding role for automatic downgrading

  Scenario: I can enter the number of retries before automatic downgrading

  Scenario: The must enter billing and end of free period can only be enabled when there is free period for subscription plan