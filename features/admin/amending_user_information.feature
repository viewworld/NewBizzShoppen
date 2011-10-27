@user_accounts @$_admin @m1
Feature: Amending user information

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I have user with email aaaaaagent1@person.com and role agent
  And I go to administration users

 @_tested @_done
 Scenario: I can edit user info (no password reset!)
   Given I follow translated "administration.users.index.view.email"
   And I follow "Edit"
   Then I fill in "user_agent_phone" with "0000000000"
   And I fill in "user_agent_first_name" with "Confucian"
   And I fill in "user_agent_last_name" with "Kyle"
   And I press translated "administration.users.edit.view.button_update_user"
   Then I should see translated "administration.users.index.view.title"
   Then I should see "Confucian"