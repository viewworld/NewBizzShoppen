@agent_campaign @_requested @m11 @is @faircalls
Feature: Agent time sheets

Background:
  Given I visit domain http://faircalls.eu
  And I am on the homepage

@_done @_not_testable @timesheets
Scenario: I am automatically log out after 5 minutes

@_done @_not_testable @timesheets
Scenario: I can see message box before I will be log out

@_done @_not_testable @timesheets
Scenario: If I click Cancel on message box then I will be not log out

@_done @_tested @timesheets
  Scenario: After I log in to the system new Regular Log is created with start time and end time set to Time now and Time now plus 5 min
    Then Count for model UserSessionLog is equal 0
    Then I sign in as agent@nbs.com with password secret
    Then Count for model UserSessionLog is equal 1
    Then Last regular UserSessionLog is valid after create
    Then I wait 5 second
    Then I follow translated "layout.main_menu.shared.home"
    Then Last regular UserSessionLog is valid after invoke some controller action
    Then I go to the logout page
    Then Last regular UserSessionLog is valid after close
    Then Count for model UserSessionLog is equal 1

@_done @_tested_elsewhere @timesheets
Scenario: Before I log out, end time of current Regular Log is set to Time now

@_done @_tested_elsewhere @timesheets
Scenario: Before I execute any controller action then end time of current Regular Log is set to Time now plus 5 min

@_done @_tested @timesheets
Scenario: If I execute any campaign controller first time then new Campaign Log is created with start time and end time set to Time now and Time now plus 5 min
  Then Count for model UserSessionLog is equal 0
  Then I sign in as translator_call_centre_agent@nbs.com with password secret
  Then Count for model UserSessionLog is equal 1
  Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
  And I click hidden link by url regex "/callers\/campaigns\/\d+\/agent_work_screen/"
  Then Count for model UserSessionLog is equal 2
  Then Last campaign UserSessionLog is valid after create
  Then I wait 5 second
  Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
  And I click hidden link by url regex "/callers\/campaigns\/\d+\/agent_work_screen/"
  Then Last campaign UserSessionLog is valid after invoke some controller action
  Then Last regular UserSessionLog is valid after invoke some controller action
  Then I follow translated "layout.main_menu.shared.home"
  Then Last campaign UserSessionLog is valid after close
  Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
  And I click hidden link by url regex "/callers\/campaigns\/\d+\/agent_work_screen/"
  Then Count for model UserSessionLog is equal 4
  Then Last campaign UserSessionLog is valid after create
  Then I wait 5 second
  Then I follow translated "layout.main_menu.call_centre_agent.campaigns"
  And I click hidden link by url regex "/callers\/campaigns\/\d+\/agent_work_screen/"
  Then Last campaign UserSessionLog is valid after invoke some controller action
  Then I go to the logout page
  Then Last campaign UserSessionLog is valid after close
  Then Last regular UserSessionLog is valid after close

@_done @_tested_elsewhere @timesheets
Scenario: If I execute any campaign controller next time then end time current Campaign Log is set to Time now plus 5 min

@_done @_tested_elsewhere @timesheets
Scenario: If I execute any controller that is belongs to campaign controllers then end time of current Campaign Log is set to Time now

@_done @_tested_elsewhere @timesheets
Scenario: Before I log out and Current Campaign Log exist then end time of this Log is set to Time now
