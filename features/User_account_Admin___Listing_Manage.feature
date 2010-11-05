@user_accounts @$_call_centre @m1
Feature: User account Admin - Listing Manage

 Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  And I have user with email agent.jim.connor@paerson22.com and role agent
  And I have user with email agent.tom.blank@paerson22.com and role agent
  And I have user with email aaaaaaaagent.tom.blank@paerson22.com and role agent
  And I have user with email zzzenon.tom.blank@paerson22.com and role agent
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret


 Scenario: I can browse users with pagination
   When I go to user administration page
   Then I should see "Listing users"
   Then I follow "2"
   Then I should see "Listing users"
   Then I follow "1"

@_tested
 Scenario: I can sort users
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "aaaaaaaagent.tom.blank@paerson22.com" in the css path "tr:nth-child(2) td:nth-child(6)"
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "zzzenon.tom.blank@paerson22.com" in the css path "tr:nth-child(2) td:nth-child(6)"

 @_tested
 Scenario: I can filter users [...]
   Given I should see "agent.jim.connor@paerson22.com"
   And I should see "agent.tom.blank@paerson22.com"
   Then I fill in "search_with_keyword" with "agent.jim.connor@paerson22.com"
   And I press translated "administration.users.index.view.search_button"
   Then I should see "agent.jim.connor@paerson22.com"
   And I should not see "agent.tom.blank@paerson22.com"

 @_tested
 Scenario: I can reset password for a user
   When I go to administration users
   And I follow translated "administration.users.index.view.edit"
   And I follow translated "administration.users.edit.view.reset_password_link"
   Then I should see translated "administration.password.destroy.flash.password_reset_successful"
   Then a password reset message should be sent to customer_agnes@domain.dom

@_tested
 Scenario: I can set the user to blocked and to unblocked
   When I go to administration users
   And I follow translated "administration.users.index.view.lock"
   Then I follow translated "administration.users.index.view.unlock"

# what should happen to all objects that he is connected too?
# is there any case when we cant delete a user?
@_tested
 Scenario: I can delete user unless he\she doesn't have related objects (e.g. leads, purchases...)
   Given User aaaaaaaagent.tom.blank@paerson22.com with role agent has leads
   When I go to administration users
   And I follow translated "administration.users.index.view.email"
   Then I follow translated "administration.users.index.view.delete"
   And I should see translated "administration.users.destroy.flash.user_deletion_failure"
   Given I follow translated "administration.users.index.view.email"
   And I follow translated "administration.users.index.view.email"
   And I follow translated "administration.users.index.view.delete"
   Then I should see translated "administration.users.destroy.flash.user_deletion_successful"

 
 Scenario: Blocked or deleted user can not ask for password in forgot password

 @_tested
 Scenario: Deleted user shouldn't be able to login
   Given I am not sign in
   And no user exists with an email of deleted_person@domain.dom and role agent
   When I go to the homepage
   And I sign in as deleted_person@domain.dom with password secret
   Then I should see translated "devise.failure.invalid"

@m3
Scenario: I can invoice an account

Scenario: I can toggle select/deselect accounts on active page
Scenario: I can perform a bulk block action
Scenario: I can perform a bulk invoice action