#5633
@m0 @timesheets
Feature: Timesheets

  @$_call_centre_agent
  Scenario: Agent can see time spent per day

  @$_call_centre_agent
  Scenario: Agent can see time spent per week

  @$_call_centre_agent
  Scenario: Agent can see time spent per month

  @$_call_centre_agent
  Scenario: Agent can see time spent per custom period of time

  @$_call_centre
  Scenario: Call centre can see time spent per day per agent and/or campaign

  @$_call_centre
  Scenario: Call centre can see time spent per week per agent and/or campaign

  @$_call_centre
  Scenario: Call centre can see time spent per month per agent and/or campaign

  @$_call_centre
  Scenario: Call centre can see time spent per custom period of time per agent and/or campaign

  @$_call_centre
  Scenario: Call centre can see time spent per day per campaign

  @$_call_centre
  Scenario: Call centre can see time spent per week per campaign

  @$_call_centre
  Scenario: Call centre can see time spent per month per campaign

  @$_call_centre
  Scenario: Call centre can see time spent per custom period of time per campaign

  @$_call_centre @$_call_centre_agent
  Scenario: I can see minutes per lead generated

  @$_call_centre @$_call_centre_agent
  Scenario: I can see average number of leads per day (7 hours)

  # sum of the value of the leads generated
  @$_call_centre @$_call_centre_agent
  Scenario: I can see Production value

  # the value of the leads that has been sold
  @$_call_centre @$_call_centre_agent
  Scenario: I can see Sales value

  @$_call_centre
  Scenario: I can access timesheets from campaigns result screen

  @$_call_centre_agent
  Scenario: I can access timesheets from new tab "Time"

  @$_call_centre
  Scenario: Call centre should be able to generate printable weekly/monthly report for all agents

  @$_call_centre
  Scenario: Call centre should be able to generate printable weekly/monthly report for selected agents
