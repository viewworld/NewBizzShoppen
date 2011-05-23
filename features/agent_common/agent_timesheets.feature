@agent_campaign @requested @m11 @is
Feature: Agent time sheets

Scenario: I am automatically log out after 5 minutes

Scenario: I can see message box before I will be log out

Scenario: If I click Cancel on message box then I will be not log out

Scenario: After I log in to the system new Regular Log is created with start time and end time set to Time now and Time now plus 5 min

Scenario: Before I log out, end time of current Regular Log is set to Time now

Scenario: Before I execute any controller action then end time of current Regular Log is set to Time now plus 5 min

Scenario: If I execute any campaign controller first time then new Campaign Log is created with start time and end time set to Time now and Time now plus 5 min

Scenario: If I execute any campaign controller next time then end time current Campaign Log  is set to Time now plus 5 min

Scenario: If I execute any controller that is belongs to campaign controllers then end time of current Campaign Log is set to Time now

Scenario: Before I log out and Current Campaign Log exist then end time of this Log is set to Time now
