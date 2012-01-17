@m24 @subscriptions
Feature: Signing in

  Background:
    Given user with email "kastomer@nbs.fake" and password "secret" and role "supplier" exists with confirmed paypal subscription named "Paypal for supp" with attributes "subscription_period:3,billing_cycle:1"
    And active subscription for user "kastomer@nbs.fake" has been canceled in paypal
    And I am on the home page

  @_done @_tested
  Scenario: When user cancels recurring billing in Paypal he should be asked to reactivate recurring payments everytime he logs in
    When I sign in as kastomer@nbs.fake with password secret
    Then I should see "Update your billing information clicking" within "div.flash_alert"

  @_done @_tested_elsewhere
  Scenario: When user cancels recurring billing in Paypal and has unpaid invoices issued he should be asked to pay for them every time he logs in

  @_done @_tested_elsewhere
  Scenario: When user cancels recurring billing in Paypal and has unpaid invoices he should not be able to use the application until he pays