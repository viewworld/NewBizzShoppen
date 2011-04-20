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
    @3 @is @__campaigns_listing @_tested @_done
 	Scenario: I can see campaigns list
      Then I should see translated "campaigns.header.title"
      Then I should see translated "campaigns.header.new_campaign_button"

    @1 @is @__campaigns_listing @_tested @_done
    Scenario: I can filter campaigns by active/inactive status
      Then I select translated "campaigns.filter.state_select_active" from "search_with_state"
      Then I press translated "campaigns.filter.search_button"
      Then I should see "Testing One"
      Then I should not see "Testing Two"
      Then I select translated "campaigns.filter.state_select_inactive" from "search_with_state"
      Then I press translated "campaigns.filter.search_button"
      Then I should see "Testing Two"
      Then I should not see "Testing One"

    @1 @is @__campaigns_listing @_tested @_done
    Scenario: I can sort campaigns
      Then I follow translated "campaigns.table.name"
      Then I should see "Testing One" before "Testing Two"
      Then I follow translated "campaigns.table.name"
      Then I should see "Testing Two" before "Testing One"
      Then I follow translated "campaigns.table.category"
      Then I should see "Business" before "Electronics"
      Then I follow translated "campaigns.table.category"
      Then I should see "Electronics" before "Business"
      Then I follow translated "campaigns.table.country"
      Then I should see "Denmark" before "United Kingdom"
      Then I follow translated "campaigns.table.country"
      Then I should see "United Kingdom" before "Denmark"
      Then I follow translated "campaigns.table.start_date"
      Then I should see "Testing Two" before "Testing One"
      Then I follow translated "campaigns.table.start_date"
      Then I should see "Testing One" before "Testing Two"
      Then I follow translated "campaigns.table.end_date"
      Then I should see "Testing Two" before "Testing One"
      Then I follow translated "campaigns.table.end_date"
      Then I should see "Testing One" before "Testing Two"

    @1 @is @__campaigns_listing @_tested @_done
    Scenario: I can filter campaigns by name
      Then I fill in "search_with_keyword" with "two"
      Then I press translated "campaigns.filter.search_button"
      Then I should see "Testing Two"
      Then I should not see "Testing One"

    @1 @is @__campaigns_listing @_done @_tested
    Scenario: I can remove selected campaign
      Then I follow translated "campaigns.index.destroy"
      Then I should not see "Testing One"
      Then I should see "Campaign was successfully destroyed"
      Then I should see "Testing Two"

    @2 @is @__campaigns_listing @_tested @_done @selenium
    Scenario: I can create new campaign
      Then I click xpath "//ul[@class='header_actions']//a"
      Then I fill in "campaign_name" with "Testing Creation"
      Then I fill in "campaign_max_contact_number" with "188"
      Then I fill in "campaign_start_date" with "2011-11-11"
      Then I fill in "campaign_end_date" with "2011-12-12"
      Then I select "Leisure" from "campaign_category_id"
      Then I select "United Kingdom" from "campaign_country_id"
      Then I press "campaign_submit"
      Then I should see "Campaign was successfully created"
      And I follow translated "layout.main_menu.call_centre.campaigns"
      Then I should see "2011-11-11"
      Then I should see "2011-12-12"
      Then I should see "Testing Creation"
      Then I should see "Leisure"

    #campaigns::edit
    # name, category, country, start_date, end_date, number_of_visible_contacts_per_agent
    @3 @is @__campaign_manage @_tested
    Scenario: I can specify general campaign information
      Then I follow translated "campaigns.index.edit"
      Then I fill in "campaign_name" with "Testing Changed"
      Then I fill in "campaign_max_contact_number" with "188"
      Then I fill in "campaign_start_date" with "2011-11-11"
      Then I fill in "campaign_end_date" with "2011-12-12"
      Then I select "Leisure" from "campaign_category_id"
      Then I select "United Kingdom" from "campaign_country_id"
      Then I press "campaign_submit"
      Then I should see "Campaign was successfully updated"
      And I follow translated "layout.main_menu.call_centre.campaigns"
      Then I should see "2011-11-11"
      Then I should see "2011-12-12"
      Then I should see "Testing Changed"
      Then I should see "Leisure"
      Then I should not see "Denmark"

    @3 @is @__campaign_manage @_tested @_done
    Scenario: I can see contacts list
      Then I follow translated "campaigns.index.edit"
      Then I should see translated "campaigns.edit.title_contacts"
      Then I should see translated "campaigns.edit.button_create_contact"

    @1 @is @__campaign_manage @_tested @_done
    Scenario: I can sort contacts list
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "contacts.table.company_name"
      Then I should see "Bon Jovi" before "Mleko company"
      Then I follow translated "contacts.table.company_name"
      Then I should see "Mleko company" before "Bon Jovi"

    # question: may agent have more assigned contacts then visible contacts number
    # - no but when the agent registre a result for a contact- the contact is removed from the agens active calling list and asign to the reslt list. Then the agent is dynamicly assign a new contact.
    @3 @is @__campaign_manage @_done @tested_elsewhere @selenium
    Scenario: I can assign selected contacts to selected agent

    @2 @is @__campaign_manage @_tested
    Scenario: I can remove contact from campaign
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.remove_button"
      Then I should see "Contact was successfully destroyed"
      Then I should not see "Bon Jovi"

    @1 @is @__campaign_manage @_done @tested_elsewhere
    Scenario: I can deassign agents from selected contacts

    @1 @is @__campaign_manage @_tested @selenium
    Scenario: I can filter contacts by its fields
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then I should see "Bon Jovi"
      Then I should see "Mleko"
      Then I fill in "search_with_keyword" with "bon"
      Then I click xpath "//form[@id='search_new']//a"
      Then I should see "Bon Jovi"
      Then I should not see "Mleko"

    @3 @tbr @__campaign_manage @_done
    Scenario: I can export selected contacts to CSV

    #
    #
    #campaigns::agents::new (popup?)
    @3 @is @__campaign_assign_agents @_tested
    Scenario: I can browse available freelance agents and call centers
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.agent_assignment_button"
      Then I should see "John Smith"

    @2 @is @__campaign_assign_agents @tested_elsewhere
    Scenario: I can assign selected agents to campaign

    @1 @is @__campaign_assign_agents @_tested @selenium
    Scenario: I can deassign not selected agents to campaign
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then I follow translated "campaigns.edit.agent_assignment_button"
      Then I should see "1" within "#campaigns"
      Then I click xpath "(//table[@id='campaigns']//input[@type='checkbox'])[2]"
      Then I click xpath "//tr[@class='main_actions']//a"
      Then I click xpath "//div[@class='frm_head']//a"
      Then I should not see "1" within "#campaigns"
      Then I click xpath "(//table[@id='campaigns']//input[@type='checkbox'])[2]"
      Then I click xpath "//tr[@class='main_actions']//a"
      Then I click xpath "//div[@class='frm_head']//a"
      Then I should see "1" within "#campaigns"

    #
    #
    #campaigns::contacts::new (popup?)
    @3 @tbr @__campaign_import_contacts @_done
    Scenario: I can import contacts as excel formatted list
      # question: creating multiple contacts to single lead (on different campaigns)
      # - a lead only has one contact, but if the same contact information is importet twice- in two different campiangs, it the same contact information can be assigend to to different leads

    @3 @is @__campaign_import_contacts @_tested
    Scenario: I can create single contact
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.button_create_contact"
      Then I should see translated "contacts.new.title_new_contact"
      Then I press translated "contacts.new.create_button"
      Then I should see "can't be blank"
      Then I fill in "contact_company_name" with "Winter fresh"
      Then I fill in "contact_company_phone_number" with "777777777"
      Then I select "United Kingdom" from "contact_country_id"
      Then I press translated "contacts.new.create_button"
      Then I should see "Winter fresh"
      Then I should see "777777777"
      Then I should see "United Kingdom"

    #campaigns::contacts::edit
    @3 @is @__campaign_import_contacts @_tested
    Scenario: I can see contact details
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.edit_button"
      Then I should see translated "contacts.edit.title"
      Then I should see translated "contacts.edit.title"

    #create => edit => destroy is tested here as well
    @1 @is @__campaign_import_contacts @_tested @selenium
    Scenario: I can see contact results
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/contacts\/\d+\/edit/"
      Then I click xpath "//form[@id='new_call_result']//a"
      Then I fill in "call_result_note" with "this is real deal!"
      Then I fill in "call_result_result_values_attributes_0_value" with "2012-04-22 14:35"
      Then I press translated "call_results.new.save_button"
      Then I should see "Call back" within "#call_results"
      Then I should see "Johnny Mnemonic" within "#call_results"
      When I click hidden link by url regex "/callers\/contacts\/\d+\/call_results\/\d+\/edit/"
      Then I fill in "call_result_note" with "this NOT COOL!!!!"
      Then I press translated "call_results.edit.save_button"
      Then I should see "Call result was successfully updated"
      Then I execute js for display action block for "call_results"
      Then I confirm a js popup on the next step
      Then I follow translated "call_results.table.remove_link"
      Then I should see "Call result was successfully destroyed"
      Then I should not see "Call back" within "#call_results"
      Then I should not see "Johnny Mnemonic" within "#call_results"

    @3 @is @__campaign_manage_results @_done @tested_elsewhere
    Scenario: I can add new result

    @2 @is @__campaign_manage_results @_done @tested_elsewhere
    Scenario: I can edit result

    @1 @is @__campaign_manage_results @_done @tested_elsewhere
    Scenario: I can remove result

    @1 @is @__campaign_import_contacts @_tested @selenium
    Scenario: I can see current contact assignment
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then agent for "Bon Jovi inc." is blank
      Then I click xpath "(//table[@id='contacts']//input[@class='cb_contact_id'])[1]"
      Then I click xpath "(//form[@id='batch_assign_form']//a)[1]"
      Then agent for "Bon Jovi inc." is "John Smith"
      Then I follow translated "contacts.table.company_name"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/contacts\/\d+\/edit/"
      Then I should see "John Smith"
      Then I click xpath "//ul[@class='header_actions']//a"
      Then I follow translated "contacts.table.company_name"
      Then I click xpath "(//table[@id='contacts']//input[@class='cb_contact_id'])[1]"
      Then I click xpath "(//form[@id='batch_assign_form']//a)[3]"
      Then agent for "Bon Jovi inc." is blank


    @3 @tbr @__campaign_manage_results @_done
    Scenario: I can see template fields for current category
    #dynamically loaded via ajax

    @3 @tbr @__campaign_manage_results @_done @_tested @requested
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
    @1 @tbr @__campaign_manage_result_types @_done @_tested @requested
    Scenario: I can see list of generic call log results
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Call back"
      And I should see "Not interested now"
      And I should see "Not in"

    @2 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can see list of custom call log results

    @1 @tbr @__campaign_manage_result_types @_done @_tested @requested
    Scenario: I can see list of generic final results
      When I click hidden link by url regex "/call_centres\/campaigns\/\d+\/edit/"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Not interested"
      And I should see "Upgraded to lead"
      And I should see "Meeting booked"
      And I should see "Custom result"

    @2 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can see list of custom final results

    @1 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can assign custom results to campaign

    @2 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can assign generic results to campaign

    @3 @tbr @__campaign_manage_result_types @_done @selenium @_tested @requested
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

    @3 @tbr @__campaign_manage_result_types @_done @selenium @_tested @requested
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

    @3 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can add custom fields to result type

    @1 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can see list of fields in result types list

    @3 @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can select "time" type for custom field in result type

    @3 @tbr @__campaign_manage_result_types @_done @requested
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
    @3 @tbr @__campaign_manage_results @_done @requested
    Scenario: I can add custom call log result

    @3 @tbr @__campaign_manage_results @_done @requested
    Scenario: I can add custom final result


    #
    #
    #campaigns::show (statistics)
    @1 @is @__campaign_statistics @_tested @selenium
    Scenario: I can see general statistics for campaign (all time)
      # number of agents, contacts, calls, results
      Then I add user "translator_call_centre@nbs.com" to campaign "Testing One"
      Then I create call result
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I should see "Total numbers of contacts: 4"
      Then I should see "Total number of agents: 2"
      Then I should see "Total number of calls: ??"
      #jak sie wysypie to bedzie wiadomo że trzeba dodać cyfre tam gdzie są teraz pytajniki :P

    @3 @is @__campaign_statistics @_tested @selenium
    Scenario: I can see results statistics for given time range
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I fill in "date_from" with "2011-01-01"
      Then I fill in "date_to" with "2011-01-03"
      Then I press translated "campaigns.show.search_button"
      Then I should see "01.01" within "#call_results"
      Then I should see "02.01" within "#call_results"
      Then I should see "03.01" within "#call_results"

    @2 @is @__campaign_statistics @_tested @selenium
    Scenario: I can select time range from predefined ones: whole campaign, today, this week, this month
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I should see "Testing One"
      Then I follow translated "campaigns.show.ranges.whole_campaign"
      Then I press translated "campaigns.show.search_button"
      Then I should see whole campaign dates in results table for campaign "Testing One"
      Then I follow translated "campaigns.show.ranges.this_month"
      Then I press translated "campaigns.show.search_button"
      Then I should see start month date and and month date in results table
      Then I follow translated "campaigns.show.ranges.this_week"
      Then I press translated "campaigns.show.search_button"
      Then I should see start week date and and week date in results table
      Then I follow translated "campaigns.show.ranges.today"
      Then I press translated "campaigns.show.search_button"
      Then I should see today date in results table

    @3 @is @__campaign_statistics @_tested @selenium
    Scenario: I can see results list for given date and result type
      Then I create call result
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I click xpath "((//table[@id='call_results']//tr)[3]//td)[3]"
      Then I wait 1 second
      Then I should see "Bon Jovi inc." within "#call_result_details"
      Then I should see "John Smith" within "#call_result_details"
      Then I should see "Call back" within "#call_result_details"

    @2 @is @__campaign_statistics @_tested @selenium
    Scenario: I can see results list for given agent list
      Then I create call result
      Then I add user "translator_call_centre@nbs.com" to campaign "Testing One"
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I select "John Smith" from "agent_ids"
      Then I execute js for select agent_ids "1" to set selected as "false"
      Then I press translated "campaigns.show.search_button"
      Then I should see "1" within "#all_result_row"
      Then I execute js for select agent_ids "0" to set selected as "false"
      Then I execute js for select agent_ids "1" to set selected as "true"
      Then I press translated "campaigns.show.search_button"
      Then I should not see "1" within "#all_result_row"
      Then I wait 4 second

    @2 @is @__campaign_statistics @_tested @selenium
    Scenario: I can see results list for completed contacts only
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I should see "Call back" within "#call_results"
      Then I check "final"
      Then I press translated "campaigns.show.search_button"
      Then I should not see "Call back" within "#call_results"