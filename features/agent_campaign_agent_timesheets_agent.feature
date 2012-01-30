@m26 @requested @agent_timesheets @ao
Feature: Agent timesheets - agent timesheet

  @selenium @_done @_tested
  Scenario: I should see average value per hour
    Given campaign report data is generated
    And campaign report user session logs are generated
    And additional timesheet report data is generated
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/agent_timesheets$/"
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
    And I click hidden link by url regex "/callers\/agent_timesheets$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    And I follow "Agent timesheet"
    And I should see translated "agent_timesheets.index.agent_time_sheet.first_result"
    And I should see translated "agent_timesheets.index.agent_time_sheet.last_result"
    And I should see translated "agent_timesheets.index.agent_time_sheet.log_out_time"
    And I should see translated "agent_timesheets.index.agent_time_sheet.value"
    When I check "show_all_agents"
    And I should see "16:00"
    And I should see "10"
    And I should see "130.00"
    And I should see "260.00"
    And I should see "32:00"
    And I should see "128:00"
    And I should see "14"
    And I should see "260.00"
    And I should see "26.00"

  @_done @_tested_elsewhere
  Scenario: I should see average result per hour

  @_done @_tested_elsewhere
  Scenario: I can see table gnerated for each week and divided by day of week

  @_done @_tested_elsewhere
  Scenario: I should see time of first result created each day

  @_done @_tested_elsewhere
  Scenario: I should see time of last result created each day

  # (First login time - Last log out time) - total time registered that day
  @_done @_tested_elsewhere
  Scenario: I should see logout time each day

  @_done @_tested_elsewhere
  Scenario: I should see hours worked each day

  @_done @_tested_elsewhere
  Scenario: I should see number of results generated each day

  @_done @_tested_elsewhere
  Scenario: I should see total value created each day

  @_done @_tested_elsewhere
  Scenario: I should see total for each week

  @_done @_tested_elsewhere
  Scenario: I should see totals for hours worked per day of week for all weeks

  @_done @_tested_elsewhere
  Scenario: I should see total number of results per day of week for all weeks

  @_done @_tested_elsewhere
  Scenario: I should see total value created per day of week for all weeks

  @_done @_tested_elsewhere
  Scenario: I should see average time first result was created each day of week

  @_done @_tested_elsewhere
  Scenario: I should see average time last result was created each day of week

  @_done @_tested_elsewhere
  Scenario: I should see average log out time each day of week

  @_done @_tested_elsewhere
  Scenario: I should see average value created each day of week

  @_done @_tested_elsewhere
  Scenario: I should see total hours worked each day of week

  @_done @_tested_elsewhere
  Scenario: I should see total number of results each day of week

  @_done @_tested_elsewhere
  Scenario: I should see total value created

  #9877
  @m28 @requested
  Scenario: I should see first log in / last log in instead of first value / last value

  #9877
  @m28 @requested
  Scenario: I should see cost the same way as value created (for fixed value ((cost/completion rate)/total time spent)*agent's time spent)

  #9877
  @m28 @requested
  Scenario: I should see total cost percent calculated as ((value created / Cost)-1)*100