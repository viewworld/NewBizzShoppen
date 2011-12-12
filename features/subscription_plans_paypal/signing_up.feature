@m24 @subscriptions
Feature: Signing up with PayPal

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I make sure Paypal subscriptions are enabled

  @_done @_tested
  Scenario: When must enter billing information at start is enabled then I must confirm recurring payment in Paypal as part of signup
    Given setting for "email_verification_for_suppliers" is set to "0"
    And there are no subscription plans
    And there is subscription plan named "Supplier Paypal" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0,use_paypal:1" and price "200"
    When I go to supplier sign up
    And I fill in the following:
      | user_supplier_first_name            | Bob             |
      | user_supplier_last_name             | Taker           |
      | user_supplier_company_name          | LeadsInt Ltd    |
      | user_supplier_phone                 | 48928217272     |
      | user_supplier_screen_name           | Bob T           |
      | user_supplier_email                 | kastomer@nbs.fake |
      | user_supplier_password              | secret          |
      | user_supplier_password_confirmation | secret          |
      | user_supplier_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_supplier_address_attributes_address_line_2        | London          |
      | user_supplier_address_attributes_zip_code              | 43-270          |
      | user_supplier_address_attributes_address_line_3        | Wesley          |
    And I select "Denmark" from "user_supplier_address_attributes_country_id"
    And I choose "user_supplier_subscription_plan_id"
    And I check "user_supplier_agreement_read"
    And I choose "user_supplier_subscription_plan_id"
    And I press translated "supplier_accounts.new.view.button_create_account"
    And I sign in as kastomer@nbs.fake with password secret
    Then I should see translated "unconfirmed_paypal_subscriptions.show.view.message" with options "subscription:Supplier Paypal"

  Scenario: When must enter billing information at start is enabled then free period is handled by Paypal

  Scenario: When must enter billing information at end of free period is enabled for my subscription I should recevive an email to confirm recurring payent in Paypal before free period ends

  Scenario: If I do not confirm recurring payments in Paypal the subscrption should behave as it has been canceled (issue unpaid invoice and send email, sing in restrictions)