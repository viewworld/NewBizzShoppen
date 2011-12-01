@lead_manager @$_call_centre @m5 @tgn @faircalls
Feature: Leads filtering by agent

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Given I have user with email ccagent01@nbs.com and role call_centre_agent
  And user ccagent01@nbs.com with role call_centre_agent exists with attributes "first_name:Greg,last_name:Foam"
  And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre call_centre@person.com
  Given I have user with email ccagent02@nbs.com and role call_centre_agent
  And an user with role call_centre_agent and email ccagent02@nbs.com belongs to call centre call_centre@person.com
  And user ccagent02@nbs.com with role call_centre_agent exists with attributes "first_name:Loraine,last_name:Telly"
  Given lead Ultimate monitors deal is created by user ccagent01@nbs.com with role call_centre_agent
  And lead Ultimate monitors deal exists with attributes "clicks_count:123,exposures_count:85,price:789.68,purchase_value:1029.96,description:monitors custom description,average_rating:95,created_at:12-02-2011"
  Given lead Ultimate mouses deal is created by user ccagent01@nbs.com with role call_centre_agent
  Given lead Ultimate wires deal is created by user ccagent01@nbs.com with role call_centre_agent
  Given lead Ultimate desks deal is created by user ccagent02@nbs.com with role call_centre_agent
  Given lead Ultimate doors deal is created by user ccagent02@nbs.com with role call_centre_agent
  And I visit domain http://faircalls.eu
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre leads

@_tested @_done
Scenario: I can browse leads created by one of my agents with pagination
  Given pagination per page size in model Lead is set to 2
  And I go to call centre leads
  Given I select "Greg Foam" from "search_with_created_by"
  And I press translated "call_centre.leads.index.view.search_button"
  And I follow "2"

@_tested @_done
Scenario: I can see lead header, purchase value, lead price, hottness, novelty, exposures, clicks, created at
  Then I should see "Ultimate monitors deal"
  And I should see "1,029.96"
  And I should see "789.68"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see translated "models.lead.hotness.lvl1"
  And I should see "123"
  And I should see "85"
  And I should see "12-02-2011"

@_tested @_done
Scenario: I can see created by, rating, certification level
  Then I should see "Greg Foam"
  And I should see translated "models.lead.certification.lvl0"
  And I should see "95%"

@m0 @noguess
Scenario: I can see a link to comment for a lead if there is a conversation started

@_tested @_done
Scenario: I can filter leads by values ...
  When I fill in "search_with_keyword" with "ultimate monitors"
  And I press translated "call_centre.leads.index.view.search_button"
  Then I should see "Ultimate monitors deal"
  Then I should not see "Ultimate mouses deal"
  When I fill in "search_with_keyword" with ""
  And I select "Loraine Telly" from "search_with_created_by"
  And I press translated "call_centre.leads.index.view.search_button"
  Then I should see "Ultimate desks deal"
  And I should see "Ultimate doors deal"
  And I should not see "Ultimate mouses deal"

@_tested @_done
Scenario: I should be able to click link in agents listing and go straight to that agent's leads listing
  When I go to call centre call centre agents
  And I follow translated "call_centre.call_centre_agents.index.view.first_name_column"
  And I click hidden translated link "call_centre.call_centre_agents.index.view.view_leads"
  Then I should be on call centre leads
  And I should see "Ultimate monitors deal"
  And I should see "Ultimate mouses deal"
