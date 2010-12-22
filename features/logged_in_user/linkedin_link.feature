@linkedin_connection @m4 @tgn
Feature: LinkedIn link

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
  And I am on the homepage
  And I make sure current locale is English
  Then I sign in as bob@person.com with password supersecret
  And I go to my profile

@tbd @noguess
Scenario: I can store my linkedIn profile link within my user information
  When I fill in "user_agent_linkedin_url" with "http://www.linkedin.com/myfakelinkedinprofile"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "my_profile.update.controller.successful_update_notice"
