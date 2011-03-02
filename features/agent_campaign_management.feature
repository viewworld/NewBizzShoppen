@m5b @agent_campaign @$_administrator @$_call_centre @tbr
Feature: Agent campaign - management

# As campaign administrator - admin or call centere

    #
    #
    #campaigns::index
    @3 @is @__campaigns_listing
 	  Scenario: I can see campaigns list

    @1 @is @__campaigns_listing
    Scenario: I can filter campaigns by active/inactive status
    
    @1 @is @__campaigns_listing
    Scenario: I can sort campaigns

    @1 @is @__campaigns_listing
    Scenario: I can filter campaigns by name

    @1 @is @__campaigns_listing
    Scenario: I can remove selected campaign
    
    @2 @is @__campaigns_listing
    Scenario: I can create new campaign


    #campaigns::edit
    @3 @is @__campaign_manage
    Scenario: I can specify general campaign information
      # name, category, country, start_date, end_date, number_of_visible_contacts_per_agent

    @3 @is @__campaign_manage
    Scenario: I can see contacts list
    
    @1 @is @__campaign_manage
    Scenario: I can sort contacts list    

    @3 @is @__campaign_manage
    Scenario: I can assign selected contacts to selected agent
      # question: may agent have more assigned contacts then visible contacts number
      # - no but when the agent registre a result for a contact- the contact is removed from the agens active calling list and asign to the reslt list. Then the agent is dynamicly assign a new contact.

    @2 @is @__campaign_manage
    Scenario: I can remove contact from campaign
    
    @1 @is @__campaign_manage
    Scenario: I can deassign agents from selected contacts

    @1 @is @__campaign_manage
    Scenario: I can filter contacts by its fields

    @3 @is @__campaign_manage
    Scenario: I can export selected contacts to CSV

    #
    #
    #campaigns::agents::new (popup?)
    @3 @is @__campaign_assign_agents
    Scenario: I can browse available freelance agents and call centers

    @2 @is @__campaign_assign_agents
    Scenario: I can assign selected agents to campaign
    
    @1 @is @__campaign_assign_agents
    Scenario: I can deassign not selected agents to campaign    

    #
    #
    #campaigns::contacts::new (popup?)
    @3 @is @__campaign_import_contacts
    Scenario: I can import contacts as excel formatted list
      # question: creating multiple contacts to single lead (on different campaigns)
      # - a lead only has one contact, but if the same contact information is importet twice- in two different campiangs, it the same contact information can be assigend to to different leads
      
    @3 @is @__campaign_import_contacts
    Scenario: I can create single contact

    #campaigns::contacts::edit
    @3 @is @__campaign_import_contacts
    Scenario: I can see contact details

    @1 @is @__campaign_import_contacts
    Scenario: I can see contact results

    @1 @is @__campaign_import_contacts
    Scenario: I can see current contact assignment
    
    @3 @tbr @__campaign_manage_results
    Scenario: I can add new result
    
    @2 @tbr @__campaign_manage_results
    Scenario: I can edit result    
    
    @1 @is @__campaign_manage_results
    Scenario: I can remove result
    
    @3 @is @__campaign_manage_results
    Scenario: I can see template fields for current category
    #dynamically loaded via ajax


    #call results
    @2 @tbr @__campaign_manage_results
    Scenario: I can set call back datetime for contact when result is "call back"
      #question: contact returns to pool and might be assigned to other agent at given date? - yes

    @2 @tbr @__campaign_manage_results
    Scenario: contact is moved to bottom of call list when result is "not in"
      #question: deassign from agent and move to bottom or just to bottom of call sheet? - just to the bottom of call sheet

    @2 @tbr @__campaign_manage_results
    Scenario: contact deassigned from agent when result is "Not interested"
      #question: should not contact be assignable or other agents? - no they shuld be moved to the result list- with the result not interested

    @2 @tbr @__campaign_manage_results
    Scenario: call back date is set automatically based on fixed number of days when result is "Not interested now"
      #question: number of days needed. Should be assignable when call back date is out of campaign period?- The result not interested now should registere a call back date, and remove the contact from the campaign in the call back date is outside the campaing period

    @3 @tbr @__campaign_manage_results
    Scenario: new lead should be created based on contact when result is "Upgrade to lead"
      #question: should form for editing new lead appear in popup? - no in same interface. - a smart - dynamic solution would be nice

    @2 @tbr @__campaign_manage_results
    Scenario: I can set meeting datetime for contact when result is "Meeting booked"

    @2 @tbr @__campaign_manage_results
    Scenario: I can enter text information on result when result is "Custom result"
      #question: should not contact be assignable or other agents?- 
      # - when the custom result is registered the contact should be removed from call list and put into the reslt list.


    #
    #
    #campaigns::show (statistics)
    @1 @tbr @__campaign_statistics
    Scenario: I can see general statistics for campaign (all time)
      # number of agents, contacts, calls, results

    @3 @tbr @__campaign_statistics
    Scenario: I can see results statistics for given time range

    @2 @tbr @__campaign_statistics
    Scenario: I can select time range from predefined ones: whole campaign, today, this week, this month

    @3 @tbr @__campaign_statistics
    Scenario: I can see results list for given date and result type
    
    @2 @tbr @__campaign_statistics
    Scenario: I can see results list for given agent list
    
    @2 @tbr @__campaign_statistics
    Scenario: I can see results list for completed contacts only

