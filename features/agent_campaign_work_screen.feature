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
    @_done @_tested
    Scenario: I can see list of campaigns which I belong to
      Then I should see "Testing One"
      And I should not see "Testing Two"

    #test
    #
    #calling session
    @_done @_tested
    Scenario: New contacts should be assigned to agent automatically
      Given user "translator_call_centre_agent@nbs.com" has not contacts assigned in campaign "Testing One"
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      Then user "translator_call_centre_agent@nbs.com" has contacts assigned in campaign "Testing One"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      And I should see "Mleko company"


    @_todo @snom
    Scenario: I can enable/disable dynamic calling

    @_done @_tested
    Scenario: I can navigate through contacts on call sheet when call is over
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      And the "contact_company_name" field should contain "Bon Jovi inc."
      And I follow translated action "campaigns.edit.show_button" within row containing "Stefanek corp"
      Then I should see "Stefanek corp" within "#contact_info"
      Then the "contact_company_name" field should contain "Stefanek corp"
    
    @_done @_tested_elsewhere
    Scenario: I can navigate through contacts details / results history / add result

    @_done @_tested @requested
    Scenario: I can go to previous/next contact through arrows
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And the "contact_company_name" field should contain "Bon Jovi inc."
      And I follow translated "contacts.edit.next"
      Then I should see "Mleko company" within "#contact_info"
      Then the "contact_company_name" field should contain "Mleko company"
      And I follow translated "contacts.edit.prev"
      Then I should see "Bon Jovi inc." within "#contact_info"
      Then the "contact_company_name" field should contain "Bon Jovi inc."  

    @_done @_tested
    Scenario: I can see current call sheet
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      Then user "translator_call_centre_agent@nbs.com" should see his available contacts

    @_done @_tested @requested
    Scenario: I can see pending calls list
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_pending_calls"
      Then user "translator_call_centre_agent@nbs.com" should see his pending contacts

    @_done @tested_elsewhere
    Scenario: I can see contact form based on currently selected contact

    @_done @_tested @selenium
    Scenario: I can see new result form for specifying notes and result
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Call back" from "result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see translated "call_results.new.form_title"
      And I fill in "Call back date" field with future datetime
      And I follow translated "call_results.new.save_button"
      Then I should see translated "call_results.create.flash.successfully_added"
      Then I wait 4 second
      When I follow translated "agent_work_screen.index.show_pending_calls"
      Then I should see "Bon Jovi inc." within "#pending_calls"

    @_done @_tested_elsewhere
    Scenario: I can see new lead form for specifying information based on currently selected contact

    @_done @_tested_elsewhere @requested
    Scenario: I can change lead category and system reloads template fields

    @_done @_tested_elsewhere
    Scenario: I can see information about previous results for selected contact

    @_done @nontestable @requested
    Scenario: I can see detailed information about result in tooltip

    @_todo @snom
    Scenario: system can make a call automatically for next contact on the list if dynamic calling is enabled
      #when current call is over and result has been given

    @_todo @snom
    Scenario: I can see current call duration

    @_todo @snom
    Scenario: I can see snom phone connecting interface with current connect status

    @_todo @snom
    Scenario: I can connect my snom phone using its ip address
      # http://kb.snom.com/kb/index.php?View=entry&CategoryID=21&EntryID=40

    @_todo @snom
    Scenario: I can control my snom phone remotely through its http interface
      # http://kb.snom.com/kb/index.php?View=entry&CategoryID=21&EntryID=40

    # 5192
    @m12 @requested @is @briefing
    Scenario: I should see briefing area when I click "Briefing" on agent work screen

    # 5192
    @m12 @requested @is @briefing
    Scenario: I can go back to my work screen when I click "Go to work screen"
        
    #5460
    @requested @m11 @ao @_done @_tested
    Scenario: I should be able to upload source materials to the repository of specific campaign
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/materials/"
      And attach the file "sample image" to "material_asset"
      And I press translated "materials.views.index.save_material"
      Then I should see "sample.jpg"

    #5460
    @requested @m11 @ao @_done @_tested
    Scenario: I should be able to browse the campaign repository and modify it (delete files unassigned to any results)
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/materials/"
      And attach the file "sample image" to "material_asset"
      And I press translated "materials.views.index.save_material"
      And I confirm a js popup on the next step
      And I follow translated "materials.views.index.delete_material"
      Then I should see translated "materials.views.index.successfully_deleted"
      And I should not see "sample.jpg"

    #5460
    @requested @m11 @ao @_done @_tested
    Scenario: I should be able to add new result called 'Send material' and upload new material or choose one from campaign repository
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Send material" from "result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I follow translated "materials.views.index.material_repository"
      And I wait 1 second
      And attach the file "sample image" to "material_asset"
      And I wait 1 second
      Then I should see "sample.jpg"
      And I follow "sample.jpg"
      Then I should see "sample.jpg"

    #5931
    @requested @m12 @ao
    Scenario: I can edit contact email when adding result type "send material"

    #5931
    @requested @m12 @ao
    Scenario: When I add result "send material" then an email should be sent to contact email

    # 5168
    @m11 @requested @ao @tested_elsewhere @_done
    Scenario: I can see a message when there are no more contacts in my campaign

    # 5168
    @m11 @requested @ao @tested_elsewhere @_done
    Scenario: I can see a message when there are only callback contacts in my campaign

    # 5777
    @m11 @requested @ao @_done @_tested
    Scenario: I can see new result form on the top of the page
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      Then I should see CSS path "#switch_campaign_form #result_id"

    # as call centre agent
    @m12 @requested @my_results @ao
    Scenario: I can access "My results" from agent work screen

    # A list of contacts which have results (including final results) assigend to them
    @m12 @requested @my_results @ao
    Scenario: I should see a list of contacts that have results assigned to them

    @m12 @requested @my_results @ao
    Scenario: I should see latest results on top of My results list

    @m12 @requested @my_results @ao
    Scenario: I can search contacts on My results list

    @m12 @requested @my_results @ao
    Scenario: I can edit contact when I click it on My results list

    @m12 @requested @my_results @ao
    Scenario: I can edit results when I click contact on My results list