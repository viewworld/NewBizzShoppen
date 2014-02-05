@$_admin @m5 @tgn @unique_categories @added
Feature: Unique agent categories

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is "en"
  Given there are no categories
  And Category Computers is created
  Then I sign in as bob@person.com with password supersecret
  And I go to browse leads

@_tested @_done @tc_file_mgmt
Scenario: I can mark category as agent unique
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  And I fill in "search_with_keyword" with "Computers"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_agent_unique"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.update.notice"

# @_tested @selenium @_done @_deprecated2014
# Scenario: I can assign one or more agents/call centers to category marked as agent unique
#   Given I have user with email agent93928biz@nbs.com and role agent
#   And I have user with email call_centre_agent3483434biz@nbs.com and role call_centre_agent
#   And I have user with email nbsagent3483434biz@nbs.com and role agent
#   When I uncheck "search_with_unique"
#   And I uncheck "search_with_public"
#   And I fill in "search_with_keyword" with "Computers"
#   Then I press translated "administration.categories.index.view.search.search_button"
#   When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
#   And I check "category_is_agent_unique"
#   And I select "call_centre_agent3483434biz@nbs.com" from "all_agents"
#   And I select "agent93928biz@nbs.com" from "all_agents"
#   And I follow "move_right" within "#users_selection_agents_div"
#   And attach the file "sample image" to "category_image_attributes_asset"
#   Then I press translated "administration.categories.edit.view.button_update"
#   And I should see translated "flash.categories.update.notice"
#   When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
#   And "selected_agents" should be selected for value "call_centre_agent3483434biz@nbs.com"
  # And "selected_agents" should be selected for value "agent93928biz@nbs.com"

# @_tested @selenium @_done @_deprecated2014
# Scenario: I can search agents by first name, last name and email
#   Given I have user with email agent93928biz@nbs.com and role agent
#   And I have user with email call_centre_agent3483434biz@nbs.com and role call_centre_agent
#   And I have user with email nbsagent3483434biz@nbs.com and role agent
#   And user "nbsagent3483434biz@nbs.com" with role "agent" has attributes "last_name:Aronofsky Jr"
#   When I uncheck "search_with_unique"
#   And I uncheck "search_with_public"
#   And I fill in "search_with_keyword" with "Computers"
#   Then I press translated "administration.categories.index.view.search.search_button"
#   When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
#   And I check "category_is_agent_unique"
#   And I fill in "filer_agents" with "Aronofsky Jr" within "#users_selection_agents_div"
#   And I follow translated "administration.categories.form.search" within "#users_selection_agents_div"
#   And I select "nbsagent3483434biz@nbs.com" from "all_agents"
#   And I follow "move_right" within "#users_selection_agents_div"
#   And attach the file "sample image" to "category_image_attributes_asset"
#   Then I press translated "administration.categories.edit.view.button_update"
#   And I should see translated "flash.categories.update.notice"
#   When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
#   And "selected_agents" should be selected for value "nbsagent3483434biz@nbs.com"

# @_tested @selenium @_done @_deprecated2014
# Scenario: I can assign a unique category to the whole call centre
#   Given I have user with email call_centre93928biz@nbs.com and role call_centre
#   And user "call_centre93928biz@nbs.com" with role "call_centre" has attributes "last_name:Aronofsky Jr"
#   When I uncheck "search_with_unique"
#   And I uncheck "search_with_public"
#   And I fill in "search_with_keyword" with "Computers"
#   Then I press translated "administration.categories.index.view.search.search_button"
#   When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
#   And I check "category_is_agent_unique"
#   And I fill in "filer_agents" with "Aronofsky Jr" within "#users_selection_agents_div"
#   And I follow translated "administration.categories.form.search" within "#users_selection_agents_div"
#   And I select "call_centre93928biz@nbs.com" from "all_agents"
#   And I follow "move_right" within "#users_selection_agents_div"
#   And attach the file "sample image" to "category_image_attributes_asset"
#   Then I press translated "administration.categories.edit.view.button_update"
#   And I should see translated "flash.categories.update.notice"
#   When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
#   And "selected_agents" should be selected for value "call_centre93928biz@nbs.com"
