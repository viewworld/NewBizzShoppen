@m13 @cost_calculation @requested
Feature: Cost calculation

  # radiobuttons for the following 4 options
  @$_administrator @$_call_centre
  Scenario: I can select a fixed cost for campaign and enter value

  @$_administrator @$_call_centre
  Scenario: I can select a agent's billing rate

  @$_administrator @$_call_centre
  Scenario: I can select fixed hourly rate and enter value

  @$_administrator @$_call_centre
  Scenario: I can select not to calculate costs

  @$_administrator @$_call_centre
  Scenario: I can specify agent's billing rate

  @$_administrator @$_call_centre
  Scenario: All rates should be stored additionally in Euro for reporting

  @$_call_centre_agent
  Scenario: Agent timesheets should include current agent's billing rate
