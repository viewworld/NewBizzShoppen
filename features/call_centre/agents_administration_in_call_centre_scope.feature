@user_accounts @$_call_centre @m4 @tgn @faircalls
Feature: Agents administration in call centre scope

Background:  Sign in user and set locale
  And I am on the homepage
  Given I visit domain http://faircalls.eu
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre agents

@_tested @_done
Scenario: I can browse list of my agents without pagination
  Given an user with role call_centre_agent and email ccagent01@person.com belongs to call centre call_centre@person.com
  And an user with role call_centre_agent and email ccagent02@person.com belongs to call centre call_centre@person.com
  And an user with role call_centre_agent and email ccagent03@person.com belongs to call centre call_centre@person.com
  Given pagination per page size in model User is set to 2
  And I go to call centre agents
  Then I should not see link with label "2"

@_tested @_done
Scenario: I can sort by Name, Last Name, created, volume sold, revenue, mobile number, num. of leads purchased last 30days, num. of leads purchased last 12months, good, bad, not rated, Rating %, certification lvl.
  Given user "call_centre@person.com" with role "call_centre" has attributes "certification_level:11"
  Given an user with role call_centre_agent and email ccagent01@person.com belongs to call centre call_centre@person.com
  And an user with role call_centre_agent and email ccagent02@person.com belongs to call centre call_centre@person.com
  And I have user with email bob@person.com and role supplier
  And currency "DKK" exists with attributes "exchange_rate: 2.5"

  And lead Ultimate monitors 1 is created by user ccagent01@person.com with role call_centre_agent
  And lead "Ultimate monitors 1" has currency "DKK"
  And lead Ultimate monitors 2 is created by user ccagent01@person.com with role call_centre_agent
  And lead "Ultimate monitors 2" has currency "DKK"
  And lead Ultimate monitors 2a is created by user ccagent01@person.com with role call_centre_agent
  And lead "Ultimate monitors 2a" has currency "DKK"
  And lead Ultimate monitors 3 is created by user ccagent02@person.com with role call_centre_agent
  And lead "Ultimate monitors 3" has currency "DKK"
  And lead Ultimate monitors 4 is created by user ccagent02@person.com with role call_centre_agent
  And lead "Ultimate monitors 4" has currency "DKK"
  And lead Ultimate monitors 5 is created by user ccagent02@person.com with role call_centre_agent
  And lead "Ultimate monitors 5" has currency "DKK"
  And lead Ultimate monitors 5a is created by user ccagent02@person.com with role call_centre_agent
  And lead "Ultimate monitors 5a" has currency "DKK"

  And lead Ultimate monitors 1 exists with attributes "price:5.0"
  And lead Ultimate monitors 2 exists with attributes "price:5.0"
  And lead Ultimate monitors 2a exists with attributes "price:5.0"
  And lead Ultimate monitors 3 exists with attributes "price:5.0"
  And lead Ultimate monitors 4 exists with attributes "price:5.0"
  And lead Ultimate monitors 5 exists with attributes "price:5.0"
  And lead Ultimate monitors 5a exists with attributes "price:5.0"

  And lead Ultimate monitors 1 is bought by user bob@person.com with role supplier and is assigned to user bob1@person.com with role lead_supplier
  And lead Ultimate monitors 2 is bought by user bob@person.com with role supplier and is assigned to user bob1@person.com with role lead_supplier
  And lead Ultimate monitors 3 is bought by user bob@person.com with role supplier and is assigned to user bob1@person.com with role lead_supplier
  And lead Ultimate monitors 4 is bought by user bob@person.com with role supplier and is assigned to user bob1@person.com with role lead_supplier
  And lead Ultimate monitors 5 is bought by user bob@person.com with role supplier and is assigned to user bob1@person.com with role lead_supplier

  And a lead purchase for lead "Ultimate monitors 1" by user "bob@person.com" with role "supplier" exists with attributes "accessible_from:Date.today-20"
  And a lead purchase for lead "Ultimate monitors 2" by user "bob@person.com" with role "supplier" exists with attributes "accessible_from:Date.today-360"
  And a lead purchase for lead "Ultimate monitors 3" by user "bob@person.com" with role "supplier" exists with attributes "accessible_from:Date.today"
  And a lead purchase for lead "Ultimate monitors 4" by user "bob@person.com" with role "supplier" exists with attributes "accessible_from:Date.today"
  And a lead purchase for lead "Ultimate monitors 5" by user "bob@person.com" with role "supplier" exists with attributes "accessible_from:Date.today"

  And a lead "Ultimate monitors 1" has good rating
  And a lead "Ultimate monitors 2" has good rating
  And a lead "Ultimate monitors 3" has good rating
  And a lead "Ultimate monitors 4" has bad rating
  And a lead "Ultimate monitors 5" has bad rating

  Given all prices are converted to euro
  And all users have refreshed cache counters

  And user ccagent01@person.com with role call_centre_agent exists with attributes "first_name:Zack,last_name:Florin,mobile_phone:20203041223"
  And user ccagent02@person.com with role call_centre_agent exists with attributes "first_name:Dorian,last_name:Grey,mobile_phone:10101010134"

  And I go to call centre agents
  When I follow translated "call_centre.call_centre_agents.index.view.first_name_column"
  Then I should have value "Dorian" in the css path "tr:nth-child(1) td:nth-child(3)"
  When I follow translated "call_centre.call_centre_agents.index.view.last_name_column"
  Then I should have value "Florin" in the css path "tr:nth-child(1) td:nth-child(4)"
  When I follow translated "call_centre.call_centre_agents.index.view.mobile_phone_column"
  Then I should have value "10101010134" in the css path "tr:nth-child(1) td:nth-child(7)"
  When I follow translated "call_centre.call_centre_agents.index.view.created_leads_column"
  Then I should have value "3" in the css path "tr:nth-child(1) td:nth-child(5)"
  When I follow translated "call_centre.call_centre_agents.index.view.volume_sold_column"
  And I follow translated "call_centre.call_centre_agents.index.view.volume_sold_column"
  Then I should have value "3" in the css path "tr:nth-child(1) td:nth-child(6)"
  When I follow translated "call_centre.call_centre_agents.index.view.revenue_column"
  When I follow translated "call_centre.call_centre_agents.index.view.revenue_column"
  Then I should have value "6.0" in the css path "tr:nth-child(1) td:nth-child(8)"
  When I follow translated "call_centre.call_centre_agents.index.view.purchased_month_ago_column"
  And I follow translated "call_centre.call_centre_agents.index.view.purchased_month_ago_column"
  Then I should have value "3" in the css path "tr:nth-child(1) td:nth-child(9)"
  When I follow translated "call_centre.call_centre_agents.index.view.purchased_year_ago_column"
  Then I should have value "2" in the css path "tr:nth-child(1) td:nth-child(10)"
  When I follow translated "call_centre.call_centre_agents.index.view.good_leads_column"
  Then I should have value "1" in the css path "tr:nth-child(1) td:nth-child(11)"
  When I follow translated "call_centre.call_centre_agents.index.view.bad_leads_column"
  Then I should have value "0" in the css path "tr:nth-child(1) td:nth-child(12)"
  When I follow translated "call_centre.call_centre_agents.index.view.not_rated_leads_column"
  Then I should have value "0" in the css path "tr:nth-child(1) td:nth-child(14)"
  When I follow translated "call_centre.call_centre_agents.index.view.rating_percent_column"
  Then I should have value "33%" in the css path "tr:nth-child(1) td:nth-child(15)"
  When I follow translated "call_centre.call_centre_agents.index.view.certification_lvl_column"
  And I follow translated "call_centre.call_centre_agents.index.view.certification_lvl_column"
  Then I should have value "Bronze" in the css path "tr:nth-child(1) td:nth-child(16)"

@m0
Scenario: I can sort by fake

@_done @non_testable @added
Scenario: Rename column accessible in LeadPurchase to accessible_from:datetime (for last month/year ago purchased stat to work)

@_done @non_testable @added
Scenario: I can refresh the cashed values for sort by rake task

@_tested @_done
Scenario: I can block the user
  Given an user with role call_centre_agent and email ccagent@person.com belongs to call centre call_centre@person.com
  And I go to call centre agents
  Then I follow translated "call_centre.call_centre_agents.index.view.lock"
  Then I should see translated "call_centre.call_centre_agents.update.flash.call_centre_agent_update_successful"

@_tested @_done
Scenario: I can unblock user
  Given an user with role call_centre_agent and email ccagent@person.com belongs to call centre call_centre@person.com
  And User ccagent@person.com with role call_centre_agent is blocked
  And I go to call centre agents
  Then I follow translated "call_centre.call_centre_agents.index.view.unlock"
  Then I should see translated "call_centre.call_centre_agents.update.flash.call_centre_agent_update_successful"

@_tested @_done
Scenario: I can edit user
  Given an user with role call_centre_agent and email ccagent@person.com belongs to call centre call_centre@person.com
  And I go to call centre agents
  And I follow translated "call_centre.call_centre_agents.index.view.edit"
  And I fill in "user_call_centre_agent_first_name" with "John"
  And I fill in "user_call_centre_agent_last_name" with "Smith"
  And I press translated "call_centre.call_centre_agents.edit.view.button_update"
  Then I should see translated "call_centre.call_centre_agents.update.flash.call_centre_agent_update_successful"

@_tested @_done
Scenario: I can delete user
  Given an user with role call_centre_agent and email ccagent@person.com belongs to call centre call_centre@person.com
  And I go to call centre agents
  And I follow translated "call_centre.call_centre_agents.index.view.delete"
  Then I should see translated "call_centre.call_centre_agents.destroy.flash.call_centre_agent_deletion_successful"

@_tested @selenium @_done
Scenario: I can bulk block users
  Given an user with role call_centre_agent and email ccagent01@person.com belongs to call centre call_centre@person.com
  Given an user with role call_centre_agent and email ccagent02@person.com belongs to call centre call_centre@person.com
  And I go to call centre agents
  Then I check "mark_all"
  And I follow "lock_selected"
  Then I should see translated "flash.bulk_call_centre_agents_update.update.notice"

@_tested @selenium @_done
Scenario: I can bulk unblock users
  Given an user with role call_centre_agent and email ccagent01@person.com belongs to call centre call_centre@person.com
  And User ccagent01@person.com with role call_centre_agent is blocked
  Given an user with role call_centre_agent and email ccagent02@person.com belongs to call centre call_centre@person.com
  And User ccagent02@person.com with role call_centre_agent is blocked
  And I go to call centre agents
  Then I check "mark_all"
  And I follow "unlock_selected"
  Then I should see translated "flash.bulk_call_centre_agents_update.update.notice"

@m9 @tgn @_done @tested_elsewhere
Scenario: Call centre agents should inherit the certification of a call centre

@m9 @tgn @non_testable @_done
Scenario: Call centre should have refreshed stats just like the agents

# 4871
@m11 @requested @_done @_tested
Scenario: Call centers is able to reset and set password to all his agents
  Given an user with role call_centre_agent and email ccagent@person.com belongs to call centre call_centre@person.com
  And I go to call centre agents
  And I follow translated "call_centre.call_centre_agents.index.view.edit"
  And I follow translated "call_centre.call_centre_agents.edit.view.change_password_link"
  And I fill in "user_password" with "newpass"
  And I fill in "user_password_confirmation" with "newpass"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "password.flashes.successfully_changed"
  When I sign out
  And I am on the home page
  And I sign in as ccagent@person.com with password newpass
  Then I should be signed in
  When I sign out
  And I am on the home page
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre agents
  And I follow translated "call_centre.call_centre_agents.index.view.edit"
  And I follow translated "call_centre.call_centre_agents.edit.view.reset_password_link"
  Then I should see translated "administration.password.destroy.flash.password_reset_successful"
  And a password reset message should be sent to ccagent@person.com

# look for call_results.table.export_to_csv
@m11 @requested @is @_done @_tested_elsewhere
Scenario: I can view the contact on agent work screen when I click it on results listing

# look for call_results.table.export_to_csv
@m11 @requested @is @_done @_tested_elsewhere
Scenario: I can export all contacts with final results to a csv file

@_done @_tested @is @m11 @requested
Scenario: Call centers is able to reset password to all his agents
  Given I go to the homepage
  And I am not sign in
  Then I sign in as translator_call_centre@nbs.com with password secret
  Then I follow translated "layout.main_menu.call_centre.call_centre_agents"
  Then I follow translated "call_centre.call_centre_agents.index.view.edit"
  Then I follow translated "call_centre.call_centre_agents.edit.view.reset_password_link"
  Then I should see translated "administration.password.destroy.flash.password_reset_successful"
  Then a call_center password reset message should be sent to translator_call_centre_agent@nbs.com

@added @_done @_tested @is @m11 @requested
Scenario: Call centers is able to set password to all his agents
  Given I am on the homepage
  And I am not sign in
  Then I sign in as translator_call_centre@nbs.com with password secret
  Then I follow translated "layout.main_menu.call_centre.call_centre_agents"
  Then I follow translated "call_centre.call_centre_agents.index.view.edit"
  Then I follow translated "call_centre.call_centre_agents.edit.view.change_password_link"
  Then I fill in "password" with "3343secret33234"
  Then I fill in "user_password_confirmation" with "3343secret33234"
  Then I press translated "password.edit.view.button_update_user"
  Then I should see translated "password.flashes.successfully_changed"
  Then I go to the logout page
  Given I am on the homepage
  Then I sign in as translator_call_centre_agent@nbs.com with password 3343secret33234
  Then I should see translated "devise.sessions.signed_in"

@_done @_tested @m11 @requested @is
Scenario: Call centers is able to skip email confirmation when creating new agent
  Given I am on the homepage
  And I am not sign in
  Then I sign in as translator_call_centre@nbs.com with password secret
  Then I follow translated "layout.main_menu.call_centre.call_centre_agents"
  Then I follow translated "call_centre.call_centre_agents.new.view.button_create"
  Then I should see "Don't verify email address"
  Then I fill in "user_call_centre_agent_first_name" with "Johnny"
  Then I fill in "user_call_centre_agent_last_name" with "Cage"
  Then I fill in "user_call_centre_agent_password" with "secret"
  Then I fill in "user_call_centre_agent_password_confirmation" with "secret"
  Then I fill in "user_call_centre_agent_email" with "johnny_cage@mk.com"
  Then I fill in "user_call_centre_agent_address_attributes_address_line_1" with "Fairadress"
  Then I fill in "user_call_centre_agent_address_attributes_address_line_3" with "Fairtown"
  Then I fill in "user_call_centre_agent_address_attributes_zip_code" with "23-039"
  Then I check "user_call_centre_agent_skip_email_verification"
  Then I press "Create"
  Then I go to the logout page
  Given I am on the homepage
  Then I sign in as johnny_cage@mk.com with password secret
  Then I should see translated "devise.sessions.signed_in"