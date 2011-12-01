@lead_manager @$_call_centre @m5 @tgn @faircalls
Feature: My leads for call centre

Background:
  Given I am on the homepage
  And I visit domain http://faircalls.eu
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Given I have user with email ccagent01@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre call_centre@person.com
  Given I have user with email ccagent02@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email ccagent02@nbs.com belongs to call centre call_centre@person.com
  Given lead Ultimate mouses deal is created by user ccagent01@nbs.com with role call_centre_agent
  Given lead Ultimate wires deal is created by user ccagent01@nbs.com with role call_centre_agent
  Given lead Ultimate desks deal is created by user ccagent02@nbs.com with role call_centre_agent
  Given lead Ultimate doors deal is created by user ccagent02@nbs.com with role call_centre_agent
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre leads

@_tested @_done
Scenario: I can browse leads with pagination
  Given pagination per page size in model Lead is set to 2
  And I go to call centre leads
  Then I follow "2"

@_tested @_done
Scenario: I can search leads with filtering by: show active (default), show all, show outdated
  Given a lead Ultimate doors deal exists within category Computers and is bought by user jim.doe.buyer@person.com with role supplier
  Given lead Ultimate desks deal exists with attributes "purchase_decision_date:2009-09-01"
  Given lead Ultimate doors deal exists with attributes "sale_limit:1"
  And I go to call centre leads
  Then I should see "Ultimate mouses deal"
  And I should see "Ultimate wires deal"
  Then I should not see "Ultimate doors deal"
  And I should not see "Ultimate desks deal"
  When I uncheck "search_without_outdated"
  And I press translated "call_centre.leads.index.view.search_button"
  Then I should see "Ultimate desks deal"
  When I uncheck "search_without_inactive"
  And I press translated "call_centre.leads.index.view.search_button"
  Then I should see "Ultimate doors deal"

@_tested @selenium @_done
Scenario: I can change lead status from lead list
  Given I fill in "search_with_keyword" with "ultimate mouses deal"
  And I press translated "call_centre.leads.index.view.search_button"
  Then I select translated "call_centre.leads.index.view.option_not_published" from "lead_published"
  Given I fill in "search_with_keyword" with ""
  And I press translated "call_centre.leads.index.view.search_button"
  Given I fill in "search_with_keyword" with "ultimate mouses deal"
  And I press translated "call_centre.leads.index.view.search_button"
  And "lead_published" should be selected for value translated "call_centre.leads.index.view.option_not_published"

@_tested @_done
Scenario: I can delete lead if the lead is not sold yet
  Given I fill in "search_with_keyword" with "Ultimate mouses deal"
  And I press translated "call_centre.leads.index.view.search_button"
  And I follow translated "call_centre.leads.index.view.destroy"
  Then I should see translated "call_centre.leads.destroy.flash.lead_deletion_successful"
  Given a lead Ultimate doors deal exists within category Computers and is bought by user jim.doe.buyer@person.com with role supplier
  And I go to call centre leads
  Given I fill in "search_with_keyword" with "Ultimate doors deal"
  And I uncheck "search_without_inactive"
  And I press translated "call_centre.leads.index.view.search_button"
  And I follow translated "call_centre.leads.index.view.destroy"
  Then I should see translated "call_centre.leads.destroy.flash.lead_deletion_failure"

@_done @_tested_elsewhere
Scenario: I can see clicks, exposure, hottness, novelty, unikness, price per lead

@_done @non_testable
Scenario: clicking on the lead should take to edit page

@m6 @_tested @tgn @requested @_done
Scenario: I can change a creator of lead to any other user within my call centre
  Given there are no leads
  And I have user with email other_agent@nbs.com and role call_centre_agent
  And I have user with email agent_555@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email agent_555@nbs.com belongs to call centre call_centre@person.com
  And I have user with email agent_777@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email agent_777@nbs.com belongs to call centre call_centre@person.com
  And lead Super ultra lead #1 is created by user agent_777@nbs.com with role call_centre_agent
  And I go to call centre leads
  And I follow translated "leads.listing.edit_label"
  Then I select "agent_555@nbs.com" from "lead_tmp_creator_id"
  And "lead_tmp_creator_id" dropdown should not have values "other_agent@nbs.com"
  And I press translated "administration.leads.edit.view.button_update"
  And I follow translated "leads.listing.edit_label"
  And "lead_tmp_creator_id" should be selected for value "agent_555@nbs.com"