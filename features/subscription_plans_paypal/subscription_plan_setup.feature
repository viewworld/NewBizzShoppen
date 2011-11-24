Feature: Subscription plan setup

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/administration\/subscription_plans$/"
    And I open page in browser
    When I follow translated "administration.subscription_plans.index.view.new_subscription_plan"

  @_done @non_testable
  Scenario: "Billing period" should be renamed to "Billing date" (+/- weeks)

  @system @selenium @tgn @_done @_tested
  Scenario: "Billing period" should be less than "Billing cycle"
    When I fill in "subscription_plan_billing_cycle" with "4"
    And I fill in "subscription_plan_billing_period" with "5"
  And I press translated "administration.subscription_plans.new.view.button_create"
  Then I should see "must be less than 4"

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