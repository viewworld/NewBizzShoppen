@m26 @_requested @agent_timesheets @ao
Feature: Agent timesheets - overview

  @selenium @_tested @_done
  Scenario: I can see table with week days grouped by week number for hours
    Given campaign report data is generated
    And campaign report user session logs are generated
    And additional timesheet report data is generated
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I set date "Date.today-1" for field "search[start_date]"
    And I set date "Date.today+7" for field "search[end_date]"
    And I check "search_overview"
    And I uncheck "search_team_result_sheet"
    And I uncheck "search_agent_timesheet"
    And I select "TestCampaignReport1" from "all_campaigns"
    And I select "TestCampaignReport2" from "all_campaigns"
    And I follow translated "agent_timesheets.new.move_right" within "#campaigns_selection_div"
    And I select "test report user CC" from "all_call_centres"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    And I should see "48:00"
    And I should see "96:00"
    And I should see "384:00"
    And I should see "4"
    And I should see "14"
    And I should see "22"
    And I should see "143"
    And I should see "130"
    And I should see "286"

  @_done @_tested_elsewhere
  Scenario: I can see number of hours spent per day

  @_done @_tested_elsewhere
  Scenario: I can see total hours per day of week

  @_done @_tested_elsewhere
  Scenario: I can see total hours per week

  @_done @_tested_elsewhere
  Scenario: I can see total number of hours

  @_done @_tested_elsewhere
  Scenario: I can see table with week days grouped by week number for result

  @_done @_tested_elsewhere
  Scenario: I can see number of results per day

  @_done @_tested_elsewhere
  Scenario: I can see total results per day of week

  @_done @_tested_elsewhere
  Scenario: I can see total results per week

  @_done @_tested_elsewhere
  Scenario: I can see total number of results

  @_done @_tested_elsewhere
  Scenario: I can see table with week days grouped by week number for value

  @_done @_tested_elsewhere
  Scenario: I can see value per day

  @_done @_tested_elsewhere
  Scenario: I can see total value per day of week

  @_done @_tested_elsewhere
  Scenario: I can see total value per week

  @_done @_tested_elsewhere
  Scenario: I can see total value

