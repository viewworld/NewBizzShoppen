@m26 @requested @agent_timesheets @ao
Feature: Agent timesheets - team result sheet

  @selenium @_done @_tested
  Scenario: I can see table for each week divided by agents and day of week
    Given campaign report data is generated
    And campaign report user session logs are generated
    And additional timesheet report data is generated
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets$/"
    And I set date "Date.today-1" for field "search[start_date]"
    And I set date "Date.today+7" for field "search[end_date]"
    And I uncheck "search_overview"
    And I check "search_team_result_sheet"
    And I uncheck "search_agent_timesheet"
    And I select "TestCampaignReport1" from "all_campaigns"
    And I select "TestCampaignReport2" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I select "test report user CC" from "all_call_centres"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    And I click hidden link by url regex "/callers\/agent_timesheets$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    And I follow "Team result sheet"
    And I should see "test report user CC"
    And I should see "test report user CCA1"
    And I should see "test report user CCA2"
    And I should see "384:00"
    And I should see "22"
    And I should see "286.00"

  @_done @_tested_elsewhere
  Scenario: I can see time spent for each agent for each day of week

  @_done @_tested_elsewhere
  Scenario: I can see number of results for each agent for each day of week

  @_done @_tested_elsewhere
  Scenario: I can see value for each agent for each day of week

  @_done @_tested_elsewhere
  Scenario: I can see a total time spent by all agents per day

  @_done @_tested_elsewhere
  Scenario: I can see a total number of reeults for all agents per day

  @_done @_tested_elsewhere
  Scenario: I can see a total value for all agents per day

  @_done @_tested_elsewhere
  Scenario: I can see a total time spent per agent per week

  @_done @_tested_elsewhere
  Scenario: I can see total results per agent per week

  @_done @_tested_elsewhere
  Scenario: I can see total value created per agent per week

  @_done @_tested_elsewhere
  Scenario: I can see additional table with total time spent per day of week for all agents and all weeks

  @_done @_tested_elsewhere
  Scenario: I can see additional table with total number of results per day of week for all agents and all weeks

  @_done @_tested_elsewhere
  Scenario: I can see additional table with total value created per day of week for all agents and all weeks