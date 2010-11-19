@user_accounts @$_admin @m1
Feature: User Account Admin - Create account

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret

@_tested
Scenario: I can create a user account by seleceting its type and filling in the required fields and I can set the payout rate if different than default from system settings
  Given I select "agent" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I fill in "user_agent_first_name" with "Alex"
  And I fill in "user_agent_last_name" with "Nova"
  And I fill in "user_agent_phone" with "0297272341235"
  And I fill in "user_agent_email" with "alex.nova@person.com"
  And I fill in "user_agent_screen_name" with "Alex N"
  And I fill in "user_agent_street" with "Typical 23"
  And I fill in "user_agent_city" with "Paris"
  And I fill in "user_agent_zip_code" with "22-232"
  And I fill in "user_agent_county" with "Orange"
  And I fill in "user_agent_payout" with "2.0"
  And I fill in "user_agent_password" with "secret"
  And I fill in "user_agent_password_confirmation" with "secret"
  And I select "Denmark" from "user_agent_country"
  And I check "user_agent_newsletter_on"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.create.flash.user_creation_successful"