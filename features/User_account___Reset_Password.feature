@user_accounts @m1
Feature: User account - Reset Password
 In order to sign in even if user forgot their password
 A user
 Should be able to reset it

 Scenario: User is not signed up
   Given no user exists with an email of "email@person.com"
   When I request password reset link to be sent to "email@person.com"
   Then I should see "No user was found"

 Scenario: User is signed up and requests password reset
   Given I am signed up and confirmed as "email@person.com/password"
   When I request password reset link to be sent to "email@person.com"
   Then I should see "Instructions to reset your password"
   And a password reset message should be sent to "email@person.com"

 Scenario: User is signed up updated his password and types wrong confirmation
   Given I am signed up and confirmed as "email@person.com/password"
   When I follow the password reset link sent to "email@person.com"
   And I update my password with "newpassword/wrongconfirmation"
   Then I should see error messages
   And I should be signed out

 Scenario: User is signed up and follow reset link twice
   Given I am signed up and confirmed as "email@person.com/password"
   When I follow reset link after I complete reset password using link sent to "email@person.com"
   Then I should see "we could not locate your account"

 Scenario: User is signed up and confirmed and updates his password
   Given I am signed up and confirmed as "email@person.com/password"
   When I follow the password reset link sent to "email@person.com"
   And I update my password with "newpassword/newpassword"
   Then I should be signed in
   When I sign out
   Then I should be signed out
   And I sign in as "email@person.com/newpassword"
   Then I should be signed in

 Scenario: User is signed up and not confirmed and updates his password
   Given I signed up with "email@person.com/password"
   When I request password reset link to be sent to "email@person.com"
   Then I should see "Your account is not confirmed"

@1
Scenario: I can request new reset password link, but the old one will be inactive