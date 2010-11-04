@user_accounts @m1
Feature: User account - Reset Password
 In order to sign in even if user forgot their password
 A user
 Should be able to reset it

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English

@_tested
 Scenario: User is not signed up
   Given no user exists with an email of email@person.com and role agent
   When I request password reset link to be sent to email@person.com
   Then I should see translated "activerecord.errors.models.user.attributes.email.not_found"

@_tested
 Scenario: User is signed up and requests password reset
   Given I am signed up and confirmed as user with email email@person.com and password secret and role customer
   When I request password reset link to be sent to email@person.com
   Then I should see translated "devise.passwords.send_instructions"
   And a password reset message should be sent to email@person.com

@_tested
 Scenario: User is signed up updated his password and types wrong confirmation
   Given I am signed up and confirmed as user with email email@person.com and password secret and role customer
  When I follow the password reset link sent to email@person.com with role customer
  And I fill in "user_password" with "new_password"
  And I fill in "user_password_confirmation" with "wrongpassword"
  And I press translated "devise.passwords.button_update"
  Then I should see translated "activerecord.errors.models.user/agent.attributes.password.confirmation"
  And I should be signed out

@_tested
 Scenario: User is signed up and follow reset link twice
   Given I am signed up and confirmed as user with email email@person.com and password secret and role customer
   When I follow reset link after I complete reset password using link sent to email@person.com and role customer
   And I press translated "devise.passwords.button_update"
   Then I should see translated "activerecord.errors.models.user/abstract.attributes.reset_password_token.invalid"

@_tested
 Scenario: User is signed up and confirmed and updates his password
   Given I am signed up and confirmed as user with email email@person.com and password secret and role agent
   When I follow the password reset link sent to email@person.com with role agent
   And I fill in "user_password" with "newpassword"
   And I fill in "user_password_confirmation" with "newpassword"
   And I press translated "devise.passwords.button_update"
   Then I should be signed in
   When I sign out
   Then I should see translated "devise.sessions.signed_out"
   And I sign in as email@person.com with password newpassword
   Then I should be signed in