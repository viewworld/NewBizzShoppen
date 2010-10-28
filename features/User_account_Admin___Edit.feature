@user_accounts @$_admin @m1
Feature: User account Admin - Edit

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I have user with email agent1@person.com and role agent


 Scenario: I can edit user info (no password reset!)
   Given I follow "Edit" within table row with value "agent1@person.com"
   Then I fill in "user_agent_phone" with "0000000000"
   And I fill in "user_agent_first_name" with "Selina"
   And I fill in "user_agent_last_name" with "Kyle"
   And I press translated "administration.users.edit.view.button_update_user"
   Then I should see translated "administration.users.index.view.title"
   Then I should see "0000000000"
   Then I should see "Selina"