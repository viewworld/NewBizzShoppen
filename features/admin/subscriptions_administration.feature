@subscriptions @$_admin @requested  @m21
Feature: Subscriptions administration
  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/administration\/subscription_plans$/"

@_done @tested_elsewhere @tgn
Scenario: I can view list of existing subscription types

@selenium @_done @_tested @tgn
Scenario: I can create new subscription type
  When I follow translated "administration.subscription_plans.index.view.new_subscription_plan"
  And I fill in "subscription_plan_name" with "Test subscription 1"
  And I fill in "subscription_plan_billing_cycle" with "12"
  And I fill in "subscription_plan_lockup_period" with "1"
  And I fill in "subscription_plan_billing_period" with "1"
  And I fill in "subscription_plan_free_period" with "2"
  And I select "EUR" from "subscription_plan_currency_id"
  And I select "Supplier" from "subscription_plan_assigned_roles"
  And I check "subscription_plan_is_active"
  And I check "subscription_plan_can_be_upgraded"
  And I check "subscription_plan_can_be_downgraded"
  And I check "subscription_plan_team_buyer"
  And I check "subscription_plan_big_buyer"
  And I check "subscription_plan_deal_maker"
  And I check "subscription_plan_auto_prolong"
  When I follow translated "administration.subscription_plans.form.new_line"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_0_name" with "Invoice line item 1"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_0_price" with "124"
  When I follow translated "administration.subscription_plans.form.new_line"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_1_name" with "Invoice line item 2"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_1_price" with "237"
  And I press translated "administration.subscription_plans.new.view.button_create"
  Then I click hidden link by url regex "/administration\/subscription_plans\/\d+\/edit$/"
  And the "subscription_plan_subscription_plan_lines_attributes_0_name" field should contain "Invoice line item 1"
  And the "subscription_plan_subscription_plan_lines_attributes_1_name" field should contain "Invoice line item 2"
  And the "subscription_plan_subscription_plan_lines_attributes_0_price" field should contain "124.00"
  And the "subscription_plan_subscription_plan_lines_attributes_1_price" field should contain "237.00"
  Then I should see "361.00"
  When I follow translated "administration.subscription_plans.form.delete_line"
  And I press translated "administration.subscription_plans.edit.view.button_update"
  Then I click hidden link by url regex "/administration\/subscription_plans\/\d+\/edit$/"
  And the "subscription_plan_subscription_plan_lines_attributes_0_name" field should contain "Invoice line item 2"

@_done @tested_elsewhere @tgn
Scenario: I can specify subscription name

@_done @tested_elsewhere @tgn
Scenario: I can select which roles can select this subscription type

@_done @tested_elsewhere @tgn
Scenario: I can specify billing cycle in weeks

Scenario: I can see billing (total cost for billing cycle -is calculated by the invoice items)

@_done @tested_elsewhere @tgn
Scenario: I can see list of invoice items

@_done @tested_elsewhere @tgn
Scenario: I can add invoice lines (text + price)

@_done @tested_elsewhere @tgn
Scenario: I can remove invoice lines

@_done @tested_elsewhere @tgn
Scenario: I can select a currency (for all items)

@_done @tested_elsewhere @tgn
Scenario: I can specify free period

@_done @tested_elsewhere @tgn
Scenario: I can select whether this subscription type should be active or not (displayed on singup page and in profile)

@_done @tested_elsewhere @tgn
Scenario: I can select whether this subscription can be upgraded or not (checkbox)

@_done @tested_elsewhere @tgn
Scenario: I can select whether this subscription can be downgraded or not (checkbox)

@_done @tested_elsewhere @tgn
Scenario: I can specify lockup period in weeks ( # of weeks before the billing cycle ends before the subscription can't be downgraded)

@_done @tested_elsewhere @tgn
Scenario: I can select which features will be enabled in this subscription (Team Buyer, Big Buyer, Deal Maker)

@_done @tested_elsewhere @tgn
Scenario: I can specify whether subscription will be automatically prolonging (checkbox)

@_done @tested_elsewhere @tgn
Scenario: I can specify billing date (+/- number of weeks from subscription end date)

@_done @_tested @tgn
Scenario: I can customize invoice email for this subscription
  Given subscription plan exists with attributes "name: SubscrTest"
  When I click hidden link by url regex "/administration\/subscription_plans$/"
  And I click hidden link by url regex "/administration\/subscription_plans\/\d+\/edit$/"
  Then I follow translated "administration.subscription_plans.edit.view.edit_email_template"
  And I fill in "email_template_subject" with "Invoice customised"
  And I press translated "administration.email_templates.edit.view.button_update"
  And I should be on administration edit subscription plan named SubscrTest

@_done @tested_elsewhere @tgn
Scenario: I can enable and disable selected subscriptions

@_done @_tested @tgn
Scenario: When I choose member role than I cannot choose supplier and vice versa
  When I follow translated "administration.subscription_plans.index.view.new_subscription_plan"
  And I select "Supplier" from "subscription_plan_assigned_roles"
  And I select "Member" from "subscription_plan_assigned_roles"
  And I press translated "administration.subscription_plans.new.view.button_create"
  Then I should see translated "models.subscription_plan_incorrect_roles_set"

@_done @non_testable @tgn
Scenario: When I choose member than additional features like big buyer and others are not available