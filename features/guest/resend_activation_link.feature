@user_accounts @m1
Feature: Resend activation link

Background:  Sign up user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"

@_tested @_done
Scenario: I can resend activation email to my email address
  Given setting for "email_verification_for_suppliers" is set to "1"
  Given I am signed up with email email@person.com and password secret and role supplier
  Then I go to resend confirmation instructions
  And I fill in "user_email" with "email@person.com"
  Then I press translated "devise.confirmations.resend_confirmation_link"
  And I should see translated "devise.confirmations.send_instructions"

@_tested @_done
Scenario: I can't resend activation email to my email address once the account was activated
  Given I am signed up and confirmed as user with email email@person.com and password secret and role supplier
  Then I go to resend confirmation instructions
  And I fill in "user_email" with "email@person.com"
  Then I press translated "devise.confirmations.resend_confirmation_link"
  And I should see translated "activerecord.errors.models.user.attributes.email.already_confirmed"

@ao @m7 @_requested @_done @_tested
Scenario: I can see blurb text on resend confirmation page
  When I go to resend confirmation instructions
  Then I should see "Blurb resend confirmation"
