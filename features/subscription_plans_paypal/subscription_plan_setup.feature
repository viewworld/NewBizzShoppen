@m24 @subscriptions @subscriptions_paypal
Feature: Subscription plan setup

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    Given subscription plan exists with attributes "name:XPayable with paypal,use_paypal:1"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
    Given subscription plan exists with attributes "name:NOT Payable with paypal,use_paypal:0"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    22 |
    Given subscription plan exists with attributes "name:Member NOT Payable with paypal,use_paypal:0,assigned_roles:member"
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

  @system @_done @_tested_elsewhere @rspec
  Scenario: "Billing date" (- weeks) cannot be applied to the first subperiod

  @_done @_tested @tgn
  Scenario: I can enable subscription to be handled by Paypal
    When I check "subscription_plan_use_paypal"

  @_done @_tested @tgn
  Scenario: I can enter number of free deals in free period
    When I fill in "subscription_plan_free_period" with "2"
    Then I fill in "subscription_plan_free_deals_in_free_period" with "10"

  @_done @_tested @selenium @tgn
  Scenario: I can enable automatic downgrading
    Given I select "Supplier" from "subscription_plan_assigned_roles"
    When I check "subscription_plan_use_paypal"
    Then I check "subscription_plan_automatic_downgrading"
    And I select "NOT Payable with paypal" from "subscription_plan_automatic_downgrade_subscription_plan_id"
    And I press translated "administration.subscription_plans.new.view.button_create"
    And "subscription_plan_automatic_downgrade_subscription_plan_id" dropdown should not have values "XPayable with paypal,Member NOT Payable with paypal"
    And I fill in "subscription_plan_paypal_retries" with "2"

  @_done @_tested_elsewhere @tgn
  Scenario: I can select a downgrade subscription when automatic downgrading is enabled

  @_done @_tested_elsewhere @tgn
  Scenario: I can select only subscription which are not handled by paypal for automatic downgrading

   @_done @_tested_elsewhere @tgn
  Scenario: I can select only subscription with corresponding role for automatic downgrading

  @_done @_tested_elsewhere @tgn
  Scenario: I can enter the number of retries before automatic downgrading

  @_done @_tested @selenium @tgn
  Scenario: The must enter billing and end of free period can only be enabled when there is free period for subscription plan
    When I check "subscription_plan_use_paypal"
    And I fill in "subscription_plan_free_period" with "2"
    And I choose "subscription_plan_paypal_billing_at_start_false"

  @_done @non_testable @tgn
  Scenario: I should not be able to set "Number of free deals in free period" for other role than suppliers
