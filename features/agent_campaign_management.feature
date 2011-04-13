@m5b @agent_campaign @$_administrator @$_call_centre @tbr
Feature: Agent campaign - management

#Places                Admin   Agent   Call Centre   Call Centre Agent
#
#Campaigns List        x       x*      x^            x*
#Campaign Result       x       -       x^            -
#Manage Result Types   x       -       x^            -
#Edit Campaign         x       -       x^            x
#Agent work screen     x       x       x             x

#* - without actions
#^ - only created by me

   Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I sign in as translator_call_centre@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.campaigns"
    Then I should see "Testing One"

# As campaign administrator - admin or call centre

    #
    #
    #campaigns::index
    @3 @is @__campaigns_listing @_done
 	  Scenario: I can see campaigns list

    @1 @is @__campaigns_listing @_done
    Scenario: I can filter campaigns by active/inactive status
    
    @1 @is @__campaigns_listing @_done
    Scenario: I can sort campaigns

    @1 @is @__campaigns_listing @_done
    Scenario: I can filter campaigns by name

    @1 @is @__campaigns_listing @_done
    Scenario: I can remove selected campaign
    
    @2 @is @__campaigns_listing @_done
    Scenario: I can create new campaign


    #campaigns::edit
    @3 @is @__campaign_manage @_done
    Scenario: I can specify general campaign information
      # name, category, country, start_date, end_date, number_of_visible_contacts_per_agent

    @3 @is @__campaign_manage @_done
    Scenario: I can see contacts list
    
    @1 @is @__campaign_manage @_done
    Scenario: I can sort contacts list    

    @3 @is @__campaign_manage @_done
    Scenario: I can assign selected contacts to selected agent
      # question: may agent have more assigned contacts then visible contacts number
      # - no but when the agent registre a result for a contact- the contact is removed from the agens active calling list and asign to the reslt list. Then the agent is dynamicly assign a new contact.

    @2 @is @__campaign_manage @_done
    Scenario: I can remove contact from campaign
    
    @1 @is @__campaign_manage @_done
    Scenario: I can deassign agents from selected contacts

    @1 @is @__campaign_manage @_done
    Scenario: I can filter contacts by its fields

    @3 @is @__campaign_manage @_todo
    Scenario: I can export selected contacts to CSV

    #
    #
    #campaigns::agents::new (popup?)
    @3 @is @__campaign_assign_agents @_done
    Scenario: I can browse available freelance agents and call centers

    @2 @is @__campaign_assign_agents @_done
    Scenario: I can assign selected agents to campaign
    
    @1 @is @__campaign_assign_agents @_done
    Scenario: I can deassign not selected agents to campaign

    #
    #
    #campaigns::contacts::new (popup?)
    @3 @is @__campaign_import_contacts @_todo
    Scenario: I can import contacts as excel formatted list
      # question: creating multiple contacts to single lead (on different campaigns)
      # - a lead only has one contact, but if the same contact information is importet twice- in two different campiangs, it the same contact information can be assigend to to different leads
      
    @3 @is @__campaign_import_contacts @_done
    Scenario: I can create single contact

    #campaigns::contacts::edit
    @3 @is @__campaign_import_contacts @_done
    Scenario: I can see contact details

    @1 @is @__campaign_import_contacts @_done
    Scenario: I can see contact results

    @1 @is @__campaign_import_contacts @_done
    Scenario: I can see current contact assignment
    
    @3 @is @__campaign_manage_results @_done
    Scenario: I can add new result
    
    @2 @is @__campaign_manage_results @_done
    Scenario: I can edit result    
    
    @1 @is @__campaign_manage_results @_done
    Scenario: I can remove result
    
    @3 @is @__campaign_manage_results @_done
    Scenario: I can see template fields for current category
    #dynamically loaded via ajax
    
    @3 @tbr @__campaign_manage_results @_done @_tested
    Scenario: I can go to previous/next contact edit page through arrows
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I should see "Bon Jovi inc."
      And I click hidden link by url regex "/call_centres\/campaigns\/\d+\/contacts\/\d+\/edit/"
      And I should see translated "contacts.edit.current_agent_label"
      Then the "Company name" field should contain "Bon Jovi inc."
      When I follow "next_contact"
      Then the "Company name" field should contain "Mleko company"
      When I follow "prev_contact"
      Then the "Company name" field should contain "Bon Jovi inc."      

    #
    #
    #campaigns::agents::manage_results_types
    @1 @tbr @__campaign_manage_result_types @_done @_tested
    Scenario: I can see list of generic call log results
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Call back"
      And I should see "Not interested now"
      And I should see "Not in"
      


    @2 @tbr @__campaign_manage_result_types @_done
    Scenario: I can see list of custom call log results

    @1 @tbr @__campaign_manage_result_types @_done @_tested
    Scenario: I can see list of generic final results
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Not interested"
      And I should see "Upgraded to lead"
      And I should see "Meeting booked"
      And I should see "Custom result"

    @2 @tbr @__campaign_manage_result_types @_done
    Scenario: I can see list of custom final results

    @1 @tbr @__campaign_manage_result_types @_done
    Scenario: I can assign custom results to campaign

    @2 @tbr @__campaign_manage_result_types @_done
    Scenario: I can assign generic results to campaign

    @3 @tbr @__campaign_manage_result_types @_done @selenium @_tested 
    Scenario: I can manage call log results
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/results\/new\?type=call_log/"
      And I should see translated "results.new.call_log_result"
      And I fill in "Name" with "I am on fire"
      And I follow translated "shared.lead_templates.form.new_lead_template_field"
      And I fill in "result_result_fields_attributes_0_name" with "Some text"
      And I check "result_result_fields_attributes_0_is_mandatory"
      And I press translated "administration.lead_templates.new.view.button_create"
      Then I should see "I am on fire"
      And I should see "Some text"

    @3 @tbr @__campaign_manage_result_types @_done @selenium @_tested
    Scenario: I can manage final results
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/results\/new\?type=final/"
      And I should see translated "results.new.final_result"
      And I fill in "Name" with "I am on fire"
      And I follow translated "shared.lead_templates.form.new_lead_template_field"
      And I fill in "result_result_fields_attributes_0_name" with "Some text"
      And I check "result_result_fields_attributes_0_is_mandatory"
      And I press translated "administration.lead_templates.new.view.button_create"
      Then I should see "I am on fire"
      And I should see "Some text"

    @3 @tbr @__campaign_manage_result_types @_done 
    Scenario: I can add custom fields to result type
    
    @1 @tbr @__campaign_manage_result_types @_done 
    Scenario: I can see list of fields in result types list
    
    @3 @tbr @__campaign_manage_result_types @_todo
    Scenario: I can select "time" type for custom field in result type

    @3 @tbr @__campaign_manage_result_types @_todo
    Scenario: I custom fields values should validate correct format

    #call results
    #
    # GENERIC RESULT TYPES
    #
    @2 @tbr @__campaign_manage_results @_done
    Scenario: I can set call back datetime for contact when result is "call back"
      #question: contact returns to pool and might be assigned to other agent at given date? - yes

    @2 @tbr @__campaign_manage_results @_done
    Scenario: contact is moved to bottom of call list when result is "not in"
      #question: deassign from agent and move to bottom or just to bottom of call sheet? - just to the bottom of call sheet

    @2 @tbr @__campaign_manage_results @_done
    Scenario: contact deassigned from agent when result is "Not interested"
      #question: should not contact be assignable or other agents? - no they shuld be moved to the result list- with the result not interested

    @2 @tbr @__campaign_manage_results @_done
    Scenario: call back date is set automatically based on fixed number of days when result is "Not interested now"
      #question: number of days needed. Should be assignable when call back date is out of campaign period?- The result not interested now should registere a call back date, and remove the contact from the campaign in the call back date is outside the campaing period

    @3 @tbr @__campaign_manage_results @_done
    Scenario: new lead should be created based on contact when result is "Upgrade to lead"
      #question: should form for editing new lead appear in popup? - no in same interface. - a smart - dynamic solution would be nice

    @2 @tbr @__campaign_manage_results @_done
    Scenario: I can set meeting datetime for contact when result is "Meeting booked"


    #call results
    #
    # CUSTOM RESULT TYPES
    #
    @3 @tbr @__campaign_manage_results @_done
    Scenario: I can add custom call log result

    @3 @tbr @__campaign_manage_results @_done
    Scenario: I can add custom final result

      
    #
    #
    #campaigns::show (statistics)
    @1 @is @__campaign_statistics @_todo
    Scenario: I can see general statistics for campaign (all time)
      # number of agents, contacts, calls, results

    @3 @is @__campaign_statistics @_todo
    Scenario: I can see results statistics for given time range

    @2 @is @__campaign_statistics @_todo
    Scenario: I can select time range from predefined ones: whole campaign, today, this week, this month

    @3 @is @__campaign_statistics @_todo
    Scenario: I can see results list for given date and result type
    
    @2 @is @__campaign_statistics @_todo
    Scenario: I can see results list for given agent list
    
    @2 @is @__campaign_statistics @_todo
    Scenario: I can see results list for completed contacts only

