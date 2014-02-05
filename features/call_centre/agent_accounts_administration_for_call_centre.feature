# @user_accounts @$_call_centre @m4 @tgn @faircalls @_deprecated2014
# Feature: Agent accounts administration for call centre

#   Background:  Sign in user and set locale
#     Given I am on the homepage
#     And I make sure current locale is "en"
#     And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
#     And I visit domain http://faircalls.eu
#     Then I sign in as call_centre@person.com with password supersecret
#     And I go to call centre agents

#   @_tested @_done
#   Scenario: I can create call centre agent account
#     When I follow translated "call_centre.call_centre_agents.index.view.new_agent"
#     And I fill in "user_call_centre_agent_first_name" with "Tymon"
#     And I fill in "user_call_centre_agent_last_name" with "Tymanski"
#     And I fill in "user_call_centre_agent_phone" with "1234234342"
#     And I fill in "user_call_centre_agent_email" with "callcentreagent93@nbs.com"
#     And I fill in "user_call_centre_agent_address_attributes_address_line_1" with "Derhfjf Blv 32/21"
#     And I fill in "user_call_centre_agent_address_attributes_address_line_2" with "Hamburg"
#     And I fill in "user_call_centre_agent_address_attributes_zip_code" with "234213"
#     And I fill in "user_call_centre_agent_address_attributes_address_line_3" with "Fejdjd"
#     And I select "Denmark" from "user_call_centre_agent_address_attributes_country_id"
#     And I fill in "user_call_centre_agent_password" with "secret"
#     And I fill in "user_call_centre_agent_password_confirmation" with "secret"
#     And I press translated "call_centre.call_centre_agents.new.view.button_create"
#     Then I should see translated "call_centre.call_centre_agents.create.flash.call_centre_agent_creation_successful"

#   @_tested @_done
#   Scenario: Account have to be activated by link in activation email sent to his email address
#     When I follow translated "call_centre.call_centre_agents.index.view.new_agent"
#     And I fill in "user_call_centre_agent_first_name" with "Tymon"
#     And I fill in "user_call_centre_agent_last_name" with "Tymanski"
#     And I fill in "user_call_centre_agent_phone" with "1234234342"
#     And I fill in "user_call_centre_agent_email" with "callcentreagent93@nbs.com"
#     And I fill in "user_call_centre_agent_address_attributes_address_line_1" with "Derhfjf Blv 32/21"
#     And I fill in "user_call_centre_agent_address_attributes_address_line_2" with "Hamburg"
#     And I fill in "user_call_centre_agent_address_attributes_zip_code" with "234213"
#     And I fill in "user_call_centre_agent_address_attributes_address_line_3" with "Fejdjd"
#     And I select "Denmark" from "user_call_centre_agent_address_attributes_country_id"
#     And I fill in "user_call_centre_agent_password" with "secret"
#     And I fill in "user_call_centre_agent_password_confirmation" with "secret"
#     And I press translated "call_centre.call_centre_agents.new.view.button_create"
#     Then I should see translated "call_centre.call_centre_agents.create.flash.call_centre_agent_creation_successful"
#     And a confirmation message to callcentreagent93@nbs.com should include confirmation link

#   @added @m5 @_tested @_done
#   Scenario: Agents of given call centre inherit its certification level
#     Given I have user with email call_centre777@nbs.com and role call_centre
#     Given I have user with email call_centre_agent_111@nbs.com and role call_centre_agent
#     And an user with role call_centre_agent and email call_centre_agent_111@nbs.com belongs to call centre call_centre777@nbs.com
#     And I have user with email call_centre_agent_222@nbs.com and role call_centre_agent
#     And an user with role call_centre_agent and email call_centre_agent_222@nbs.com belongs to call centre call_centre777@nbs.com
#     Given user "call_centre777@nbs.com" with role "call_centre" has certification level set to 2
#     Then user "call_centre_agent_111@nbs.com" with role "call_centre_agent" has certification level 2
#     Then user "call_centre_agent_222@nbs.com" with role "call_centre_agent" has certification level 2
