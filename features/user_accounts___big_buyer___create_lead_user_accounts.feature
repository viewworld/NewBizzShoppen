@user_accounts @$_big_buyer @m2
Feature: User Accounts - Big Buyer - Create lead user accounts
Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role customer
  And User customer@person.com with role customer is big buyer
  Then I sign in as customer@person.com with password supersecret
  Then I go to customers subaccounts

@tgn @_done @_tested
Scenario: I can create a lead user account
  Then I follow translated "customer.subaccounts.index.view.new_lead_user"
  And I fill in "user_lead_user_first_name" with "Mark"
  And I fill in "user_lead_user_last_name" with "Driscoll"
  And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_user_screen_name" with "ML Driscoll"
  And I fill in "user_lead_user_password" with "secret"
  And I fill in "user_lead_user_password_confirmation" with "secret"
  And I press translated "customer.subaccounts.new.view.button_create"
  Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"

@tgn @_done @_tested
Scenario: Account have to be activated through activation email
  Then I follow translated "customer.subaccounts.index.view.new_lead_user"
  And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_user_screen_name" with "ML Driscoll"
  And I fill in "user_lead_user_password" with "secret"
  And I fill in "user_lead_user_password_confirmation" with "secret"
  And I press translated "customer.subaccounts.new.view.button_create"
  Then user driscoll@person.noserver.com with role lead_user should not be confirmed
  And a confirmation message should be sent to driscoll@person.noserver.com
  And a confirmation message to driscoll@person.noserver.com should include confirmation link
  Then confirmation link should confirm account for driscoll@person.noserver.com
  And I should see translated "devise.confirmations.confirmed"
