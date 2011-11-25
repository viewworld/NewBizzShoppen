Feature: Subscription plan setup

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    Given subscription plan exists with attributes "name:Payable with paypal,use_paypal:1"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
    Given subscription plan exists with attributes "name:NOT Payable with paypal,use_paypal:0"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    22 |
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/administration\/subscription_plans$/"
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

  @_done @_tested
  Scenario: I can enable subscription to be handled by Paypal
    When I check "subscription_plan_use_paypal"

  @_done @_tested
  Scenario: I can enter number of free deals in free period
    When I fill in "subscription_plan_free_period" with "2"
    Then I fill in "subscription_plan_free_deals_in_free_period" with "10"

  @_done @_tested @selenium @wip
  Scenario: I can enable automatic downgrading
    Given I select "Supplier" from "subscription_plan_assigned_roles"
    When I check "subscription_plan_use_paypal"
    Then I check "subscription_plan_automatic_downgrading"
    And I select "NOT Payable with paypal" from "subscription_plan_automatic_downgrade_subscription_plan_id"
    And I press translated "administration.subscription_plans.new.view.button_create"
    And I open page in browser

  @_tested_elsewhere @_done
  Scenario: I can select a downgrade subscription when automatic downgrading is enabled

  Scenario: I can select only subscription which are not handled by paypal for automatic downgrading

  Scenario: I can select only subscription with corresponding role for automatic downgrading

  Scenario: I can enter the number of retries before automatic downgrading

  Scenario: The must enter billing and end of free period can only be enabled when there is free period for subscription plan