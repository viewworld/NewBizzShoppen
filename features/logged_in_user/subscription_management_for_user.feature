@m21 @requested @subscriptions
Feature: Subscription management for user

  Background:
    When I am signed up and confirmed as user with email supp@nbs.com and password secret and role supplier
    And I am on the home page
    And I sign in as supp@nbs.com with password secret

  @_done @_tested
  Scenario: I can see my subscription type in my profile
    When I follow translated "layout.my_profile_link"
    Then I should see translated "subscriptions.current_subscription" within "#current_subscription"
    And I should see translated "subscriptions.listing.free" within "#current_subscription"

  Scenario: I can change my subscription type

  Scenario: I can cancel my subscription at any time from my profile

  Scenario: When I change my subscription to more expensive one the change will be immediate

  Scenario: When I change my subscription to less expensive then the change will apply on next billing cycle

  Scenario: When I upgrade my subscription to more expensive in the middle of billing cycle then I will pay only for the used part of cycle

  Scenario: I can't downgrade my subscription when it entered into the lockup period

  Scenario: I cannot manage team buyers if my subscription has team buyers disabled

  Scenario: I become small buyer if my subscription has big buyer disabled

  Scenario: I loose deal maker role if my subscription has deal maker disabled

  Scenario: I can manage team buyers if my subscription has team buyers enabled

  Scenario: I become big buyer if my subscription has big buyer enabled

  Scenario: I become deal maker if my subscription has deal maker enabled

  Scenario: When I login and my subscription is expired and not auto prolonged then I am switched to free subscription

  Scenario: I can use free period only once, when registered with other email but the same CVR number then I should not be able to use free period with warning: 'Sorry you company has already used its free subscription period'
