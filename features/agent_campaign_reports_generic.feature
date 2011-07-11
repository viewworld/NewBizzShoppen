@m15 @reports @requested @tgn
Feature: Reports
  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as blazejek@gmail.com with password secret
    And I follow translated "layout.main_menu.admin.reports"

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

  @_done @testes_elsewhere
  Scenario: I can generate campaign results report for a given week

  @_done @testes_elsewhere
  Scenario: I can generate campaign results report for given month

  @_done @testes_elsewhere
  Scenario: I can generate campaign results report for custom period of time