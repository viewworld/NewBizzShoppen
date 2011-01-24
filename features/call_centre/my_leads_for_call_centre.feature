@lead_manager @$_call_centre @m5 @tgn
Feature: My leads for call centre

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Given I have user with email ccagent01@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre call_centre@person.com
  Given I have user with email ccagent02@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email ccagent02@nbs.com belongs to call centre call_centre@person.com
  Given lead Ultimate mouses deal is created by user ccagent01@nbs.com with role call_centre_agent
  Given lead Ultimate wires deal is created by user ccagent01@nbs.com with role call_centre_agent
  Given lead Ultimate desks deal is created by user ccagent02@nbs.com with role call_centre_agent
  Given lead Ultimate doors deal is created by user ccagent02@nbs.com with role call_centre_agent
  And a lead Ultimate doors deal exists within category Computers and is bought by user jim.doe.buyer@person.com with role customer
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre leads

@_tested
Scenario: I can browse leads with pagination
  Given pagination per page size in model Lead is set to 2
  And I go to call centre leads
  Then I follow "2"

Scenario: I can search leads with filtering by: show active (default), show all, show outdated

@_tested @selenium
Scenario: I can change lead status from lead list
  Given I fill in "search_with_keyword" with "ultimate mouses deal"
  And I press translated "call_centre.leads.index.view.search_button"
  Then I select translated "call_centre.leads.index.view.option_not_published" from "lead_published"
  Given I fill in "search_with_keyword" with ""
  And I press translated "call_centre.leads.index.view.search_button"
  Given I fill in "search_with_keyword" with "ultimate mouses deal"
  And I press translated "call_centre.leads.index.view.search_button"
  And "lead_published" should be selected for value translated "call_centre.leads.index.view.option_not_published"

@_tested
Scenario: I can delete lead if the lead is not sold yet
  Given I fill in "search_with_keyword" with "Ultimate mouses deal"
  And I press translated "call_centre.leads.index.view.search_button"
  And I follow translated "call_centre.leads.index.view.destroy"
  Then I should see translated "call_centre.leads.destroy.flash.lead_deletion_successful"
  Given I fill in "search_with_keyword" with "Ultimate doors deal"
  And I press translated "call_centre.leads.index.view.search_button"
  And I follow translated "call_centre.leads.index.view.destroy"
  Then I should see translated "call_centre.leads.destroy.flash.lead_deletion_failure"

@_done @tested_elsewhere
Scenario: I can see clicks, exposure, hottness, novelty, unikness, price per lead

@_done @non_testable
Scenario: clicking on the lead should take to edit page