@user_accounts @$_call_centre @m4 @tgn
Feature: Agent accounts administration for call centre

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre agents

@_tested
Scenario: I can create call centre agent account
  When I follow translated "call_centre.call_centre_agents.index.view.new_agent"
  And I fill in "user_call_centre_agent_email" with "callcentreagent93@nbs.com"
  And I fill in "user_call_centre_agent_screen_name" with "Tymon Tymanski"
  And I fill in "user_call_centre_agent_password" with "secret"
  And I fill in "user_call_centre_agent_password_confirmation" with "secret"
  And I press translated "call_centre.call_centre_agents.new.view.button_create"
  Then I should see translated "call_centre.call_centre_agents.create.flash.call_centre_agent_creation_successful"

@_tested
Scenario: Account have to be activated by link in activation email sent to his email address
  When I follow translated "call_centre.call_centre_agents.index.view.new_agent"
  And I fill in "user_call_centre_agent_email" with "callcentreagent93@nbs.com"
  And I fill in "user_call_centre_agent_screen_name" with "Tymon Tymanski"
  And I fill in "user_call_centre_agent_password" with "secret"
  And I fill in "user_call_centre_agent_password_confirmation" with "secret"
  And I press translated "call_centre.call_centre_agents.new.view.button_create"
  Then I should see translated "call_centre.call_centre_agents.create.flash.call_centre_agent_creation_successful"
  And a confirmation message to callcentreagent93@nbs.com should include confirmation link