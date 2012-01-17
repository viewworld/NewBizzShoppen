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
  Given there is a seller with attributes "company_name:ADannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123,default:1" for country "United Kingdom"
  Given there is a seller with attributes "company_name:BDannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123,default:1" for country "Denmark"
  When I follow translated "administration.subscription_plans.index.view.new_subscription_plan"
  And I fill in "subscription_plan_name" with "Test subscription 1"
  And I fill in "subscription_plan_billing_cycle" with "12"
  And I fill in "subscription_plan_subscription_period" with "12"
  And I fill in "subscription_plan_lockup_period" with "1"
  And I fill in "subscription_plan_billing_period" with "1"
  And I fill in "subscription_plan_free_period" with "2"
  And I select "EUR" from "subscription_plan_currency_id"
  And I select "ADannyTheSeller" from "subscription_plan_seller_id"
  And I select "Supplier" from "subscription_plan_assigned_roles"
  And I check "subscription_plan_is_active"
  And I check "subscription_plan_can_be_upgraded"
  And I check "subscription_plan_can_be_downgraded"
  And I check "subscription_plan_team_buyers"
  And I check "subscription_plan_big_buyer"
  And I check "subscription_plan_deal_maker"
  When I follow translated "administration.subscription_plans.form.new_line"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_0_name" with "Invoice line item 1"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_0_price" with "124"
  When I follow translated "administration.subscription_plans.form.new_line"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_1_name" with "Invoice line item 2"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_1_price" with "237"
  And I press translated "administration.subscription_plans.new.view.button_create"
  And I fill in "search_with_keyword" with "Test subscription 1"
  And I press translated "administration.subscription_plans.index.view.search_button"
  Then I click hidden link by url regex "/administration\/subscription_plans\/\d+\/edit$/"
  And the "subscription_plan_subscription_plan_lines_attributes_0_name" field should contain "Invoice line item 1"
  And the "subscription_plan_subscription_plan_lines_attributes_1_name" field should contain "Invoice line item 2"
  And the "subscription_plan_subscription_plan_lines_attributes_0_price" field should contain "124.00"
  And the "subscription_plan_subscription_plan_lines_attributes_1_price" field should contain "237.00"
  Then I should see "361.00"
  When I follow translated "administration.subscription_plans.form.delete_line"
  And I press translated "administration.subscription_plans.edit.view.button_update"
  And I fill in "search_with_keyword" with "Test subscription 1"
  And I press translated "administration.subscription_plans.index.view.search_button"
  Then I click hidden link by url regex "/administration\/subscription_plans\/\d+\/edit$/"
  And the "subscription_plan_subscription_plan_lines_attributes_0_name" field should contain "Invoice line item 2"

@_done @tested_elsewhere @tgn
Scenario: I can specify subscription name

@_done @tested_elsewhere @tgn
Scenario: I can select which roles can select this subscription type

@_done @tested_elsewhere @tgn
Scenario: I can specify billing cycle in weeks

@_done @tested_elsewhere @tgn
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
Scenario: I can specify lockup period in weeks ( number of weeks before the billing cycle ends before the subscription can't be downgraded)

@_done @tested_elsewhere @tgn
Scenario: I can select which features will be enabled in this subscription (Team Buyer, Big Buyer, Deal Maker)

@_done @tested_elsewhere @tgn
Scenario: Subscriptions will automatically prolong for the next billing cycle

@_done @tested_elsewhere @tgn
Scenario: I can specify billing date (+/- number of weeks from subscription end date)

@_done @_tested @tgn
Scenario: I can customize invoice email for this subscription
  Given subscription plan exists with attributes "name: SubscrTest"
  When I click hidden link by url regex "/administration\/subscription_plans$/"
  And I fill in "search_with_keyword" with "SubscrTest"
  And I press translated "administration.subscription_plans.index.view.search_button"
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

@_done @tested_elsewhere @tgn
Scenario: I can set seller for the subscription plan

#8338
@m22 @requested @selenium @_done @_tested @tgn
Scenario: I can enter a "Subscription text" as rich text
  Given there is a seller with attributes "company_name:ADannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123,default:1" for country "United Kingdom"
  Given there is a seller with attributes "company_name:BDannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123,default:1" for country "Denmark"
  When I follow translated "administration.subscription_plans.index.view.new_subscription_plan"
  And I fill in "subscription_plan_name" with "Test subscription 1"
  And I fill in "subscription_plan_billing_cycle" with "12"
  And I fill in "subscription_plan_subscription_period" with "12"
  And I fill in "subscription_plan_lockup_period" with "1"
  And I fill in "subscription_plan_billing_period" with "1"
  And I fill in "subscription_plan_free_period" with "2"
  And I fill in "subscription_plan_subscription_text_editor" ckeditor with "Sample Subscription Text"
  And I select "EUR" from "subscription_plan_currency_id"
  And I select "ADannyTheSeller" from "subscription_plan_seller_id"
  And I select "Category supplier" from "subscription_plan_assigned_roles"
  And I check "subscription_plan_is_active"
  And I check "subscription_plan_can_be_upgraded"
  And I check "subscription_plan_can_be_downgraded"
  And I check "subscription_plan_team_buyers"
  And I check "subscription_plan_big_buyer"
  And I check "subscription_plan_deal_maker"
  When I follow translated "administration.subscription_plans.form.new_line"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_0_name" with "Invoice line item 1"
  Then I fill in "subscription_plan_subscription_plan_lines_attributes_0_price" with "124"
  And I press translated "administration.subscription_plans.new.view.button_create"
  When I sign out
  And I am on the supplier sign up page
  Then I should see "Sample Subscription Text"

#8338
@m22 @requested @_done @non_testable @tgn
Scenario: I can upload images for "Subscription text"

@backlog @requested
Scenario: I should be able to define subscription period

@backlog @requested
Scenario: I should be able to define billing period (which indicates the smaller periods of the parts of whole payment)

@backlog @requested
Scenario: I can check "Use PayPal to handle subscription"

@backlog @requested
Scenario: I can check "Must enter billing information (paypal) at start"

@backlog @requested
Scenario: I can check "Must enter billing information (paypal) at end of free period"

@backlog @requested
Scenario: I can check "Automatic downgrading"

@backlog @requested
Scenario: I can select subscription name from dropdown to which it should be downgraded by default (list should include payable subscriptions without paypal) if payment fails

@backlog @requested
Scenario: I should not be able to check "Automatic downgrading" if subscription is not handled by Paypal

@backlog @requested
Scenario: I can enter number of Billing retries before subscription will be downgraded

@backlog @requested
Scenario: I can check "Auto generate and send invoice for successful Paypal billing"

@backlog @requested
Scenario: I can set "Number of free deals in free period" for suppliers

@backlog @requested
Scenario: I should not be able to set "Number of free deals in free period" for other role than suppliers