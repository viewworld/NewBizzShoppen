@user_accounts @m1
Feature: User accounts - password change

Scenario: I can change my password fro the account password change page

Scenario: User can change the password only with a valid password
   Given I am signed up and confirmed as "bob@selleo.com/password"
   And I sign in as "bob@selleo.com/password"
   And I am on my profile page
   When I follow "Change password"
   And I fill in "Password" with "newpassword"
   And I press "Change password"
   Then I should see "Change password"
   And I should see error messages
   