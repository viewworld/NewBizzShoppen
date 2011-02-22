@$_admin @m5 @tgn @unique_categories @added
Feature: Unique agent categories

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is English
  Given there are no categories
  And Category Computers is created
  Then I sign in as bob@person.com with password supersecret
  And I go to administration categories

@_tested
Scenario: I can mark category as agent unique
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_agent_unique"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"

@_tested @selenium
Scenario: I can assign one or more agents/call centers to category marked as agent unique
  Given I have user with email agent93928biz@nbs.com and role agent
  And I have user with email call_centre_agent3483434biz@nbs.com and role call_centre_agent
  And I have user with email nbsagent3483434biz@nbs.com and role agent
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_agent_unique"
  And I select "call_centre_agent3483434biz@nbs.com" from "all_agents"
  And I select "agent93928biz@nbs.com" from "all_agents"
  And I press translated "administration.categories.form.move_users_right" within "#users_selection_agents_div"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"
  Then I follow translated "administration.categories.index.view.edit_link"
  And "selected_agents" should be selected for value "call_centre_agent3483434biz@nbs.com"
  And "selected_agents" should be selected for value "agent93928biz@nbs.com"

@_tested @selenium
Scenario: I can search agents by first name, last name and email
  Given I have user with email agent93928biz@nbs.com and role agent
  And I have user with email call_centre_agent3483434biz@nbs.com and role call_centre_agent
  And I have user with email nbsagent3483434biz@nbs.com and role agent
  And user "nbsagent3483434biz@nbs.com" with role "agent" has attributes "last_name:Aronofsky Jr"
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_agent_unique"
  And I fill in "filer_agents" with "Aronofsky Jr" within "#users_selection_agents_div"
  And I follow translated "administration.categories.form.search" within "#users_selection_agents_div"
  And I select "nbsagent3483434biz@nbs.com" from "all_agents"
  And I press translated "administration.categories.form.move_users_right" within "#users_selection_agents_div"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"
  Then I follow translated "administration.categories.index.view.edit_link"
  And "all_agents" should be selected for value "nbsagent3483434biz@nbs.com"
