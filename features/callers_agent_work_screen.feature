@is @agent_work_screen_speed_up @faircalls
Feature: Callers agent work screen

# in this file we only check js; models are tested somewhere else. Here you can find the key for abbreviations:
# CS - call sheet table
# P - pending calls table
# CC - completed contacts

  Background:
    Given I am on the homepage
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    And I go to campaign testing one page

  @_done @selenium @_tested
  Scenario: Create contact - it goes at the end of CS, it is highlighted
    Then I follow translated "agent_work_screen.index.new_contact"
    Then I fill in "contact_company_name" with "Modern Warfare" within "#new_contact_form"
    Then I fill in "contact_company_phone_number" with "4444444444" within "#new_contact_form"
    Then I select "Denmark" from "contact_country_id" within "#new_contact_form"
    Then I press translated "agent_work_screen.index.create"
    Then I wait 3 second
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Bon Jovi" before "Modern Warfare"
    Then I should see "Mleko company" before "Modern Warfare"
    Then I should see "Stefanek corp" before "Modern Warfare"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Modern Warfare" has class "highlight_row"
    Then contact row for "Modern Warfare" has class "even"
    Then contact row for "Modern Warfare" has not class "odd"
    #show
    Then I follow contact action "campaigns.edit.show_button" within tr "Mleko company"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then contact row for "Mleko company" has class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Modern Warfare" has not class "highlight_row"
    #update
    Then I fill in "contact_company_name" with "Battlefield" within "#contact_info"
    Then I follow translated "contacts.edit.save_button"
    Then I wait 3 second
    Then I should not see "Mleko company" within "#call_sheet"
    Then I should see "Bon Jovi inc." before "Battlefield"
    Then I should see "Battlefield" before "Stefanek corp"
    Then I should see "Stefanek corp" before "Modern Warfare"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then contact row for "Battlefield" has class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Modern Warfare" has not class "highlight_row"
    #remove
    Then I confirm a js popup on the next step
    Then I follow contact action "campaigns.edit.remove_button" within tr "Stefanek corp"
    Then I should not see "Stefanek corp" within "#call_sheet"
    Then contact row for "Bon Jovi inc." has class "highlight_row"
    Then contact row for "Battlefield" has not class "highlight_row"
    Then contact row for "Modern Warfare" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Battlefield" has class "even"
    Then contact row for "Modern Warfare" has class "odd"

  @tested_elsewhere
  Scenario: Remove contact - it is removed, first contact from CS it is highlighted

  @tested_elsewhere
  Scenario: Update contact - it stays on the same spot and it is highlighted

  @tested_elsewhere
  Scenario: Show contact - it stays on the same spot and it is highlighted

  @_done @selenium @_tested
  Scenario: Create result for contact - pending - contact goes to end of P, it is removed from CS, first contact from CS is highlighted
    #adding first pending result
    Then I add result "Call back" for current contact
    #    call sheet table check
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should not see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Mleko company" before "Stefanek corp"
    Then contact row for "Mleko company" has class "odd"
    Then contact row for "Stefanek corp" has class "even"
    Then contact row for "Mleko company" has class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    #    pedning calls table check
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I should see "Call back (Johnny Mnemonic)" within "#pending_calls"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    #adding second pending result
    Then I add result "Call back" for current contact
    #    call sheet table check
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should not see "Bon Jovi inc." within "#call_sheet"
    Then I should not see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "Stefanek corp" has class "highlight_row"
    #    pedning calls table check
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I should see "Mleko company" within "#pending_calls"
    Then I should see "Bon Jovi inc." before "Mleko company"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Mleko company" has class "even"
    #changing first pending contact's result to pending
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I change result for current contact to "Call back"
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I should see "Mleko company" within "#pending_calls"
    Then I should see "Mleko company" before "Bon Jovi inc."
    Then contact row for "Bon Jovi inc." has class "highlight_row"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has class "even"
    Then contact row for "Mleko company" has class "odd"
    #changing first pending contact's result to regular
    Then I follow contact action "campaigns.edit.show_button" within tr "Mleko company"
    Then I change result for current contact to "Not in"
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I should not see "Mleko company" within "#pending_calls"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    #TODO Then contact row for "Bon Jovi inc." has class "odd"
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" before "Mleko company"
    Then contact row for "Stefanek corp" has class "odd"
    #TODO Sciemkata sie pojawia ale tak ma byc, dlatego Mleko jest odd
    Then contact row for "Mleko company" has class "odd"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Mleko company" has class "highlight_row"
    #changing first pending contact's result to final
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I change result for current contact to "Not interested"
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should not see "Bon Jovi inc." within "#pending_calls"
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"

  @_done @selenium @_tested
  Scenario: Create result for contact - final - contact goes to end of CC, it is removed from CS, first contact from CS is highlighted
    #adding first final result
    Then I add result "Not interested" for current contact
    #    call sheet table check
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should not see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Mleko company" before "Stefanek corp"
    Then contact row for "Mleko company" has class "odd"
    Then contact row for "Stefanek corp" has class "even"
    Then contact row for "Mleko company" has class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    #    completed contacts table check
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Not interested (Johnny Mnemonic)" within "#completed_contacts"
    Then contact row for "Bon Jovi inc." has class "completed"
    #adding second final result
    Then I add result "Not interested" for current contact
    #    call sheet table check
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should not see "Bon Jovi inc." within "#call_sheet"
    Then I should not see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "Stefanek corp" has class "highlight_row"
    #    completed contacts table check
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Mleko company" within "#completed_contacts"
    Then I should see "Bon Jovi inc." before "Mleko company"
    Then contact row for "Bon Jovi inc." has class "completed"
    Then contact row for "Mleko company" has class "completed"
    #changing first complete contact's result to final
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I change result for current contact to "Not interested"
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Mleko company" within "#completed_contacts"
    Then contact row for "Bon Jovi inc." has class "completed"
    Then contact row for "Mleko company" has class "completed"
    #changing first complete contact's result to pending
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I change result for current contact to "Call back"
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Mleko company" within "#completed_contacts"
    Then contact row for "Bon Jovi inc." has class "completed"
    Then contact row for "Mleko company" has class "completed"
    Then I should see "Call back (Johnny Mnemonic)" within "#completed_contacts"
    Then I should see "Not interested (Johnny Mnemonic)" within "#completed_contacts"
    #changing first complete contact's result to regular
    Then I follow contact action "campaigns.edit.show_button" within tr "Mleko company"
    Then I change result for current contact to "Not in"
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Mleko company" within "#completed_contacts"
    Then contact row for "Bon Jovi inc." has class "completed"
    Then contact row for "Mleko company" has class "completed"
    Then I should see "Call back (Johnny Mnemonic)" within "#completed_contacts"
    Then I should see "Not in (Johnny Mnemonic)" within "#completed_contacts"

  @_done @selenium @_tested
  Scenario: Create result for contact - regular - contact goes to end of CS, first contact from CS is highlighted
    #adding first regular result
    Then I select "Not in" from "selected_result_id"
    Then I follow translated "call_results.edit.button_new_result"
    Then I follow translated "call_results.new.save_button" within "#agent_work_screen_call_result"
    Then I wait 3 second
    #    call sheet table check
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Mleko company" before "Stefanek corp"
    Then I should see "Stefanek corp" before "Bon Jovi inc."
    Then I should see "Not in (Johnny Mnemonic)" within "#call_sheet"
    Then contact row for "Mleko company" has class "odd"
    Then contact row for "Stefanek corp" has class "even"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Mleko company" has class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    #adding second regular result
    Then I select "Not in" from "selected_result_id"
    Then I follow translated "call_results.edit.button_new_result"
    Then I follow translated "call_results.new.save_button" within "#agent_work_screen_call_result"
    Then I wait 3 second
    #    call sheet table check
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" before "Bon Jovi inc."
    Then I should see "Bon Jovi inc." before "Mleko company"
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "Bon Jovi inc." has class "even"
    Then contact row for "Mleko company" has class "odd"
    Then contact row for "Stefanek corp" has class "highlight_row"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then contact row for "Mleko company" has not class "highlight_row"
    #changing first regular contact's result to regular
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I change result for current contact to "Not in"
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Stefanek corp" before "Mleko company"
    Then I should see "Mleko company" before "Bon Jovi inc."
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "Mleko company" has class "even"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has class "highlight_row"
    #changing first regular contact's result to pending
    Then I follow contact action "campaigns.edit.show_button" within tr "Mleko company"
    Then I change result for current contact to "Call back"
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should not see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Stefanek corp" before "Bon Jovi inc."
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "Bon Jovi inc." has class "even"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Mleko company" within "#pending_calls"
    Then contact row for "Mleko company" has class "highlight_row"
    Then contact row for "Stefanek corp" has class "odd"
    #changing first regular contact's result to final
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I change result for current contact to "Not interested"
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should not see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "PHU Sciemkata" within "#call_sheet"
    Then I should see "Stefanek corp" before "PHU Sciemkata"
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "PHU Sciemkata" has class "even"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "PHU Sciemkata" has not class "highlight_row"
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then contact row for "Bon Jovi inc." has class "completed"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Not interested (Johnny Mnemonic)" within "#completed_contacts"

  @tested_elsewhere
  Scenario: Change result from pending to pending

  @tested_elsewhere
  Scenario: Change result from pending to regular

  @tested_elsewhere
  Scenario: Change result from pending final

  @tested_elsewhere
  Scenario: Change result from regular to regular

  @tested_elsewhere
  Scenario: Change result from regular to pending

  @tested_elsewhere
  Scenario: Change result from regular final

  @tested_elsewhere
  Scenario: Change result from final to final

  @tested_elsewhere
  Scenario: Change result from final to pending

  @tested_elsewhere
  Scenario: Change result from final to regular

  @_done @selenium @_tested
  Scenario: Remove pending result
    Then I add result "Call back" for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I remove result for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should not see "Bon Jovi inc." within "#pending_calls"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Mleko company" within "#call_sheet"
    Then I should see "Stefanek corp" within "#call_sheet"
    Then I should see "PHU Sciemkata" within "#call_sheet"
    Then I should see "Bon Jovi inc." before "Mleko company"
    Then I should see "Mleko company" before "Stefanek corp"
    Then I should see "Stefanek corp" before "PHU Sciemkata"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Mleko company" has class "even"
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "PHU Sciemkata" has class "even"
    Then contact row for "Bon Jovi inc." has class "highlight_row"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "PHU Sciemkata" has not class "highlight_row"

  @_done @selenium @_tested
  Scenario: Remove regular result
    Then I add result "Not in" for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Not in (Johnny Mnemonic)" within "#call_sheet"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I remove result for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should not see "Not in (Johnny Mnemonic)" within "#call_sheet"
    Then I should see "Mleko company" before "Stefanek corp"
    Then I should see "Stefanek corp" before "Bon Jovi inc."

  @_done @selenium @_tested
  Scenario: Remove final result is impossible
    Then I add result "Not interested" for current contact
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Not interested (Johnny Mnemonic)" within "#completed_contacts"
    Then I follow translated "agent_work_screen.index.show_call_log_for_current_contact"
    Then display all hidden actions
    Then I should not see "call_results.table.remove_link" within "#results_sheet"

  @_done @selenium @_tested
  Scenario: Remove pending result and previous is pending
    Then I add result "Call back" for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I add result "Call back" for current contact
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I remove result for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    #TODO Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Bon Jovi inc." has class "highlight_row"

  @_done @selenium @_tested
  Scenario: Remove pending result and previous is regular
    Then I add result "Not in" for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I should see "Not in (Johnny Mnemonic)" within "#call_sheet"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I add result "Call back" for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then contact row for "Mleko company" has class "highlight_row"
    Then I should not see "Bon Jovi inc." within "#call_sheet"
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Bon Jovi inc." has not class "highlight_row"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I remove result for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should not see "Bon Jovi inc." within "#pending_calls"
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    And I wait 5 second
    Then I should see "Mleko company" before "Bon Jovi inc."
    Then I should see "Bon Jovi inc." before "Stefanek corp"
    #TODO dlaczego cycle jest na odwrót? czy ja zrobiłem źle we wcześniejszych testach?
    Then contact row for "Mleko company" has class "even"
    Then contact row for "Bon Jovi inc." has class "odd"
    Then contact row for "Stefanek corp" has class "even"
    Then contact row for "PHU Sciemkata" has class "odd"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "PHU Sciemkata" has not class "highlight_row"

  @_done @selenium @_tested
  Scenario: Remove regular result and previous is regular
    Then I add result "Not in" for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I add result "Not in" for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I remove result for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    #TODO dlaczego cycle jest na odwrót? czy ja zrobiłem źle we wcześniejszych testach?
    Then contact row for "Mleko company" has class "even"
    Then contact row for "Stefanek corp" has class "odd"
    Then contact row for "Bon Jovi inc." has class "even"
    Then contact row for "Mleko company" has not class "highlight_row"
    Then contact row for "Stefanek corp" has not class "highlight_row"
    Then contact row for "Bon Jovi inc." has class "highlight_row"
    Then I should see "Mleko company" before "Stefanek corp"
    Then I should see "Stefanek corp" before "Bon Jovi inc."
    Then I should see "Not in (Johnny Mnemonic)" within "#call_sheet"

  @_done @selenium @_tested
  Scenario: Remove regular result and previous is pending
    Then I add result "Call back" for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I add result "Not in" for current contact
    Then I follow translated "agent_work_screen.index.show_current_call_sheet"
    Then I should see "Bon Jovi inc." within "#call_sheet"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I remove result for current contact
    Then I follow translated "agent_work_screen.index.show_pending_calls"
    Then I should see "Bon Jovi inc." within "#pending_calls"
    Then I should see "Call back (Johnny Mnemonic)" within "#pending_calls"
    Then contact row for "Bon Jovi inc." has class "highlight_row"

  @_done @selenium @_tested
  Scenario: I can not add now result for completed contact
    Then I add result "Not interested" for current contact
    Then I follow translated "agent_work_screen.index.show_completed_contacts"
    Then I should see "Bon Jovi inc." within "#completed_contacts"
    Then I should see "Not interested (Johnny Mnemonic)" within "#completed_contacts"
    Then I should see translated "call_results.edit.button_new_result"
    Then I follow contact action "campaigns.edit.show_button" within tr "Bon Jovi inc."
    Then I should not see translated "call_results.edit.button_new_result"

  #10278
  @m29 @_requested @selenium @_done @_tested
  Scenario: Notification should be added when I create a Call Back result
    Then I add result "Call back" for current contact
    Then notification for user "translator_call_centre@nbs.com" should be created
    And the last notification should not be active

  @m32 @_requested
  Scenario: I should not see notifications for contacts which were finalised before the time of callback
