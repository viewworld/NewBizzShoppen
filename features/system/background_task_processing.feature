@$_system @background_tasks
Feature: Background task processing

@requested @m8b @tgn @_tested
Scenario: As admin I can by hand refresh counters and stats (delayed_job?)
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration settings
  Then I should see translated "administration.settings.edit.view.title_stats"
  And I should see translated "administration.settings.edit.view.button_update_stats"

@requested @m8b @tgn @_done @non_testable
Scenario: Rake tasks for counters and stats are refreshed periodically (whenever)

@requested @m8b @tgn @_done @tested_elsewhere
Scenario: Prices (totals) in stats for users should be represented in EURO