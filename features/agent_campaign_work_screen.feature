@m5b @agent_campaign @$_call_centre_agent @tbr @__campaign_calling_session @selenium
Feature: Agent campaign - calling session

   Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.campaigns"

    #
    #
    #dashboard
    @1 @_done @_tested
    Scenario: I can see list of campaigns which I belong to
      Then I should see "Testing One"
      And I should not see "Testing Two"

    #test
    #
    #calling session
    @3 @_done @_tested
    Scenario: New contacts should be assigned to agent automatically
      Given user "translator_call_centre_agent@nbs.com" has not contacts assigned in campaign "Testing One"
      When I follow translated "campaigns.table.go_to_work_screen"
      Then user "translator_call_centre_agent@nbs.com" has contacts assigned in campaign "Testing One"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      And I should see "Mleko company"


    @1 @_todo @snom
    Scenario: I can enable/disable dynamic calling

    @3 @_done @_tested
    Scenario: I can navigate through contacts on call sheet when call is over
      When I follow translated "campaigns.table.go_to_work_screen"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      And the "contact_company_name" field should contain "Bon Jovi inc."
      And I follow translated action "campaigns.edit.show_button" within row containing "Stefanek corp"
      Then I should see "Stefanek corp" within "#contact_info"
      Then the "contact_company_name" field should contain "Stefanek corp"
    
    @3 @_done @_tested_elsewhere
    Scenario: I can navigate through contacts details / results history / add result

    @1 @_done @_tested @requested
    Scenario: I can go to previous/next contact through arrows
      When I follow translated "campaigns.table.go_to_work_screen"
      And the "contact_company_name" field should contain "Bon Jovi inc."
      And I follow translated "contacts.edit.next"
      Then I should see "Mleko company" within "#contact_info"
      Then the "contact_company_name" field should contain "Mleko company"
      And I follow translated "contacts.edit.prev"
      Then I should see "Bon Jovi inc." within "#contact_info"
      Then the "contact_company_name" field should contain "Bon Jovi inc."  

    @1 @_done @_tested
    Scenario: I can see current call sheet
      When I follow translated "campaigns.table.go_to_work_screen"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      Then user "translator_call_centre_agent@nbs.com" should see his available contacts

    @1 @_done @_tested @requested
    Scenario: I can see pending calls list
      When I follow translated "campaigns.table.go_to_work_screen"
      And I follow translated "agent_work_screen.index.show_pending_calls"
      Then user "translator_call_centre_agent@nbs.com" should see his pending contacts

    @2 @_done @tested_elsewhere
    Scenario: I can see contact form based on currently selected contact

    @1 @_done @_tested
    Scenario: I can see new result form for specifying notes and result
      When I follow translated "campaigns.table.go_to_work_screen"
      And I select "Call back" from "result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see translated "call_results.new.form_title"
      And I fill in "Call back date" field with future datetime
      And I press translated "call_results.new.save_button"
      Then I should see translated "call_results.create.flash.successfully_added"
      When I follow translated "agent_work_screen.index.show_pending_calls"
      Then I should see "Bon Jovi inc." within "#pending_calls"

    @3 @_done @_tested_elsewhere
    Scenario: I can see new lead form for specifying information based on currently selected contact

    @3 @_done @_tested_elsewhere @requested
    Scenario: I can change lead category and system reloads template fields

    @2 @_done @_tested_elsewhere
    Scenario: I can see information about previous results for selected contact

    @3 @_done @nontestable @requested
    Scenario: I can see detailed information about result in tooltip

    @3 @_todo @snom
    Scenario: system can make a call automatically for next contact on the list if dynamic calling is enabled
      #when current call is over and result has been given

    @2 @_todo @snom
    Scenario: I can see current call duration

    @3 @_todo @snom
    Scenario: I can see snom phone connecting interface with current connect status

    @3 @_todo @snom
    Scenario: I can connect my snom phone using its ip address
      # http://kb.snom.com/kb/index.php?View=entry&CategoryID=21&EntryID=40

    @3 @_todo @snom
    Scenario: I can control my snom phone remotely through its http interface
      # http://kb.snom.com/kb/index.php?View=entry&CategoryID=21&EntryID=40    