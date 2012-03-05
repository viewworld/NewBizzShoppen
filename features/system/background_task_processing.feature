@$_system @background_tasks
Feature: Background task processing

@_requested @m8b @tgn @_tested @_done
Scenario: As admin I can by hand refresh counters and stats (delayed_job?)
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret
  And I go to administration users
  And I should see translated "administration.settings.edit.view.button_update_stats"

@_requested @m8b @tgn @_done @non_testable
Scenario: Rake tasks for counters and stats are refreshed periodically (whenever)

@_requested @m8b @tgn @_done @_tested_elsewhere
Scenario: Prices (totals) in stats for users should be represented in EURO