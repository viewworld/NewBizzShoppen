@m21 @requested @subscriptions @ao
Feature: Subscription management for user

  Background:
    When I am signed up and confirmed as user with email supp@nbs.com and password secret and role supplier
    And user "supp@nbs.com" with role "supplier" has attributes "vat_number:12345"
    And I am on the home page
    And I sign in as supp@nbs.com with password secret

  @_done @_tested
  Scenario: I can see my subscription type in my profile
    When I follow translated "layout.my_profile_link"
    Then I should see translated "subscriptions.current_subscription" within "#current_subscription"
    And I should see translated "subscriptions.listing.free" within "#current_subscription"

  @selenium @_done @_tested
  Scenario: I can change my subscription type
    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then I should see translated "subscriptions.current_subscription" within "#current_subscription"
    And I should see "Basic for supplier" within "#current_subscription"
    And I should see translated "subscriptions.available_subscriptions"
    And I should see translated "subscriptions.will_prolong_on" with options "prolong_date:{Date.today+4.weeks}"

  @selenium @_done @_tested @_deprecated
  Scenario: I can cancel my subscription any time after the change of subscription plan
#    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "100"
#    And I follow translated "layout.my_profile_link"
#    And I confirm a js popup on the next step
#    And I follow translated "subscriptions.listing.upgrade"
#    And I follow translated "layout.my_profile_link"
#    And I confirm a js popup on the next step
#    And I follow translated "subscriptions.listing.cancel"
#    And I should see "Basic for supplier" within "#current_subscription"

  @selenium @_done @_tested
  Scenario: When I change my subscription to more expensive one the change will be immediate
    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I should see "Basic for supplier" within "#current_subscription"

  @selenium @_done @_tested
  Scenario: When I change my subscription to less expensive then the change will apply on next billing cycle
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "200"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.downgrade"
    Then I should see translated "subscriptions.next_subscription_plan" with options "next_plan_name:Basic for supplier,next_plan_active_from:{Date.today+4.weeks}"
    And I should see translated "subscriptions.can_be_canceled_at" with options "cancel_date:{Date.today+4.weeks}"
    And I should see translated "subscriptions.cant_be_upgraded_nor_downgraded"

  @selenium @_done @_tested
  Scenario: When I upgrade my subscription to more expensive in the middle of billing cycle then I will pay only for the used part of cycle
    And there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "200"
    And the date is "13" days from now
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    When I sign out
    And the date is "14" days from now
    And I sign in as admin@nbs.com with password secret
    And I am on administration upcoming invoices
    And I open page in browser
    Then I should see "46.43" within "tbody#invoices_list tr:nth-of-type(1)"

  @selenium @_done @_tested
  Scenario: I can't downgrade my subscription when it entered into the lockup period
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0" and price "200"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    And there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0" and price "100"
    When the date is "8" days from now
    And active subscription for user "supp@nbs.com" is in lockup period
    And I follow translated "layout.my_profile_link"
    And I should see translated "subscriptions.lockup_period_notification"

  @selenium @_done @_tested
  Scenario: I cannot manage team buyers if my subscription has team buyers disabled
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0,team_buyers:1" and price "200"
    Then I should not see translated "layout.main_menu.supplier.subaccounts" within "#user_menu"
    When I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    Then I should see translated "layout.main_menu.supplier.subaccounts" within "#user_menu"
    When I follow translated "layout.main_menu.supplier.subaccounts"
    Then I should see translated "supplier.subaccounts.index.view.title"

  @selenium @_done @_tested
  Scenario: I become small buyer if my subscription has big buyer disabled
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0,big_buyer:1" and price "200"
    When I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then user "supp@nbs.com" should be big buyer
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.cancel"
    When the date is "29" days from now
    When I follow translated "layout.my_profile_link"
    Then user "supp@nbs.com" should not be big buyer

  @selenium @_done @_tested
  Scenario: I loose deal maker role if my subscription has deal maker disabled
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0,deal_maker:1" and price "200"
    When I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then user "supp@nbs.com" should be deal maker
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.cancel"
    When the date is "29" days from now
    When I follow translated "layout.my_profile_link"
    Then I should see "Free supplier subscription" within "#current_subscription"
    Then user "supp@nbs.com" should not be deal maker

  @selenium @_done @_tested
  Scenario: I can manage team buyers if my subscription has team buyers enabled
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0,team_buyers:1" and price "200"
    Then I should not see translated "layout.main_menu.supplier.subaccounts" within "#user_menu"

  @selenium @_done @_tested
  Scenario: I become big buyer if my subscription has big buyer enabled
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0,big_buyer:1" and price "200"
    When I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then user "supp@nbs.com" should be big buyer

  @selenium @_done @_tested
  Scenario: I become deal maker if my subscription has deal maker enabled
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0,deal_maker:1" and price "200"
    When I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then user "supp@nbs.com" should be deal maker

  @selenium @_done @_tested
  Scenario: When I login and my subscription is expired it will automatically prolong
    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    Then I should see "Basic for supplier" within "#current_subscription"
    And I should see translated "subscriptions.will_prolong_on" with options "prolong_date:{Date.today+15.days}"
    When the date is "15" days from now
    And I follow translated "layout.my_profile_link"
    Then I should see "Basic for supplier" within "#current_subscription"
    And I should see translated "subscriptions.will_prolong_on" with options "prolong_date:{Date.today+15.days}"

  @added @selenium @_done @_tested
  Scenario: When I cancel my subscription during lockup period then the current subscirption should prolong one more time and then become free
    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    And the date is "8" days from now
    And active subscription for user "supp@nbs.com" is in lockup period
    And I follow translated "layout.my_profile_link"
    Then I should see translated "subscriptions.lockup_period_notification"
    When I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.cancel"
    Then I should see translated "subscriptions.next_subscription_plan" with options "next_plan_name:Basic for supplier,next_plan_active_from:{Date.today+6}"

  @selenium @_done @_tested
  Scenario: I can use free period only once, when registered with other email but the same CVR number then I should not be able to use free period with warning: 'Sorry you company has already used its free subscription period'
    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:1" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then I should see translated "subscriptions.free_period_notification" with options "free_period_date:{Date.today+7.days}"
    When there is subscription plan named "Medium for supplier" for role "supplier" with attributes "subscription_period:2,lockup_period:1,billing_period:0,free_period:1" and price "200"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    Then I should not see translated "subscriptions.free_period_notification" with options "free_period_date:{Date.today+7.days}"

  @m22 @_done @_tested_elsewhere @requested @tgn
  Scenario: When I cancel before lockup the subscription should be active until the end of billing cycle and prolong as free

  @m22 @_done @_tested @tgn @requested
  Scenario: When I have free subscription and go to My deals then I should see warning 'You need to upgrade your subscription to be able to create deals'
    When I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see translated "supplier.deals.index.view.you_need_to_upgrade_subscription_warning"

  #8346
  @m22 @requested @credit_line @tgn @_done @_tested_elsewhere
  Scenario: When I upgrade my subscription a credit line is created for the remaining value of my previous subscription

  #8346
  @m22 @requested @credit_line @tgn @_done @_tested_elsewhere
  Scenario: When I upgrade my subscription and invoice is issued the creadit line value for my previous subscription should be subsctracted

  #8333
  @m22 @requested @selenium @_done @_tested
  Scenario: Billing date for subscription should be the day it started
    When there is subscription plan named "Basic for supplier" for role "supplier" with attributes "subscription_period:4,lockup_period:1,billing_period:0,free_period:0" and price "100"
    And I follow translated "layout.my_profile_link"
    And I confirm a js popup on the next step
    And I follow translated "subscriptions.listing.upgrade"
    And I follow translated "layout.my_profile_link"
    When I sign out
    And I sign in as admin@nbs.com with password secret
    And I am on administration upcoming invoices
    Then I should see "100.00" within "tbody#invoices_list tr:nth-of-type(1)"

  @backlog @requested
  Scenario: When I upgrade to subscription that is handled by Paypal and requires entering billing information then I am redirected to paypal

  @backlog @requested
  Scenario: When I upgrade to subscription that is handled by Paypal and requires entering billing information and I confirm my billing then I return to my profile

  @backlog @requested
  Scenario: When I upgrade to subscription that is handled by Paypal and requires entering billing information and I fail to confirm my billing then I return to my profile without subscription change

  @backlog @requested
  Scenario: When I upgrade from one payable subscription to other payable then my paypal profile is changed

  @backlog @requested
  Scenario: When I downgrade to subscription that is handled by Paypal and requires entering billing information then I am redirected to paypal

  @backlog @requested
  Scenario: When I downgrade to subscription that is handled by Paypal and requires entering billing information and I confirm my billing then I return to my profile

  @backlog @requested
  Scenario: When I downgrade to subscription that is handled by Paypal and requires entering billing information and I fail to confirm my billing then I return to my profile without subscription change

  @backlog @requested
  Scenario: When I downgrade from one payable subscription to other payable then my paypal profile is changed

  @backlog @requested
  Scenario: When I downgrade then my new paypal recurring profile for downgraded subscription will start at the new billing cycle

  @backlog @requested
  Scenario: When my subscription is auto prolonging then it is created in paypal without end date

  @backlog @requested
  Scenario: When my subscription is NOT auto prolonging then it is created in paypal with end date

  @backlog @requested
  Scenario: When my subscription is NOT auto prolonging and has lockup then (TODO: either paypal profile is generated without end date or penalty creates debt)

  @backlog @requested
  Scenario: When I cancel payable subscription that is both auto prolonging and handled by paypal then my paypal profile is cancelled at the end of that subscription

  @backlog @requested
  Scenario: When my subscription has free period then it is included into my paypal profile to delay payment

  @backlog @requested
  Scenario: I have to enter the billing information at the start of payable subscription

  @backlog @requested
  Scenario: I have to enter the billing information at the end of the free period of payable subscription

  @backlog @requested
  Scenario: When I don't provide my billing information I cannot get access to other feature of my account until I do that

  @backlog @requested
  Scenario: When I don't provide my billing information and payable subscription period ends then it is prolonged to the subscription that is defined by administrator

  @backlog @requested
  Scenario: When my payment failed then I am downgraded to the subscription that is defined by administrator

  @backlog @requested
  Scenario: When my payment failed it is retried according to the subscription properties

  @backlog @requested
  Scenario: When my payment failed and I am downgraded then the payment is generated in the form of a debt

  @backlog @requested
  Scenario: As supplier I can create as many deals as my subscription defines and only during my free period

  @backlog @requested
  Scenario: As supplier I cannot create new deals if I used my free deals limit or my free period expired