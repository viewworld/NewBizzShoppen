@m5 @agent_campaign
Feature: Agent campaign - calling session

# As agent

    #
    #
    #dashboard
    @1
    Scenario: I can see list of campaigns which I belong to


    #test
    #
    #calling session
    @3
    Scenario: New contacts should be assigned to agent automatically

    @1
    Scenario: I can enable/disable dynamic calling

    @3
    Scenario: I can navigate through contacts on call sheet when call is over
    
    @3
    Scenario: I can navigate through contacts details / results history / add result

    @1
    Scenario: I can see current call sheet

    @2
    Scenario: I can see contact form based on currently selected contact

    @1
    Scenario: I can see new result form for specifying notes and result

    @3
    Scenario: I can see new lead form for specifying information based on currently selected contact

    @2
    Scenario: I can see information about previous results for selected contact

    @3
    Scenario: system can make a call automatically for next contact on the list if dynamic calling is enabled
      #when current call is over and result has been given

    Scenario: system can call using http call for SNOME phones