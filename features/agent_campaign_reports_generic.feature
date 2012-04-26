@m15 @reports @_requested @tgn
Feature: Reports
  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/callers\/campaign_reports$/"

  @_done @_tested
  Scenario: I can select which campaign to include in report (active, finished)
    Then I should see translated "campaign_reports.index.search.active"
    Then I should see translated "campaign_reports.index.search.inactive"

  @_done @_tested
  Scenario: I can generate campaign results report for given day
    Then I should see translated "campaigns.show.ranges.this_month"
    Then I should see translated "campaigns.show.ranges.this_week"
    Then I should see translated "campaigns.show.ranges.today"
    Then I should see translated "campaigns.show.search.date_from"
    Then I should see translated "campaigns.show.search.date_to"

  @_done @tested_elsewhere
  Scenario: I can generate campaign results report for a given week

  @_done @tested_elsewhere
  Scenario: I can generate campaign results report for given month

  @_done @tested_elsewhere
  Scenario: I can generate campaign results report for custom period of time

  @m18 @admin_reports @selenium @_done @_tested @tgn
  Scenario: As admin I can generate report for one selected call centre
    Given I have user with email call_centre_test01@nbs.com and role call_centre
    And an user with role call_centre_agent and email cc_test01_agent01@nbs.com belongs to call centre call_centre_test01@nbs.com
    And an user with role call_centre_agent and email cc_test01_agent02@nbs.com belongs to call centre call_centre_test01@nbs.com
    And I click hidden link by url regex "/callers\/campaign_reports$/"
    Then I should see translated "campaigns.show.search.call_centres"
    And I should see translated "campaigns.show.search.call_centre_agents"
    And I select "call_centre_test01@nbs.com" from "call_centre_id"
    And I wait 2 second
    And "call_centre_agent_ids" dropdown should have values "cc_test01_agent01@nbs.com,cc_test01_agent02@nbs.com"

  @m18 @admin_reports @_done @tested_elsewhere @tgn
  Scenario: As admin I can generate report for one or more selected agents

  #9889
  @m28 @_requested @tgn @_done @_tested_elsewhere
  Scenario: Dynamic result value should be included into reports

  @m30 @_requested @tgn @_done @_tested_elsewhere
  Scenario: When I choose some results for campaign then the results set shown in table's column Status should be scoped but not the numerical values in the report

  #11050
  @m33 @_requested @_done @_non_testable @tgn
  Scenario: I should be able to add tags to results