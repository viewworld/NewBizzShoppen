@m15 @campaign_report @requested @is
Feature: Campaign report

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And campaign report data is generated
    And I follow translated "layout.main_menu.admin.reports"

  @_done @_tested @faircalls
  Scenario: I can see all values per campaign
    Then I should see translated "campaign_reports.index.empty_report_msg"
    And I press translated "campaign_reports.index.search_button"
    And I should see "TestCampaignReport1" within "#reports_table"
    And I should see "TestCampaignReport2" within "#reports_table"
    When I am not sign in
    And I visit domain http://faircalls.eu
    Then I am on the homepage
    And I sign in as testreportscca01@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre_agent.reports"
    And I press translated "campaign_reports.index.search_button"
    And I should see "TestCampaignReport1" within "#reports_table"
    And I should see "TestCampaignReport2" within "#reports_table"
    And I should see "test report user CCA1" within "#reports_table"
    When I am not sign in
    Then I am on the homepage
    And I sign in as testreportscc@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.reports"
    And I press translated "campaign_reports.index.search_button"
    And I should see "TestCampaignReport1" within "#reports_table"
    And I should see "TestCampaignReport2" within "#reports_table"

  @_done @tested_elsewhere
  Scenario: I can see target success rate

  @_done @tested_elsewhere
  Scenario: I can see realised success rate

  @_done @tested_elsewhere
  Scenario: I can see target number of finished contacts per hour

  @_done @tested_elsewhere
  Scenario: I can see realised number of finished contacts per hour

  @_done @tested_elsewhere
  Scenario: I can see target result type per hour for all selected result types

  @_done @tested_elsewhere
  Scenario: I can see realised result type per hour for all selected result types

  @_done @tested_elsewhere
  Scenario: I can see target value

  @_done @tested_elsewhere
  Scenario: I can see realised value

  # total number for campaign duration
  @_done @tested_elsewhere
  Scenario: I can see total number of contacts

  # final result type
  @_done @tested_elsewhere
  Scenario: I can see number of completed contacts

  # completed contacts / total number of contacts * 100%
  @_done @tested_elsewhere
  Scenario: I can see percentile of completed contacts

  @m0
  Scenario: I can see number of calls made

  # a sum of all the minutes spend on that contact not only on the final result
  @_done @tested_elsewhere
  Scenario: I can see average number of minutes spent per final result

  @m0
  Scenario: I can see number of calls per finished contact

  # sum values of final results
  @_done @tested_elsewhere
  Scenario: I can see value created

  # general not only in the time report is generated for
  @_done @tested_elsewhere
  Scenario: I can see value of leads sold

  @_done @tested_elsewhere
  Scenario: I can see total time spent (in hours)

  @_done @tested_elsewhere
  Scenario: I can see production cost when calculation in enabled for campaign

  @_done @tested_elsewhere
  Scenario: I can't see production cost when calculation is disabled for campaign

  # value created - production cost
  @_done @tested_elsewhere
  Scenario: I can see predicted result

  # leads sold - production cost
  @_done @tested_elsewhere
  Scenario: I can see realised result

  #9289
  @m26 @requested @_done @tested_elsewhere
  Scenario: I should see number of results instead of number of calls made

  #9289
  @m26 @requested @_done @tested_elsewhere
  Scenario: I should see avg number of results per finished contacts instead of avg number of calls

  #9289
  @m26 @requested @_done @tested_elsewhere
  Scenario: I should see avg number of minutes per final result

  #9289
  @m26 @requested @_done @tested_elsewhere
  Scenario: I should see number of results per minute
