@user_accounts @$_admin @m1
Feature: Administrative account creation

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret


@_tested @_done
Scenario: I can create a user account by seleceting its type and filling in the required fields and I can set the payout rate if different than default from system settings
  When I go to administration users
  Given I select "Agent" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I fill in "user_agent_first_name" with "Alex"
  And I fill in "user_agent_last_name" with "Nova"
  And I fill in "user_agent_phone" with "0297272341235"
  And I fill in "user_agent_email" with "alex.nova@person.com"
  And I fill in "user_agent_address_attributes_address_line_1" with "Typical 23"
  And I fill in "user_agent_address_attributes_address_line_2" with "Paris"
  And I fill in "user_agent_address_attributes_zip_code" with "22-232"
  And I fill in "user_agent_address_attributes_address_line_3" with "Orange"
  And I fill in "user_agent_password" with "secret"
  And I fill in "user_agent_password_confirmation" with "secret"
  And I select "Denmark" from "user_agent_address_attributes_country_id"
  And I check "user_agent_newsletter_on"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.create.flash.user_creation_successful"

@m6 @tgn @_tested @_done
Scenario: When I log in I should be redirected to home tab
  Then I should be on the homepage