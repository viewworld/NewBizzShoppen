@m5 @tgn @faircalls
Feature: Leads managements for call centre agent

  Background:
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I make sure current locale is "en"
    And I have user with email call_centre@person.com and role call_centre
    And I am signed up and confirmed as user with email call_centre_agent@person.com and password supersecret and role call_centre_agent
    And lead Monitors ultimate deal is created by user call_centre_agent@person.com with role call_centre_agent
    And lead Wires ultimate deal is created by user call_centre_agent@person.com with role call_centre_agent
    And lead Routers ultimate deal is created by user call_centre_agent@person.com with role call_centre_agent
    And lead Touchpads ultimate deal is created by user call_centre_agent@person.com with role call_centre_agent
    And an user with role call_centre_agent and email call_centre_agent@person.com belongs to call centre call_centre@person.com
    Then I sign in as call_centre_agent@person.com with password supersecret

  # @_tested @_done @_deprecated2014
  # Scenario: I can browse leads with pagination
  #   Given pagination page size for leads is set to 2
  #   And I follow translated "layout.main_menu.call_centre_agent.leads"
  #   And I follow "2"

  # @_tested @_done @_deprecated2014
  # Scenario: I can search leads with filtering by: show active (default), show all, show outdated
  #   Given lead Monitors ultimate deal exists with attributes "purchase_decision_date:2009-09-01"
  #   Given lead Wires ultimate deal exists with attributes "sale_limit:1"
  #   And a lead Wires ultimate deal exists within category Computers and is bought by user jim.doe.buyer@person.com with role supplier
  #   And I follow translated "layout.main_menu.call_centre_agent.leads"
  #   Then I should see "Routers ultimate deal"
  #   And I should see "Touchpads ultimate deal"
  #   Then I should not see "Monitors ultimate deal"
  #   And I should not see "Wires ultimate deal"
  #   When I uncheck "search_without_outdated"
  #   And I press translated "call_centre.leads.index.view.search_button"
  #   Then I should see "Monitors ultimate deal"
  #   When I uncheck "search_without_inactive"
  #   And I press translated "call_centre.leads.index.view.search_button"
  #   Then I should see "Wires ultimate deal"

  # @_tested @selenium @_done @_deprecated2014
  # Scenario: I can change lead status from lead list
  #   When I follow translated "layout.main_menu.call_centre_agent.leads"
  #   And I fill in "search_with_keyword" with "routers ultimate deal"
  #   And I press translated "call_centre_agent.leads.index.view.search_button"
  #   Then I select translated "call_centre_agent.leads.index.view.option_not_published" from "lead_published"
  #   Given I fill in "search_with_keyword" with ""
  #   And I press translated "call_centre_agent.leads.index.view.search_button"
  #   Given I fill in "search_with_keyword" with "routers ultimate deal"
  #   And I press translated "call_centre_agent.leads.index.view.search_button"
  #   And "lead_published" should be selected for value translated "call_centre_agent.leads.index.view.option_not_published"

  # @_tested @_done @_deprecated2014
  # Scenario: I can delete lead even if the lead is sold
  #   Given a lead Wires ultimate deal exists within category Computers and is bought by user jim.doe.buyer@person.com with role supplier
  #   And I follow translated "layout.main_menu.call_centre_agent.leads"
  #   Given I fill in "search_with_keyword" with "monitors ultimate deal"
  #   And I press translated "call_centre_agent.leads.index.view.search_button"
  #   And I follow translated "call_centre_agent.leads.index.view.destroy"
  #   Then I should see translated "call_centre_agent.leads.destroy.flash.lead_deletion_successful"
  #   Given I fill in "search_with_keyword" with "wires ultimate deal"
  #   And I uncheck "search_without_inactive"
  #   And I press translated "call_centre_agent.leads.index.view.search_button"
  #   And I follow translated "call_centre_agent.leads.index.view.destroy"
  #   Then I should see translated "call_centre_agent.leads.destroy.flash.lead_deletion_successful"

  # @_tested @_done @_deprecated2014
  # Scenario: I can see clicks, exposure, hottness, novelty, uniqueness, price per lead
  #   Given lead Routers ultimate deal exists with attributes "clicks_count:982,exposures_count:9821,sale_limit:8,price:74.98"
  #   And I follow translated "layout.main_menu.call_centre_agent.leads"
  #   And I should see "982"
  #   And I should see "9821"
  #   And I should see "8"
  #   And I should see "74.98"
  #   And I should see translated "models.lead.novelty.lvl0"
  #   And I should see translated "models.lead.hotness.lvl1"

  @_done @non_testable
  Scenario: clicking on the lead should take to edit page
