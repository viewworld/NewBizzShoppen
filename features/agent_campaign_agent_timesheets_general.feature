@m26 @requested @agent_timesheets @ao
Feature: Agent timesheets

  Background:
    Given there are no cached timesheets

  @selenium @_done @_tested
  Scenario: I can select start and end date or week
    Given user translator_call_centre@nbs.com with role call_centre exists with attributes "first_name: Ted, company_name:Russia Today"
    Given user translator_call_centre_agent@nbs.com with role call_centre_agent exists with attributes "first_name:Alyona"
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
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
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
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

  #9787
  @m27 @requested @_done @_nontestable
  Scenario: Generated timesheet should be displayed in popup window to use full size of screen

  #9787
  @m27 @requested @_done @_nontestable
  Scenario: I should see dropdown with list of agents and "show" button instead of separate tabs for each agent

  #9787
  @m27 @requested @_done @selenium @_tested
  Scenario: Timesheets should be generated in background
    Given campaign report data is generated
    And campaign report user session logs are generated
    And additional timesheet report data is generated
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I set date "Date.today-1" for field "search[start_date]"
    And I set date "Date.today+7" for field "search[end_date]"
    And I uncheck "search_overview"
    And I uncheck "search_team_result_sheet"
    And I check "search_agent_timesheet"
    And I select "TestCampaignReport1" from "all_campaigns"
    And I select "TestCampaignReport2" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I select "test report user CC" from "all_call_centres"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    Then I should see translated "agent_timesheets.index.timesheet_queued"
    And I should see translated "agent_timesheets.new.scheduled_actions"

  #9991
  @m27 @added @selenium @_done @_tested
  Scenario: I should be able to delete cached timesheet
  Given campaign report data is generated
  And campaign report user session logs are generated
  And additional timesheet report data is generated
  Given I am on the homepage
  And I sign in as blazejek@gmail.com with password secret
  And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
  And I set date "Date.today-1" for field "search[start_date]"
  And I set date "Date.today+7" for field "search[end_date]"
  And I uncheck "search_overview"
  And I uncheck "search_team_result_sheet"
  And I check "search_agent_timesheet"
  And I select "TestCampaignReport1" from "all_campaigns"
  And I select "TestCampaignReport2" from "all_campaigns"
  And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
  And I select "test report user CC" from "all_call_centres"
  And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
  And I press translated "agent_timesheets.new.generate"
  Then I should see "1" rows with id like "cached_timesheet_" in a table
  When I follow translated "agent_timesheets.new.delete"
  Then I should see "0" rows with id like "cached_timesheet_" in a table

  #9787
  @m27 @requested @selenium @_done @_tested
  Scenario: I should get an email when my report is generated
    Given campaign report data is generated
    And campaign report user session logs are generated
    And additional timesheet report data is generated
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I set date "Date.today-1" for field "search[start_date]"
    And I set date "Date.today+7" for field "search[end_date]"
    And I uncheck "search_overview"
    And I uncheck "search_team_result_sheet"
    And I check "search_agent_timesheet"
    And I select "TestCampaignReport1" from "all_campaigns"
    And I select "TestCampaignReport2" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I select "test report user CC" from "all_call_centres"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    Then last email sent should have been sent to recipient "blazejek@gmail.com"

  #9787
  @m27 @requested @_done @_tested
  Scenario: I should see queue / generated reports on the bottom of new timesheets screen
    Given campaign report data is generated
    And campaign report user session logs are generated
    And additional timesheet report data is generated
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I should see translated "agent_timesheets.new.scheduled_actions"
    And I should see translated "agent_timesheets.new.cached_timesheets"

  #9787
  @m27 @requested @_done @_tested_elsewhere
  Scenario: I can select only user(s) to generate report for all campaigns for this user(s)

  #9787
  @m27 @requested @_done @_tested_elsewhere
  Scenario: I can select only campaign(s) to generate report for all users on this campaign(s)

  #9877
  @m28 @requested @selenium @_done @_tested
  Scenario: I can use checkbox to display cost
    Given there are no cached timesheets
    Given user translator_call_centre@nbs.com with role call_centre exists with attributes "first_name: Ted, company_name:Russia Today"
    Given user translator_call_centre_agent@nbs.com with role call_centre_agent exists with attributes "first_name:Alyona"
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    When I fill in "search[start_date]" with "01-01-2011"
    And I fill in "search[end_date]" with "01-01-2011"
    And I check "search_show_weekends"
    And I select "Testing One" from "all_campaigns"
    And I select "Testing Two" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I check "search_display_cost"
    And I check "search_overview"
    And I check "search_team_result_sheet"
    And I check "search_agent_timesheet"
    And I select "Ted, Russia Today" from "all_call_centres"
    And I select "Alyona, Russia Today" from "all_agents"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    Then I should see translated "agent_timesheets.index.overview.cost_header"
    And I should see translated "agent_timesheets.index.team_result_sheet.cost"
    And I should see translated "agent_timesheets.index.agent_time_sheet.cost"
    Given there are no cached timesheets
    When I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    When I fill in "search[start_date]" with "01-01-2011"
    And I fill in "search[end_date]" with "01-01-2011"
    And I check "search_show_weekends"
    And I select "Testing One" from "all_campaigns"
    And I select "Testing Two" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I uncheck "search_display_cost"
    And I check "search_overview"
    And I check "search_team_result_sheet"
    And I check "search_agent_timesheet"
    And I select "Ted, Russia Today" from "all_call_centres"
    And I select "Alyona, Russia Today" from "all_agents"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    Then I should not see translated "agent_timesheets.index.overview.cost_header"
    And I should not see translated "agent_timesheets.index.team_result_sheet.cost"
    And I should not see translated "agent_timesheets.index.agent_time_sheet.cost"

  #9889
  @m28 @requested @tgn @_done @_tested_elsewhere
  Scenario: Dynamic result value should be included into agent timesheets

  #10170
  @m29 @requested
  Scenario: I can download timesheet as PDF

  #10170
  @m29 @requested
  Scenario: The PDF should be generated in background with the HTML version

  #10170
  @m29 @requested
  Scenario: The PDF should be well formated (with page breaks, font size)

  #10278
  @m29 @requested @selenium @_done @_tested
  Scenario: Notification should be added when I generate a timesheet
    Given there are no cached timesheets
    Given user translator_call_centre@nbs.com with role call_centre exists with attributes "first_name: Ted, company_name:Russia Today"
    Given user translator_call_centre_agent@nbs.com with role call_centre_agent exists with attributes "first_name:Alyona"
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    When I fill in "search[start_date]" with "01-01-2011"
    And I fill in "search[end_date]" with "01-01-2011"
    And I check "search_show_weekends"
    And I select "Testing One" from "all_campaigns"
    And I select "Testing Two" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I check "search_display_cost"
    And I check "search_overview"
    And I check "search_team_result_sheet"
    And I check "search_agent_timesheet"
    And I select "Ted, Russia Today" from "all_call_centres"
    And I select "Alyona, Russia Today" from "all_agents"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    Then notification for user "admin@nbs.com" should be created
    And the last notification should be active