@m26 @requested @agent_timesheets @ao
Feature: Agent timesheets

  @selenium @_done @_tested
  Scenario: I can select start and end date or week
    Given user translator_call_centre@nbs.com with role call_centre exists with attributes "first_name: Ted, company_name:Russia Today"
    Given user translator_call_centre_agent@nbs.com with role call_centre_agent exists with attributes "first_name:Alyona"
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets$/"
    When I fill in "search[start_date]" with "01-01-2011"
    And I fill in "search[end_date]" with "01-01-2011"
    And I check "search_show_weekends"
    And I select "Testing One" from "all_campaigns"
    And I select "Testing Two" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I check "search_display_hours"
    And I check "search_display_results"
    And I check "search_display_value"
    And I check "search_overview"
    And I check "search_team_result_sheet"
    And I check "search_agent_timesheet"
    And I select "Ted, Russia Today" from "all_call_centres"
    And I select "Alyona, Russia Today" from "all_agents"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I am not sign in
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets$/"
    And I select "Alyona" from "all_agents"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"

  @_done @_tested_elsewhere
  Scenario: I can use a checkbox to show weekends

  @_done @_tested_elsewhere
  Scenario: I can add one or all campaigns at once

  # pulse up a list of agents in the call center, or all agents if the admin
  @_done @_tested_elsewhere
  Scenario: I can add agent

  @_done @_tested_elsewhere
  Scenario: I can add all my agents if I'm call center

  @_done @_tested_elsewhere
  Scenario: I can add a call center if I'm admin

  @_done @_tested_elsewhere
  Scenario: I can use checkbox to display time / results / value (all on by default)

  @_done @_tested_elsewhere
  Scenario: I can use checkbox to select overview / team results / agent timesheets as report type (all on by default)

