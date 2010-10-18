@user_accounts @m1
Feature: User Account - Profile edit

  Background:
   And I go to the homepage
   And I am logged in as "user@domain.dom/secret"
   And I go to edit profile page

 @1
 Scenario: I can edit my profile
   Then I should see "(leave blank if you don't want to change it)"
   Then I fill in "user[password]" with "super_secret_password"
   Then I fill in "user[password_confirmation]" with "super_secret_password"
   Then I press "Update"
   Then I follow "logout_link"
   Then I should see "Sign in"
   And I am logged in as "user@domain.dom/secret"
   And I should see "Signed in successfully."

Scenario: The screen name I enter have to be unique

 @0.5
 Scenario: I shouldn't be able to access other people profile

 Scenario: A user must be logged on to see their account information
   Given I am not sign in
   When I go to my profile page
   Then I should see "You must be logged in to access this page"

 Scenario: A user should be able to update their profile
   Given I am signed up and confirmed as "bob@selleo.com/password"
   When I sign in as "bob@selleo.com/password"
   Then I should see "Login successful"
   When I go to my profile page
   And I follow "Edit"
   And I fill in "Email" with "new-email@example.com"
   And I press "Submit"
   Then I should see "Successfully updated profile"

 Scenario: A user shouldn't be able to update their profile with bad data
   Given I am signed up and confirmed as "bob@selleo.com/password"
   When I sign in as "bob@selleo.com/password"
   Then I should see "Login successful"
   When I go to my profile page
   And I follow "Edit"
   And I fill in "Email" with "not-an-email"
   And I press "Submit"
   Then I should see "should look like an email address"
   And I should see "Edit Account"

 Scenario: A logged in user shouldn't be able to create a new account
   Given I am signed up and confirmed as "bob@selleo.com/password"
   When I sign in as "bob@selleo.com/password"
   Then I should see "Login successful"
   When I go to the sign up page
   Then I should see "must be logged out"

 