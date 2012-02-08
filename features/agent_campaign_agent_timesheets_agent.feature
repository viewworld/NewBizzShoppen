@m26 @requested @agent_timesheets @ao
Feature: Agent timesheets - agent timesheet

  @selenium @_done @_tested
  Scenario: I should see average value per hour
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
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    And I follow "Agent timesheet"
    And I should see translated "agent_timesheets.index.agent_time_sheet.log_in"
    And I should see translated "agent_timesheets.index.agent_time_sheet.log_out"
    And I should see translated "agent_timesheets.index.agent_time_sheet.log_out_time"
    And I should see translated "agent_timesheets.index.agent_time_sheet.value"
    And I should see translated "agent_timesheets.index.agent_time_sheet.total_db"
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
    And I should see "0%"

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
  @m28 @requested @selenium @_done @_tested
  Scenario: I should see first log in / last log in instead of first value / last value
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
    And I check "search_agent_timesheet"
    And I select "Ted, Russia Today" from "all_call_centres"
    And I select "Alyona, Russia Today" from "all_agents"
    And I follow translated "agent_timesheets.new.move_right" within "#agents_selection_div"
    And I press translated "agent_timesheets.new.generate"
    And I click hidden link by url regex "/callers\/agent_timesheets\/new$/"
    And I click hidden link by url regex "/callers\/agent_timesheets\/1/"
    Then I should see translated "agent_timesheets.index.agent_time_sheet.log_in"
    And I should see translated "agent_timesheets.index.agent_time_sheet.log_out"

  #9877
  @m28 @requested @_done @_tested_elsewhere
  Scenario: I should see cost the same way as value created (for fixed value ((cost/completion rate)/total time spent)*agent's time spent)

  #9877
  @m28 @requested @tgn @_done @_tested_elsewhere
  Scenario: I should see total cost percent calculated as ((value created / Cost)-1)*100