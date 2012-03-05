@m5b @agent_campaign @$_administrator @$_call_centre @tbr @faircalls
Feature: Agent campaign - management

   Background:
    And I am on the homepage
    Given I visit domain http://faircalls.eu
    And I make sure current locale is "en"
    And I sign in as translator_call_centre@nbs.com with password secret
    And I follow translated "layout.main_menu.call_centre.campaigns"
    Then I should see "Testing One"

# As campaign administrator - admin or call centre

    #
    #
    #campaigns::index
    @is @__campaigns_listing @_tested @_done
 	Scenario: I can see campaigns list
      Then I should see translated "campaigns.header.title"
      Then I should see translated "campaigns.header.new_campaign_button"

    @is @__campaigns_listing @_tested @_done
    Scenario: I can filter campaigns by active/inactive status
      Then I select translated "campaigns.filter.state_select_active" from "search_with_state"
      Then I press translated "campaigns.filter.search_button"
      Then I should see "Testing One"
      Then I should not see "Testing Two"
      Then I select translated "campaigns.filter.state_select_inactive" from "search_with_state"
      Then I press translated "campaigns.filter.search_button"
      Then I should see "Testing Two"
      Then I should not see "Testing One"

    @is @__campaigns_listing @_tested @_done
    Scenario: I can sort campaigns
      Given I select "all" from "search_with_state"
      And I press translated "campaigns.filter.search_button"
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

    @is @__campaigns_listing @_tested @_done
    Scenario: I can filter campaigns by name
      Given I select "all" from "search_with_state"
      Then I fill in "search_with_keyword" with "two"
      Then I press translated "campaigns.filter.search_button"
      Then I should see "Testing Two"
      Then I should not see "Testing One"

    @is @__campaigns_listing @_done @_tested
    Scenario: I can remove selected campaign
      Then I follow translated "campaigns.index.destroy"
      Then I should see translated "flash.campaigns.destroy.notice"
      Given I select "all" from "search_with_state"
      Then I press translated "campaigns.filter.search_button"
      Then I should not see "Testing One"
      Then I should see "Testing Two"

    @is @__campaigns_listing @_tested @_done @selenium
    Scenario: I can create new campaign
      Then I click xpath "//ul[@class='header_actions']//a"
      Then I fill in "campaign_name" with "Testing Creation"
      Then I fill in "campaign_max_contact_number" with "188"
      Then I fill in "campaign_start_date" with "2011-11-11"
      Then I fill in "campaign_end_date" with "2011-12-12"
      Then I select "Leisure" from "campaign_category_id"
      Then I select "United Kingdom" from "campaign_country_id"
      And I choose "campaign_cost_type_3"
      Then I press "campaign_submit"
      Then I should see "Campaign was successfully created"
      And I follow translated "layout.main_menu.call_centre.campaigns"
      Given I select "all" from "search_with_state"
      And I press translated "campaigns.filter.search_button"
      Then I should see "2011-11-11"
      Then I should see "2011-12-12"
      Then I should see "Testing Creation"
      Then I should see "Leisure"

    #campaigns::edit
    # name, category, country, start_date, end_date, number_of_visible_contacts_per_agent
    @is @__campaign_manage @_tested @_done
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
      And I select "all" from "search_with_state"
      And I press translated "campaigns.filter.search_button"
      Then I should see "2011-11-11"
      Then I should see "2011-12-12"
      Then I should see "Testing Changed"
      Then I should see "Leisure"
      Then I should not see "Denmark"

    @is @__campaign_manage @_tested @_done
    Scenario: I can see contacts list
      Then I follow translated "campaigns.index.edit"
      Then I should see translated "campaigns.edit.title_contacts"
      Then I should see translated "campaigns.edit.button_create_contact"

    @is @__campaign_manage @_tested @_done
    Scenario: I can sort contacts list
      Then I follow translated "campaigns.index.edit"
      Then I should see "Bon Jovi" before "Mleko company"
      Then I follow translated "contacts.table.company_name"     
      Then I should see "Mleko company" before "Bon Jovi"

    # question: may agent have more assigned contacts then visible contacts number
    # - no but when the agent registre a result for a contact- the contact is removed from the agens active calling list and asign to the reslt list. Then the agent is dynamicly assign a new contact.
    @is @__campaign_manage @_done @_tested_elsewhere @selenium
    Scenario: I can assign selected contacts to selected agent

    @is @__campaign_manage @_tested @_done
    Scenario: I can remove contact from campaign
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.remove_button"
      Then I should see "Contact was successfully destroyed"
      Then I should not see "Bon Jovi"

    @is @__campaign_manage @_done @_tested_elsewhere
    Scenario: I can deassign agents from selected contacts

    @is @__campaign_manage @_tested @selenium @_done
    Scenario: I can filter contacts by its fields
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then I should see "Bon Jovi"
      Then I should see "Mleko"
      Then I fill in "search_with_keyword" with "bon"
      Then I click xpath "//form[@id='search_new']//a"
      Then I should see "Bon Jovi"
      Then I should not see "Mleko"

    @tbr @__campaign_manage @_done @nontestable @requested
    Scenario: I can export selected contacts to CSV

    #
    #
    #campaigns::agents::new (popup?)
    @is @__campaign_assign_agents @_tested @_done
    Scenario: I can browse available freelance agents and call centers
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.agent_assignment_button"
      Then I should see "John Smith"

    @is @__campaign_assign_agents @_tested_elsewhere @_done
    Scenario: I can assign selected agents to campaign

    @is @__campaign_assign_agents @_tested @selenium @requested @_done
    Scenario: I can deassign not selected agents to campaign
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then I follow translated "campaigns.edit.agent_assignment_button"
      Then I should see "1" within "#campaigns"
      Then I click xpath "(//table[@id='campaigns']//input[@type='checkbox'])[2]"
      Then I click xpath "//tr[@class='main_actions']//a"
      Then I click xpath "//div[@class='frm_head']//a"
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then I follow translated "campaigns.edit.agent_assignment_button"
      Then I should not see "1" within "#campaigns tr:nth-of-type(2)"
      Then I click xpath "(//table[@id='campaigns']//input[@type='checkbox'])[2]"
      Then I click xpath "//tr[@class='main_actions']//a"
      Then I click xpath "//div[@class='frm_head']//a"
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then I follow translated "campaigns.edit.agent_assignment_button"
      Then I should see "1" within "#campaigns tr:nth-of-type(2)"

    #
    #
    #campaigns::contacts::new (popup?)
    @tbr @__campaign_import_contacts @_done @_tested
    Scenario: I can import contacts as excel formatted list
      When I edit campaign "Testing One"
      And I follow translated "campaigns.edit.button_import_contacts"
      And I fill in "Formatted rows" with import data for contacts
      And I press translated "contacts.new.import_button"
      Then imported contacts should be in campaign "Testing One"                

   @is @__campaign_import_contacts @_tested @_done
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
    @is @__campaign_import_contacts @_tested @_done
    Scenario: I can see contact details
      Then I follow translated "campaigns.index.edit"
      Then I follow translated "campaigns.edit.edit_button"
      Then I should see translated "contacts.edit.title"
      Then I should see translated "contacts.edit.title"

    #create => edit => destroy is tested here as well
    @is @__campaign_import_contacts @_tested @selenium @_done
    Scenario: I can see contact results
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/contacts\/\d+\/edit/"
      Then I click xpath "//form[@id='new_call_result']//a"
      Then I fill in "call_result_note" with "this is real deal!"
      Then I fill in "call_result_result_values_attributes_0_value" with "2012-04-22 14:35"
      Then I follow translated "call_results.new.save_button"
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

    @is @__campaign_manage_results @_done @_tested_elsewhere
    Scenario: I can add new result

    @is @__campaign_manage_results @_done @_tested_elsewhere @requested
    Scenario: I can edit result

    @is @__campaign_manage_results @_done @_tested_elsewhere
    Scenario: I can remove result

    @is @__campaign_import_contacts @_tested @selenium @_done
    Scenario: I can see current contact assignment
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
      Then agent for "Bon Jovi inc." is blank
      Then I click xpath "(//table[@id='contacts']//input[@class='cb_contact_id'])[1]"
      Then I click xpath "(//form[@id='batch_assign_form']//a)[1]"
      Then agent for "Bon Jovi inc." is "John Smith"
      Then I follow translated "contacts.table.company_name"
      When I edit contact "Bon Jovi inc."
      Then I should see "John Smith"
      Then I click xpath "//ul[@class='header_actions']//a"
      Then I follow translated "contacts.table.company_name"
      Then I click xpath "(//table[@id='contacts']//input[@class='cb_contact_id'])[1]"
      Then I click xpath "(//form[@id='batch_assign_form']//a)[3]"
      Then agent for "Bon Jovi inc." is blank


    @tbr @__campaign_manage_results @selenium @_done @_tested @requested
    Scenario: I can see template fields for current category
      Given template named "Leisure template" for category "Leisure" is created by user "translator_call_centre@nbs.com" with role "call_centre"
      And template named "Leisure template" is global
      When  I edit contact "Mleko company"
      And I select "Upgraded to lead" from "result_id"
      And I follow translated "call_results.edit.button_new_result"
      And the "Category" field should contain "3"
      Then I should not see "Leisure template"
      When I select "Leisure" from "Category"
      Then I should see "Leisure template"

    @tbr @__campaign_manage_results @_done @_tested @requested
    Scenario: I can go to previous/next contact edit page through arrows
      When I edit contact "Bon Jovi inc." 
      And I should see translated "contacts.edit.current_agent_label"
      Then the "contact_company_name" field should contain "Bon Jovi inc."
      When I follow "next_contact"
      Then the "contact_company_name" field should contain "Mleko company"
      When I follow "prev_contact"
      Then the "contact_company_name" field should contain "Bon Jovi inc."

    #
    #
    #campaigns::agents::manage_results_types
    @tbr @__campaign_manage_result_types @_done @_tested @requested
    Scenario: I can see list of generic call log results
      When I edit campaign "Testing One"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Call back"
      And I should see "Not interested now"
      And I should see "Not in"

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can see list of custom call log results
      Given the custom call_log result with name "Under shower" is created by "translator_call_centre@nbs.com"
      When I edit campaign "Testing One"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Under shower"  

    @tbr @__campaign_manage_result_types @_done @_tested @requested
    Scenario: I can see list of generic final results
      When I edit campaign "Testing One"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Not interested"
      And I should see "Upgraded to lead"
      And I should see "Meeting booked"
      And I should see "Custom result"

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can see list of custom final results
      Given the custom final result with name "Don't give a damn" is created by "translator_call_centre@nbs.com"
      When I edit campaign "Testing One"
      And I follow translated "campaigns.edit.button_manage_result_types"
      Then I should see "Don't give a damn"

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can assign custom results to campaign
      Given the custom final result with name "Don't give a damn" is created by "translator_call_centre@nbs.com"
      When I edit campaign "Testing One"
      And I follow translated "campaigns.edit.button_manage_result_types"
      And I should see "Don't give a damn"
      And I check result "Don't give a damn"
      And I press translated "results.index.button_assign_result_types"
      Then result "Don't give a damn" should be assigned to campaign "Testing One"

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can assign generic results to campaign
    
    @tbr @__campaign_manage_result_types @_done @_tested_elsewhere @requested
    Scenario: I can add new call result
    
    @tbr @__campaign_manage_result_types @_done @_tested_elsewhere @requested
    Scenario: I can remove call result
    
    @tbr @__campaign_manage_result_types @_done @selenium @_tested @requested
    Scenario: I can edit call log results
      When I edit campaign "Testing One"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      When I am adding call log result in campaign "Testing One"     
      And I should see translated "results.new.call_log_result"
      And I fill in "Name" with "I am on fire"
      And I follow translated "shared.lead_templates.form.new_lead_template_field"
      And I fill in "result_result_fields_attributes_0_name" with "Some text"
      And I check "result_result_fields_attributes_0_is_mandatory"
      And I press translated "administration.lead_templates.new.view.button_create"
      Then I should see "I am on fire"
      And I should see "Some text"

    @tbr @__campaign_manage_result_types @_done @_tested_elsewhere @requested
    Scenario: I can add final results
    
    @tbr @__campaign_manage_result_types @_done @_tested_elsewhere @requested
    Scenario: I can remove final results

    @tbr @__campaign_manage_result_types @_done @selenium @_tested @requested
    Scenario: I can edit final results
      When I edit campaign "Testing One"
      And I should see "Edit campaign"
      And I follow translated "campaigns.edit.button_manage_result_types"
      When I am adding final result in campaign "Testing One"
      And I should see translated "results.new.final_result"
      And I fill in "Name" with "I am on fire"
      And I follow translated "shared.lead_templates.form.new_lead_template_field"
      And I fill in "result_result_fields_attributes_0_name" with "Some text"
      And I check "result_result_fields_attributes_0_is_mandatory"
      And I press translated "administration.lead_templates.new.view.button_create"
      Then I should see "I am on fire"
      And I should see "Some text"

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can add custom fields to result type

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can see list of fields in result types list

    @tbr @__campaign_manage_result_types @_done @requested
    Scenario: I can select "datetime" type for custom field in result type

    @tbr @__campaign_manage_result_types @_done @requested @selenium
    Scenario: I custom fields values should validate correct format
      Given the custom call_log result with name "Multiple fields" is created by "translator_call_centre@nbs.com"
      And result "Multiple fields" has mandatory "text field/STRING" field
      And result "Multiple fields" has mandatory "number field/INTEGER" field
      And result "Multiple fields" has mandatory "date field/DATE" field
      And result "Multiple fields" has mandatory "note field/NOTE" field
      And result "Multiple fields" has mandatory "datetime field/DATETIME" field
      And result "Multiple fields" is assigned to campaign "Testing One"
      When I am adding "Multiple fields" result for contact "Mleko company"
      And I fill in the following:
         | text field     | text       |
         | number field   | two        |
         | date field     | 02-02-2010 |
         | note field     | large text |
         | datetime field | 2011-02-02 |
      And I follow translated "call_results.new.save_button"
      Then I should see translated "activerecord.errors.models.result_value.attributes.value.incorrect_number_format"
      And I should see translated "activerecord.errors.models.result_value.attributes.value.incorrect_date_format"
      And I should see translated "activerecord.errors.models.result_value.attributes.value.incorrect_datetime_format"
      And I fill in the following:
         | text field     | text             |
         | number field   | 2                |
         | date field     | 2011-02-02       |
         | note field     | large text       |
         | datetime field | 2011-02-02 21:00 |
      And I follow translated "call_results.new.save_button"
      Then I should see translated "contacts.edit.current_agent_label"
      And I should see "Multiple fields" within "#call_results"            


    #call results
    #
    # GENERIC RESULT TYPES
    #
    @tbr @__campaign_manage_results @_done @_tested @selenium
    Scenario: I can set call back datetime for contact when result is "call back"
      When I am adding "Call back" result for contact "Mleko company"
      And I fill in "Call back date" field with future datetime
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be pending
      And I should see translated "contacts.edit.current_agent_label"


    @tbr @__campaign_manage_results @_done @_tested @selenium
    Scenario: contact is moved to bottom of call list when result is "not in"
      When I am adding "Not in" result for contact "Mleko company"
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be at bottom of the list
      And I should see translated "contacts.edit.current_agent_label"

    @tbr @__campaign_manage_results @_done @_tested @selenium
    Scenario: contact deassigned from agent when result is "Not interested"
      When I am adding "Not interested" result for contact "Mleko company"
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be completed
      And I should see translated "contacts.edit.current_agent_label"

    @tbr @__campaign_manage_results @_done @_tested @selenium
    Scenario: I can set call back datetime for contact when result is "Not interested now"
      When I am adding "Not interested now" result for contact "Mleko company"
      And I fill in "Call back date" field with future datetime
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be pending
      And I should see translated "contacts.edit.current_agent_label"

    @tbr @__campaign_manage_results @_done @_tested @selenium
    Scenario: new lead should be created based on contact when result is "Upgrade to lead"
      When I am adding "Upgraded to lead" result for contact "Mleko company"
      
      And I fill in the following:
         | call_result_contact_attributes_contact_name | Mleko company  |
         | Address line 1                 | Some Street 2               |
         | City                           | London                      |
         | Zip code                       | 34444                       |
         | Phone number                   | 55555                       |
         | Public header                  | A great deal                |
         | Public description             | Some description            |
         | Detailed description (hidden)  | Some hidden description     |
         | Price                          | 2                           |
         | datepicker                     | 2011-02-02                  |
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be upgraded to lead
      And I should see translated "contacts.edit.current_agent_label"

    @tbr @__campaign_manage_results @_done @_tested @selenium
    Scenario: I can set meeting datetime for contact when result is "Meeting booked"
      When I am adding "Meeting booked" result for contact "Mleko company"
      And I fill in "Meeting date" field with future datetime
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be completed
      And I should see translated "contacts.edit.current_agent_label"


    #call results
    #
    # CUSTOM RESULT TYPES
    #
    @tbr @__campaign_manage_results @_done @requested @selenium
    Scenario: I can add custom call result (call log)
      Given the custom call_log result with name "Just a call log result" is created by "translator_call_centre@nbs.com"
      When I am adding "Just a call log result" result for contact "Mleko company"
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be at bottom of the list
      And I should see translated "contacts.edit.current_agent_label"

    @tbr @__campaign_manage_results @_done @requested @selenium
    Scenario: I can add custom call result (final)
      Given the custom final result with name "Just a final result" is created by "translator_call_centre@nbs.com"
      When I am adding "Just a final result" result for contact "Mleko company"
      And I follow translated "call_results.new.save_button"
      Then contact "Mleko company" should be completed
      And I should see translated "contacts.edit.current_agent_label"
      
    @tbr @__campaign_manage_results @_done @_tested_elsewhere @requested
    Scenario: I can edit custom call result
    
    @tbr @__campaign_manage_results @_done @_tested_elsewhere @requested
    Scenario: I can remove custom call result 

    #
    #
    #campaigns::show (statistics)
    @is @__campaign_statistics @_tested @selenium @_done
    Scenario: I can see general statistics for campaign (all time)
      # number of agents, contacts, calls, results
      Then I add user "translator_call_centre@nbs.com" to campaign "Testing One"
      Then I create call result
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I should see "Total numbers of contacts: 4"
      Then I should see "Total number of agents: 1"
      Then I should see "Total number of calls: ??"
      #jak sie wysypie to bedzie wiadomo że trzeba dodać cyfre tam gdzie są teraz pytajniki :P

    @is @__campaign_statistics @_tested @selenium @_done
    Scenario: I can see results statistics for given time range
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I fill in "date_from" with "2011-01-01"
      Then I follow translated "campaigns.show.search_button"
      Then I fill in "date_to" with "2011-01-03"
      Then I follow translated "campaigns.show.search_button"
      Then I should see "01.01" within "#call_results"
      Then I should see "02.01" within "#call_results"
      Then I should see "03.01" within "#call_results"

    @is @__campaign_statistics @_tested @selenium @_done
    Scenario: I can select time range from predefined ones: whole campaign, today, this week, this month
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I should see "Testing One"
      Then I follow translated "campaigns.show.ranges.whole_campaign"
      Then I follow translated "campaigns.show.search_button"
      Then I should see whole campaign dates in results table for campaign "Testing One"
      Then I follow translated "campaigns.show.ranges.this_month"
      Then I follow translated "campaigns.show.search_button"
      Then I should see start month date and and month date in results table
      Then I follow translated "campaigns.show.ranges.this_week"
      Then I follow translated "campaigns.show.search_button"
      Then I should see start week date and and week date in results table
      Then I follow translated "campaigns.show.ranges.today"
      Then I follow translated "campaigns.show.search_button"
      Then I should see today date in results table

    @is @__campaign_statistics @_tested @selenium @_done
    Scenario: I can see results list for given date and result type
      Then I create call result
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I click xpath "((//table[@id='call_results']//tr)[3]//td)[3]"
      Then I wait 1 second
      Then I should see "Bon Jovi inc." within "#call_result_details"
      Then I should see "John Smith" within "#call_result_details"
      Then I should see "Call back" within "#call_result_details"
      Then I should see translated "call_results.table.export_to_csv"
      Then I execute js for display action block for "call_result_details"
      Then I follow translated "call_results.table.edit_link"
      Then I should see "Edit result"

    @is @__campaign_statistics @_tested @selenium @requested @_done
    Scenario: I can see results list for given agent list
      Then I create call result
      Then I add user "translator_call_centre@nbs.com" to campaign "Testing One"
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I wait 4 second
      Then I select "John Smith" from "agent_ids"
      Then I execute js for select agent_ids "1" to set selected as "false"
      Then I follow translated "campaigns.show.search_button"
      Then I should see "1" within "#all_result_row"
      Then I execute js for select agent_ids "0" to set selected as "false"
      Then I execute js for select agent_ids "1" to set selected as "true"
      Then I follow translated "campaigns.show.search_button"
      Then I should see "1" within "#all_result_row"
      Then I wait 4 second

    @is @__campaign_statistics @_tested @selenium @requested @_done
    Scenario: I can see results list for completed contacts only
      Then I execute js for display action block for "campaigns"
      Then I follow translated "campaigns.index.result"
      Then I should see "Call back" within "#call_results"
      Then I check "final"
      Then I follow translated "campaigns.show.search_button"
      Then I should not see "Call back" within "#call_results"
      
      
      
    #access control
    #
    #
    
#Places                Admin   Agent   Call Centre   Call Centre Agent
#
#Campaigns List        x       x*      x^            x*
#Campaign Result       x       -       x^            -
#Manage Result Types   x       -       x^            -
#Edit Campaign         x       -       x^            x
#Agent work screen     x       x       x             x

#* - without actions
#^ - only created by me

        @added
        Scenario: I should see and be able to use actions for managing campaign if I have privileges to it
        
        @added
        Scenario: I should see and be able to use actions for managing contact if I have privileges to it        
        
        @added
        Scenario: I should see and be able to use actions for managing call result if I have privileges to it        
      
        @added
        Scenario: I should see and be able to use actions for managing result type if I have privileges to it        
        
        @added
        Scenario: As call centre agent or agent I can't manage campaigns, result types, agent assignment

        # 5189
        @m11 @requested @is @non_testable @_done
        Scenario: I can see timestamps in my localization, not server time

        # 5192
        @m12 @$_call_centre @requested @tgn @briefing @selenium @_done @_tested @_deprecated
        Scenario: I can specify description and briefing when creating new campaign
#          When I follow translated "campaigns.header.new_campaign_button"
#          Then I fill in "campaign_name" with "BriefingCampaingTest"
#          And I fill in "campaign_max_contact_number" with "20"
#          And I press translated "campaigns.new.button_create"
#          Then I should see translated "campaigns_description.edit.title"
#          And I fill in "campaign_description_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
#          And I fill in "campaign_briefing_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
#          And I press translated "campaigns_description.edit.button_update"

        # 5192
        @m12 @$_call_centre @requested @tgn @briefing @non_testable @_done
        Scenario: I can see a description in a popup

        # 5192
        @m12 @$_call_centre @requested @tgn @briefing @selenium @_done @_tested
        Scenario: When editing a campaign I can click a link to edit description and briefing
          When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
          And I follow translated "campaigns.edit.description_and_briefing"
          And I should see translated "campaigns_description.edit.title"
          And I wait 1 second
          And I fill in "campaign_description_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
          And I fill in "campaign_briefing_editor" ckeditor with "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
          And I press translated "campaigns_description.edit.button_update"
        
        ##5650
        @requested @m11 @ao @non_testable @_done
        Scenario: I should see a listbox with all the resuls types and be able to filter by them

        ##5649
        @requested @m11 @_done @_tested @tgn
        Scenario: I should see "Go to results" button beside "Agent assignment" in edit campaign
          When I follow translated "campaigns.index.edit"
          Then I should see translated "campaigns.edit.results"
          And I follow translated "campaigns.edit.results"

        #5931
        # when editing campaign add “email template” nex to “result” button
        @m12 @$_call_centre @requested @ao @selenium @_done @_tested
        Scenario: When I create a new campaign the default admin template should be populated and it should be editable by campaign creator
          When there are no campaigns
          And I follow translated "layout.main_menu.call_centre.campaigns"
          And I click xpath "//ul[@class='header_actions']//a"
          And I fill in "campaign_name" with "Testing Template"
          And I fill in "campaign_max_contact_number" with "18"
          And I fill in "campaign_start_date" with "2011-11-11"
          And I fill in "campaign_end_date" with "2011-12-12"
          And I select "Leisure" from "campaign_category_id"
          And I select "United Kingdom" from "campaign_country_id"
          And I choose "campaign_cost_type_3"
          And I press "campaign_submit"
          And I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
          And I select "Additional materials" from "email_template_id"
          And I follow translated "campaigns.edit.edit_template"
          Then I should see CSS path "#email_template_body_input"
          And the "Subject" field should contain "Additional materials"

        #5935
        @m12 @$_call_centre @requested @ao @_done @non_testable
        Scenario: When I am on campaign results page and I change date then the page should reload with filter applied

        #5970
        @m12 @$_call_centre @requested @tgn @selenium @_tested @_done
        Scenario: Call centre can edit campaign when assigned to it by admin
          Given I am not sign in
          And I am on the homepage
          And I sign in as blazejek@gmail.com with password secret
          And I follow translated "layout.main_menu.admin.campaigns"
          Then I follow translated "campaigns.header.new_campaign_button"
          Then I fill in "campaign_name" with "Campaign for call centre"
          Then I fill in "campaign_max_contact_number" with "188"
          And I choose "campaign_cost_type_3"
          And I press translated "campaigns.new.button_create"
          And I follow translated "campaigns.edit.agent_assignment_button"
          And I check "campaign_user_ids[]"
          And I follow translated "campaigns_users.index.button_assign"
          And I am not sign in
          And I sign in as translator_call_centre@nbs.com with password secret
          And I follow translated "layout.main_menu.call_centre_agent.campaigns"
          And I fill in "search_with_keyword" with "Campaign for call centre"
          And I press translated "campaigns.filter.search_button"
          When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
          And I should see "Edit campaign: Campaign for call centre"

        @m13 @requested @after_m12_presentation @tgn @$_call_centre @selenium @_tested @_done
        Scenario: I can define a default set of materials to be included in emails
          When I click hidden link by url regex "/callers\/campaigns\/\d+\/materials/"
          And attach the file "sample image" to "material_asset"
          And I press translated "materials.views.index.save_material"
          And I check "is_default"

        # "My results" for call centre / TGN
        @m13 @requested @$_call_centre @after_m12_presentation @tgn @_done @_tested
        Scenario: Call centre can see results from his agents
          Given I have user with email ccagent01@nbs.com and role call_centre_agent
          And user ccagent01@nbs.com with role call_centre_agent exists with attributes "first_name:Greg,last_name:Foam"
          And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre translator_call_centre@nbs.com
          And contact for company "ContactTest1" and campaign "Testing One" is assigned to user "ccagent01@nbs.com"
          And contact for company "ContactTest1" has assigned result "Call back" created by "ccagent01@nbs.com"
          And contact for company "ContactTest2" and campaign "Testing One" is assigned to user "translator_call_centre_agent@nbs.com"
          And contact for company "ContactTest2" has assigned result "Call back" created by "translator_call_centre_agent@nbs.com"
          And I follow translated "campaigns.header.my_results_global_button"
          And I should see translated "production.show.view.header"
          

        @m13 @requested @$_admin @after_m12_presentation @tgn @_tested @_done
        Scenario: Admin call see results from all agents
          Given I am not sign in
          Given I have user with email ccagent01@nbs.com and role call_centre_agent
          And user ccagent01@nbs.com with role call_centre_agent exists with attributes "first_name:Greg,last_name:Foam"
          And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre translator_call_centre@nbs.com
          And contact for company "ContactTest1" and campaign "Testing One" is assigned to user "ccagent01@nbs.com"
          And contact for company "ContactTest1" has assigned result "Call back" created by "ccagent01@nbs.com"
          And contact for company "ContactTest2" and campaign "Testing One" is assigned to user "translator_call_centre_agent@nbs.com"
          And contact for company "ContactTest2" has assigned result "Call back" created by "translator_call_centre_agent@nbs.com"
          And I sign in as blazejek@gmail.com with password secret
          And I follow translated "layout.main_menu.call_centre.campaigns"
          And I follow translated "campaigns.header.my_results_global_button"
          And I should see translated "production.show.view.header"
          And I should see "Campaigns"

        @m13 @requested @$_call_centre @$_admin @after_m12_presentation @tgn @_tested @_done @selenium
        Scenario: I can select for which agents display the results
          Given I have user with email ccagent01@nbs.com and role call_centre_agent
          And user ccagent01@nbs.com with role call_centre_agent exists with attributes "first_name:Greg,last_name:Foam"
          And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre translator_call_centre@nbs.com
          And contact for company "ContactTest1" and campaign "Testing One" is assigned to user "ccagent01@nbs.com"
          And contact for company "ContactTest1" has assigned result "Call back" created by "ccagent01@nbs.com"
          And contact for company "ContactTest2" and campaign "Testing One" is assigned to user "translator_call_centre_agent@nbs.com"
          And contact for company "ContactTest2" has assigned result "Call back" created by "translator_call_centre_agent@nbs.com"
          And I follow translated "layout.main_menu.call_centre.campaigns"
          And I follow translated "campaigns.header.my_results_global_button"
          And I select "Greg Foam" from "agent_ids"
          And I follow translated "campaigns.show.search_button"
          And I should see translated "production.show.view.header"


        @m14 @requested @my_results @$_call_centre @tgn @_done @tested_elsewhere
        Scenario: I should see "My results" renamed to "Production" and displayed the same way as campaign's "Results"

        @m14 @requested @my_results @$_admin @tgn @_done @tested_elsewhere
        Scenario: I should see "My results" renamed to "Production" and displayed the same way as campaign's "Results"

        #8315
        @m22 @requested @is @_done @_tested
        Scenario: I can click to duplicate a campaign (data, briefing)
          Given I am not sign in
          And I sign in as blazejek@gmail.com with password secret
          And I follow translated "layout.main_menu.admin.campaigns"
          And I follow translated "campaigns.index.duplicate"
          And I should see translated "flash.campaigns.duplicate.notice"
          And I should see "Copy of Testing"

        #8315
        @m22 @requested @is @_done @_tested_elsewhere
        Scenario: When I duplicate a campaign, agents and their assigments should be copied

        #8315
        @m22 @requested @is @_done @_tested_elsewhere
        Scenario: When I duplicate a campaign, materials repository should be copied

        #8315
        @m22 @requested @is @_done @_tested_elsewhere
        Scenario: When I duplicate a campaign, customization emails and other data should be copied

        #9143
        @m25 @requested @_done @_tested @tgn
        Scenario: As call centre I can go to production from campaign edit
          And I follow translated "layout.main_menu.admin.campaigns"
          And I follow translated "campaigns.edit.edit_button"
          And I should see translated "campaigns.edit.production"

        #9143
        @m25 @requested @selenium @_done @_tested @tgn
        Scenario: As call centre I can go to agent work screen from campaign edit
          Given I add user "translator_call_centre@nbs.com" to campaign "Testing Two"
          And I add user "translator_call_centre_agent@nbs.com" to campaign "Testing Two"
          And user translator_call_centre@nbs.com with role call_centre exists with attributes "first_name: Ted, company_name:translator_call_centre"
          And user translator_call_centre_agent@nbs.com with role call_centre_agent exists with attributes "first_name: Ted2, company_name:translator_call_centre"
          And I follow translated "layout.main_menu.admin.campaigns"
          And I select "all" from "search_with_state"
          And I fill in "search_with_keyword" with "Testing Two"
          And I press translated "campaigns.filter.search_button"
          When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
          And I select "Ted2, translator_call_centre" from "user_id"
          And I follow translated "campaigns.edit.agent_work_screen_as"
          Then I should see translated "agent_work_screen.index.logged_as_other_user" with options "user:Ted2, translator_call_centre"


        #9143
        @m25 @requested @_done @_tested @tgn
        Scenario: As admin I can go to production from campaign edit
          Given I am not sign in
          And I sign in as blazejek@gmail.com with password secret
          And I follow translated "layout.main_menu.admin.campaigns"
          And I follow translated "campaigns.edit.edit_button"
          And I should see translated "campaigns.edit.production"

        #9143
        @m25 @requested @selenium @_tested @_done @tgn
        Scenario: As admin I can go to agent work screen from campaign edit
          Given I add user "translator_call_centre@nbs.com" to campaign "Testing Two"
          And I add user "translator_call_centre_agent@nbs.com" to campaign "Testing Two"
          And user translator_call_centre@nbs.com with role call_centre exists with attributes "first_name: Ted, company_name:translator_call_centre"
          And user translator_call_centre_agent@nbs.com with role call_centre_agent exists with attributes "first_name: Ted2, company_name:translator_call_centre"
          Given I am not sign in
          And I sign in as blazejek@gmail.com with password secret
          And I follow translated "layout.main_menu.admin.campaigns"
          And I select "all" from "search_with_state"
          And I fill in "search_with_keyword" with "Testing Two"
          And I press translated "campaigns.filter.search_button"
          When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
          And I select "Ted2, translator_call_centre" from "user_id"
          And I follow translated "campaigns.edit.agent_work_screen_as"
          Then I should see translated "agent_work_screen.index.logged_as_other_user" with options "user:Ted2, translator_call_centre"

        #9143
        @m25 @requested @_tested @_done @tgn
        Scenario: When I go to production from campaign's edit page the results are already filtered fro that campaign
          Given I am not sign in
          And I sign in as blazejek@gmail.com with password secret
          And I follow translated "layout.main_menu.admin.campaigns"
          And I fill in "search_with_keyword" with "Testing One"
          And I press translated "campaigns.filter.search_button"
          And I follow translated "campaigns.edit.edit_button"
          And I follow translated "campaigns.edit.production"
          And "campaign_ids" should be selected for value "Testing One"

        #9143
        @m25 @requested @_done @_tested_elsewhere @tgn
        Scenario: When admin go to agent work screen then he can choose to become certain agent

        #9143
        @m25 @requested @_done @_tested_elsewhere @tgn
        Scenario: When call centre go to agent work screen then he can choose to be himself or become certain agent of his


        #8891
        @m26 @requested @selenium @_done @_tested @tgn
        Scenario: As admin or call centre I can move selected contacts to different campaign
          And I fill in "search_with_keyword" with "Testing Two"
          And I select "all" from "search_with_state"
          And I press translated "campaigns.filter.search_button"
          And I click hidden link by url regex "/\/callers\/campaigns\/\d+\/edit/"
          And I follow translated "campaigns.edit.button_create_contact"
          And I fill in "contact_company_name" with "Moveable contact"
          And I fill in "contact_company_phone_number" with "+44 3423424234"
          And I select "Denmark" from "contact_country_id"
          And I press translated "contacts.new.create_button"
          And I check "mark_all"
          And I select "Testing One" from "target_campaign_id"
          And I follow translated "campaigns.edit.button_move_selected_contacts"
          And I should see translated "contacts.batch_move.flash.moved_successfully" with options "campaign:Testing One"
          And campaign "Testing Two" should not have contact named "Moveable contact"
          And campaign "Testing One" should have contact named "Moveable contact"

        #8891
        @m26 @requested @selenium @_done @_tested @tgn
        Scenario: As admin or call centre I can duplicate selected contacts to different campaign
          And I fill in "search_with_keyword" with "Testing Two"
          And I select "all" from "search_with_state"
          And I press translated "campaigns.filter.search_button"
          And I click hidden link by url regex "/\/callers\/campaigns\/\d+\/edit/"
          And I follow translated "campaigns.edit.button_create_contact"
          And I fill in "contact_company_name" with "Moveable contact"
          And I fill in "contact_company_phone_number" with "+44 3423424234"
          And I select "Denmark" from "contact_country_id"
          And I press translated "contacts.new.create_button"
          And I check "mark_all"
          And I select "Testing One" from "target_campaign_id"
          And I follow translated "campaigns.edit.button_copy_selected_contacts"
          And I should see translated "contacts.batch_move.flash.copied_successfully" with options "campaign:Testing One"
          And campaign "Testing Two" should have contact named "Moveable contact"
          And campaign "Testing One" should have contact named "Moveable contact"


        #8891
        @m26 @requested @_done @_tested_elsewhere @tgn
        Scenario: As call centre I can move or duplicate contacts to campaigns that are assigned to me

        #6553
        @m25 @requested @selenium @_done @_tested
        Scenario: In production I can see Export all button beside the search button
          Then I create call result
          Then I execute js for display action block for "campaigns"
          Then I follow translated "campaigns.index.result"
          Then I wait 1 second
          Then I should see translated "campaigns.show.export_button"

        #6553
        @m25 @requested @selenium @_done @_tested
        Scenario: In production the export button exports all results matched by filters
          Then I create call result
          Then I execute js for display action block for "campaigns"
          Then I follow translated "campaigns.index.result"
          Then I wait 1 second
          Then I follow translated "campaigns.show.export_button"

        #10255
        @m29 @requested @tgn @_done @_tested
        Scenario: When I access campaigns from menu I should see only active by default
          And "search_with_state" should be selected for value "active"

        #10612
        @m30 @_requested
        Scenario: I should see number of contacts with callback result assigned on campaigns listing

        #When you duplicate a camping you should be asked:
        #Move agent time and result to new camping (yes / no / cancel)
        @m30 @_requested
        Scenario: I should be asked to move results/time when I duplicate a campaign
