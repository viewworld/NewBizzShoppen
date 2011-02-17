@m5b @agent_campaign @$_administrator @$_call_centre @tbo
Feature: Agent campaign - management

# As campaign administrator - admin or call centere

    #
    #
    #campaigns::index
    @3
 	  Scenario: I can see campaigns list

    @1
    Scenario: I can filter campaigns by active/inactive status
    
    @1
    Scenario: I can sort campaigns

    @1
    Scenario: I can remove selected campaign


    #campaigns::edit
    @3
    Scenario: I can specify general campaign information
      # name, category, country, start_date, end_date, number_of_visible_contacts_per_agent

    @3
    Scenario: I can see contacts list

    @3
    Scenario: I can see agents list

    @3
    Scenario: I can assign selected contacts to selected agent
      # question: may agent have more assigned contacts then visible contacts number
      # - no but when the agent registre a result for a contact- the contact is removed from the agens active calling list and asign to the reslt list. Then the agent is dynamicly assign a new contact.

    @2
    Scenario: I can remove contact from campaign

    @2
    Scenario: I can remove agent from campaign
    
    @1
    Scenario: I can deassign agents from selected contacts


    #
    #
    #campaigns::agents::new (popup?)
    @3
    Scenario: I can browse available freelance agents and call centers

    @2
    Scenario: I can assign selected agents to campaign

    #campaigns::agents::show
    @1
    Scenario: I can see agent results statistics in campaign

    @1
    Scenario: I can see agent recent results
    
    @3
    Scenario: I can see agent current call sheet
    
    @1
    Scenario: I can deassign contact from agent


    #
    #
    #campaigns::contacts::new (popup?)
    @3
    Scenario: I can import contacts as excel formatted list
      # question: creating multiple contacts to single lead (on different campaigns)
      # - a lead only has one contact, but if the same contact information is importet twice- in two different campiangs, it the same contact information can be assigend to to different leads
      
    @3
    Scenario: I can create single contact

    #campaigns::contacts::show
    @3
    Scenario: I can see contact details

    @1
    Scenario: I can see contact results

    @1
    Scenario: I can see current contact assignment
    
    @3
    Scenario: I can add new result
    
    @1
    Scenario: I can remove result


    #call results
    @2
    Scenario: I can set call back datetime for contact when result is "call back"
      #question: contact returns to pool and might be assigned to other agent at given date? - yes

    @2
    Scenario: contact is moved to bottom of call list when result is "not in"
      #question: deassign from agent and move to bottom or just to bottom of call sheet? - just to the bottom of call sheet

    @2
    Scenario: contact deassigned from agent when result is "Not interested"
      #question: should not contact be assignable or other agents? - no they shuld be moved to the result list- with the result not interested

    @2
    Scenario: call back date is set automatically based on fixed number of days when result is "Not interested now"
      #question: number of days needed. Should be assignable when call back date is out of campaign period?- The result not interested now should registere a call back date, and remove the contact from the campaign in the call back date is outside the campaing period

    @3
    Scenario: new lead should be created based on contact when result is "Upgrade to lead"
      #question: should form for editing new lead appear in popup? - no in same interface. - a smart - dynamic solution would be nice

    @2
    Scenario: I can set meeting datetime for contact when result is "Meeting booked"

    @2
    Scenario: I can enter text information on result when result is "Custom result"
      #question: should not contact be assignable or other agents?- 
      # - when the custom result is registered the contact should be removed from call list and put into the reslt list.


    #
    #
    #campaigns::show (statistics)
    @1
    Scenario: I can see general statistics for campaign (all time)
      # number of agents, contacts, calls, results

    @3
    Scenario: I can see results statistics for given time range

    @2
    Scenario: I can select time range from predefined ones: whole campaign, today, this week, this month

    @3
    Scenario: I can see results list for given date and result type

