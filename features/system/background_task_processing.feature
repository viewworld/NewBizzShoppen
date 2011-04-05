@$_system @background_tasks
Feature: Background task processing

@requested @m8b
Scenario: As admin I can by hand refresh counters and stats (delayed_job?)

@requested @m8b
Scenario: Rake tasks for counters and stats are refreshed periodically (cron job)

@requested @m8b @tgn @_done @tested_elsewhere
Scenario: Prices (totals) in stats for users should be represented in EURO