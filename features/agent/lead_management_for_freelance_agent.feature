@lead_manager @$_freelance_agent @m1 @faircalls
Feature: Lead Management - My Leads Manage for Freelance Agent

Background:
  And I am on the homepage
  Given I visit domain http://faircalls.eu
  And I make sure current locale is "en"
  And Category named "Sample category" already exists
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role agent
  And lead Lead 1 is created by user john@doe.com with role agent
  And lead Lead 2 is created by user john@doe.com with role agent
  And lead Lead 3 is created by user john@doe.com with role agent
  And lead Lead 4 is created by user john@doe.com with role agent
  And user "john@doe.com" with role "agent" has certification level set to 11
  And a lead Lead 4 exists within category Computers and is bought by user jim.doe.buyer@person.com with role supplier
  Then I sign in as john@doe.com with password secret
  And I go to agents leads

@tgn @_tested @_done
Scenario: I can browse leads with pagination
  Given pagination page size for leads is set to 3
  And I go to agents leads
  Then I follow "2"

@tgn @_tested @_done
Scenario: I can search leads with filtering by:skip inactive, skip outdated
  Given I fill in "search_with_keyword" with "Lead 2"
  And I press translated "agent.leads.index.view.search_button"
  Then I should see "Lead 2"
  And I should not see "Lead 1"
  And I should not see "Lead 3"
  Given I fill in "search_with_keyword" with ""
  And I press translated "agent.leads.index.view.search_button"
  Given lead Lead 4 exists with attributes "sale_limit:1"
  And I check "search_without_inactive"
  And I press translated "agent.leads.index.view.search_button"
  Then I should not see "Lead 4"
  Given lead Lead 3 exists with attributes "purchase_decision_date:2009-09-01"
  And I check "search_without_outdated"
  And I press translated "agent.leads.index.view.search_button"
  Then I should see "Lead 1"
  And I should see "Lead 2"
  And I should not see "Lead 3"

@tgn @_tested @selenium @_done
Scenario: I can change lead status from lead list
  Given I fill in "search_with_keyword" with "Lead 2"
  And I press translated "agent.leads.index.view.search_button"
  Then I select translated "agent.leads.index.view.option_not_published" from "lead_published"
  Given I fill in "search_with_keyword" with ""
  And I press translated "agent.leads.index.view.search_button"
  Given I fill in "search_with_keyword" with "Lead 2"
  And I press translated "agent.leads.index.view.search_button"
  And "lead_published" should be selected for value translated "agent.leads.index.view.option_not_published"

@tgn @_tested @_done
Scenario: I can delete lead if the lead is not sold yet
  Given I fill in "search_with_keyword" with "Lead 1"
  And I press translated "agent.leads.index.view.search_button"
  And I follow translated "agent.leads.index.view.destroy"
  Then I should see translated "agent.leads.destroy.flash.lead_deletion_successful"
  Given I fill in "search_with_keyword" with "Lead 4"
  And I press translated "agent.leads.index.view.search_button"
  And I follow translated "agent.leads.index.view.destroy"
  Then I should see translated "agent.leads.destroy.flash.lead_deletion_failure"

@tgn @_tested @_done
Scenario: I can see uniqueness, price per lead
  Given lead Lead 1 exists with attributes "price:333.99,sale_limit:10"
  And I go to agents leads
  Given I fill in "search_with_keyword" with "Lead 1"
  And I press translated "agent.leads.index.view.search_button"
  Then I should see "333.99"
  And I should see "10"

@m3 @tgn @_tested @added @_done
Scenario: I can see clicks, exposure, hottness, novelty per lead
  Given lead Lead 1 exists with attributes "clicks_count:982,exposures_count:9821"
  And I go to agents leads
  And I should see "982"
  And I should see "9821"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see translated "models.lead.hotness.lvl1"

@tgn @_tested @_done
Scenario: clicking on the lead should take to edit page
  Given I follow translated "agent.leads.index.view.edit"
  Then I should see translated "agent.leads.edit.view.title" with options "name:Lead 4"