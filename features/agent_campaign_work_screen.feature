@m5b @agent_campaign @$_call_centre_agent @tbr @__campaign_calling_session @selenium @faircalls
Feature: Agent campaign - calling session

   Background:
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I am not sign in
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
      And I wait 1 second
      Then user "translator_call_centre_agent@nbs.com" has contacts assigned in campaign "Testing One"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      And I should see "Mleko company"


    @_todo @snom
    Scenario: I can enable/disable dynamic calling

    @_done @_tested @ff5
    Scenario: I can navigate through contacts on call sheet when call is over
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_current_call_sheet"
      And the "contact_company_name" field should contain "Bon Jovi inc."
      And I follow translated action "campaigns.edit.show_button" within row containing "Stefanek corp"
      And I wait 5 second
      Then I should see "Stefanek corp" within "#contact_info"
      Then the "contact_company_name" field should contain "Stefanek corp"
    
    @_done @_tested_elsewhere
    Scenario: I can navigate through contacts details / results history / add result

    @_done @_tested @requested @ff5
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

    @_done @_tested @selenium @ff5
    Scenario: I can see new result form for specifying notes and result
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Call back" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see translated "call_results.new.form_title"
      And I fill in "Call back date" field with future datetime
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
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
    @m12 @$_call_centre_agent @requested @tgn @briefing @_tested @_done
    Scenario: I should see briefing area when I click "Briefing" on agent work screen
      Given campaign named "Testing One" exists with attributes "briefing:Briefing content here"
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_briefing_area"
      Then I should see "Briefing content here"

    # 5192
    @m12 @$_call_centre_agent @requested @tgn @briefing @_tested @_done
    Scenario: I can go back to my work screen when I click "Go to work screen"
      Given campaign named "Testing One" exists with attributes "briefing:Briefing content here"
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_briefing_area"
      Then I should see "Briefing content here"
      And I follow "Back"
      Then I should see translated "agent_work_screen.index.call_log"

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
      And I select "Send material" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I follow translated "materials.views.index.material_repository"
      And I wait 1 second
      And attach the file "sample image" to "material_asset"
      And I wait 1 second
      Then I should see "sample.jpg"
      And I follow "sample.jpg"
      Then I should see "sample.jpg"

    #5931
    @requested @$_call_centre_agent @m12 @ao @_done @non_testable
    Scenario: I can edit contact email when adding result type "send material"
#      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
#      And I select "Send material" from "result_id"
#      And I follow translated "call_results.edit.button_new_result"
#      And I fill in "call_result_contact_attributes_email_address" with "new@contact.com"
#      And I fill in "call_result_note" with "test"
#      And I fill in "Call back date" field with future datetime
#      And I follow translated "materials.views.index.material_repository"
#      And attach the file "sample image" to "material_asset"
#      And I follow "sample.jpg"
#      And I follow translated "call_results.new.save_button"

    #5931
    @requested @$_call_centre_agent @m12 @ao @_done @non_testable
    Scenario: When I add result "send material" then an email should be sent to contact email
#      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
#      And I select "Send material" from "result_id"
#      And I follow translated "call_results.edit.button_new_result"
#      And I fill in "call_result_contact_attributes_email_address" with "new@contact.com"
#      And I fill in "call_result_note" with "test"
#      And I fill in "Call back date" field with future datetime
#      And I follow translated "materials.views.index.material_repository"
#      And attach the file "sample image" to "material_asset"
#      And I follow "sample.jpg"
#      And I follow translated "call_results.new.save_button"
#      And last email sent should have been sent to recipient "new@contact.com"

    @requested @m13 @after_m12_presentation @tgn @$_call_centre_agent @_done @_tested
    Scenario: I can see files from "Materials Set" prepared by call centre
      Given I am not sign in
      Given I am on the homepage
      And I make sure current locale is "en"
      And I sign in as translator_call_centre@nbs.com with password secret
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/materials/"
      And attach the file "sample image" to "material_asset"
      And I press translated "materials.views.index.save_material"
      And I check "is_default"
      Given I am not sign in
      Given I am on the homepage
      And I make sure current locale is "en"
      And I sign in as translator_call_centre_agent@nbs.com with password secret
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Send material" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see "sample.jpg"


    @requested @m13 @after_m12_presentation @tgn @$_call_centre_agent @_done @_tested
    Scenario: I can select by checkboxes which files from "Materials Set" will be included in email
      Given I am not sign in
      Given I am on the homepage
      And I make sure current locale is "en"
      And I sign in as translator_call_centre@nbs.com with password secret
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/materials/"
      And attach the file "sample image" to "material_asset"
      And I press translated "materials.views.index.save_material"
      And I check "is_default"
      Given I am not sign in
      Given I am on the homepage
      And I make sure current locale is "en"
      And I sign in as translator_call_centre_agent@nbs.com with password secret
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Send material" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see "sample.jpg"
      And I uncheck "material_selected_1"

    @requested @m13 @after_m12_presentation @tgn @$_call_centre_agent @_done @_tested
    Scenario: I can upload and add new files to the set for the result being created
      Given I am not sign in
      Given I am on the homepage
      And I make sure current locale is "en"
      And I sign in as translator_call_centre@nbs.com with password secret
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I click hidden link by url regex "/callers\/campaigns\/\d+\/materials/"
      And attach the file "sample image" to "material_asset"
      And I press translated "materials.views.index.save_material"
      And I check "is_default"
      Given I am not sign in
      Given I am on the homepage
      And I make sure current locale is "en"
      And I sign in as translator_call_centre_agent@nbs.com with password secret
      And I follow translated "layout.main_menu.call_centre.campaigns"
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Send material" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see "sample.jpg"
      And I follow translated "materials.views.index.material_repository"
      And I wait 1 second
      And attach the file "sample image" to "material_asset"
      And I wait 1 second
      Then I should see "sample.jpg"
      And I follow "sample.jpg"
      And I should see "2" elements within CSS path "input[type=checkbox][id^=material_selected_]"

    @requested @m13 @after_m12_presentation @tgn @$_call_centre_agent @_done @_tested
    Scenario: I can click "Customize email" button and edit all email fields in modal box
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Send material" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I should see translated "call_results.new.customize_email_template"

    @m23 @requested @system @tgn @_done @_non_testable
    Scenario: Any customized email in the agent work screen should be saved

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
      Then I should see CSS path ".frm_head #selected_result_id"

    # as call centre agent
    @m12 @$_call_centre_agent @requested @my_results @tgn @_done @_tested
    Scenario: I can access "My results" from agent work screen
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      Then I follow translated "call_results.edit.my_results"
      And I should see translated "production.show.view.header"

    # A list of contacts which have results (including final results) assigend to them
    @m12 @$_call_centre_agent @requested @my_results @tgn @_done @_tested @_deprecated
    Scenario: I should see a list of contacts that have results assigned to them


    @m12 @$_call_centre_agent @requested @my_results @tgn @_done @_tested @_deprecated
    Scenario: I should see latest results on top of My results list

    @m12 @$_call_centre_agent @requested @my_results @tgn @_done @_tested @_deprecated
    Scenario: I can search contacts on My results list

    @m12 @$_call_centre_agent @requested @my_results @tgn @_done @_tested @_deprecated
    Scenario: I can edit contact when I click it on My results list

    @m12 @$_call_centre_agent @requested @my_results @tgn @_done @tested_elsewhere
    Scenario: I can edit results when I click contact on My results list

    @m13 @$_call_centre_agent @_done @_not_testable @is
    Scenario: I can find contact with auto complete search text field
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      Then I fill in "autocompleter" with "bon"

    @m13 @$_call_centre_agent @_done @_not_testable @is
    Scenario: I can see results from contact search as a clickable list

    @m13 @$_call_centre_agent @_done @_not_testable @is
    Scenario: I can open contact when I click on result from contact search

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: I can upgrade contact to category buyer
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_company_name" with "Custom company"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: Category buyer upgraded from lead should be subscribed to campaign's category by default
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      And category "Business" is in interests of user "newcategory_buyer888@nbs.com" "true"

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: When upgrading contact to category buyer, agent can select more subscription categories for created category buyer
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I select "Leisure" from "all_categories"
      And I follow translated "administration.categories.form.move_users_right"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      And category "Business" is in interests of user "newcategory_buyer888@nbs.com" "true"
      And category "Leisure" is in interests of user "newcategory_buyer888@nbs.com" "true"

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: Contact should receive customized emails with material and signup link
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I select "Leisure" from "all_categories"
      And I follow translated "administration.categories.form.move_users_right"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      And last email sent should have been sent to recipient "newcategory_buyer888@nbs.com"
      And last email sent should have content "/business"
      And last email sent should have content "Fairleads password: testin"
      And last email sent should have content "Fairleads username: newcategory_buyer888@nbs.com"

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: Agent can assign materials when upgrading contact to category buyer
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "materials.views.index.material_repository"
      And I wait 1 second
      And attach the file "sample image" to "material_asset"
      And I wait 1 second
      And I follow "sample.jpg"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_done @not_testable
    Scenario: Agent can customize email when upgrading contact to category buyer

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: Contact can sign up by clicking on link in email and entering password or using Facebook/Google/Linkedin
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      Given I am not sign in
      And I am on the homepage
      And I visit domain http://localhost
      And I sign in as newcategory_buyer888@nbs.com with password testin
      Then I should see translated "my_profile.edit.view.header"

    # his name account will already be set up by the contact information allready in the system.
    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: After sign up contact can confirm his account information
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      Given I am not sign in
      And I am on the homepage
      And I visit domain http://localhost
      And I sign in as newcategory_buyer888@nbs.com with password testin
      Then I should see translated "my_profile.edit.view.header_contact_confirmation"
      And the "user_category_supplier_company_name" field should contain "Bon Jovi inc."
      And the "user_category_supplier_first_name" field should contain "John"
      And the "user_category_supplier_last_name" field should contain "Dohn"
      And the "user_category_supplier_email" field should contain "newcategory_buyer888@nbs.com"
      And the "user_category_supplier_address_attributes_address_line_1" field should contain "LongRoad 2"
      And the "user_category_supplier_address_attributes_zip_code" field should contain "21-221"

    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent  @_tested @_done @ff5
    Scenario: After confirming his account information, contact should be redirected to his account home page
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      Given I am not sign in
      And I am on the homepage
      And I visit domain http://localhost
      And I sign in as newcategory_buyer888@nbs.com with password testin
      Then I should see translated "my_profile.edit.view.header_contact_confirmation"
      And I press translated "password.edit.view.button_update_user"
      Then I should see "Welcome to category: Business"

    # After he has confirmed his details he will receive a default (buyer welcome mail) with a link to the the category homepage, how he sign up (Facebook, Google of LinkedIn) just so he can remember to log on to fairleads again.
    @m13 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @_tested @_done @ff5
    Scenario: After confirming his account information, contact should receive welcome mail link link to his home page and login information
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to category supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "newcategory_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      Given I am not sign in
      And I am on the homepage
      And I visit domain http://localhost
      And I sign in as newcategory_buyer888@nbs.com with password testin
      Then I should see translated "my_profile.edit.view.header_contact_confirmation"
      And I press translated "password.edit.view.button_update_user"
      And last email sent should have been sent to recipient "newcategory_buyer888@nbs.com"
      And last email sent should have content "/business"
      And last email sent should have content "Login: newcategory_buyer888@nbs.com"
      And last email sent should have content "Linked with account: not linked"

    #Note change to “Internal note”
    #During confirmation of contact's account information header says "Confirm account information" instead of "My profile"
    #I should see company name when Upgrading contact to category buyer
    @m14 @requested @upgrade_to_category_buyer @tgn @$_call_centre_agent @tested_elsewhere @_done
    Scenario: Category buyer changes

    #7581
    @m19 @requested @upgrade_to_category_buyer @$_call_centre_agent @_done @_tested @tgn
    Scenario: I should be able to set for category buyer following properties: Newsletter, Allow invoicing, Do not charge vat, Team buyer and Deal maker enabled
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_company_name" with "Custom company"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "new_buyer888@nbs.com"
      And I check "call_result_user_not_charge_vat"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      And last email sent should have been sent to recipient "new_buyer888@nbs.com"
      And user "new_buyer888@nbs.com" with role "supplier" should have attributes "not_charge_vat:true"
      And user "new_buyer888@nbs.com" has deal maker role enabled
  
    @m14 @requested @my_results @$_call_centre_agent @tgn @_done @tested_elsewhere
    Scenario: I should see "My results" renamed to "Production" and displayed the same way as campaign's "Results"
    
    @m14 @requested @google_it @$_call_centre_agent @is @_done @_tested
    Scenario: I can google for company name from agent work screen
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      Then I click xpath "//a[@id='google_search_for_company_name']"

    @m14 @requested @new_result @$_call_centre_agent @tgn @non_testable @_done
    Scenario: I can see a white list of available variables that can be inserted into email in a popup
    
    @m14 @requested @new_result @$_call_centre_agent @tgn @non_testable @_done
    Scenario: When I click an item on the variables list it should be inserted into rich text editor
    
    @m14 @requested @note_information @$_call_centre_agent @is @_done @_tested
    Scenario: I can see result note on agent work screen
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I follow translated "agent_work_screen.index.show_pending_calls"
      Then I should see translated "contacts.table.note" within "#contacts"

    @m18 @campaign_results @_done @_tested @tgn
    Scenario: It should not be possible to create new results when campaign expired
    Given campaign named "Expired campaign" exists with attributes "start_date:10-01-2011,end_date:02-04-2011"
    And contact for company "Xena1" and campaign "Expired campaign" is assigned to user "translator_call_centre_agent@nbs.com"
    And I follow translated "layout.main_menu.call_centre.campaigns"
    When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
    Then I should see translated "call_results.edit.button_new_result"
    And I follow translated "layout.main_menu.call_centre.campaigns"
    When I follow translated action "campaigns.table.work_screen" within row containing "Expired campaign"
    Then I should not see translated "call_results.edit.button_new_result"

    @m18 @campaign_results @tgn @_done @_tested @hanging_js
    Scenario: I should be able to edit the result type of the final types
    And contact for company "Xena1" and campaign "Testing One" is assigned to user "translator_call_centre_agent@nbs.com"
    And contact for company "Xena1" has assigned result "Call back" created by "translator_call_centre_agent@nbs.com"
    And I follow translated "layout.main_menu.call_centre.campaigns"
    When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
    And I follow translated "agent_work_screen.index.show_call_log_for_current_contact"
    When I follow action "Edit" within row containing "Call back"
    And I wait 2 second
    And I select "Upgrade to category supplier" from "call_result_result_id"
    And I wait 2 second
    And I follow translated "call_results.edit.save_button"
    And I am not sign in
    And I go to the homepage

    #7574
    @m19 @requested @upgrade_to_buyer @$_call_centre_agent @_done @_tested @tgn
    Scenario: I can upgrade contact to buyer
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to supplier" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_company_name" with "Custom company"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "Londek Zdroj"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_email_address" with "new_buyer888@nbs.com"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      And last email sent should have been sent to recipient "new_buyer888@nbs.com"
      And last email sent should have content "/supplier_home"
      And last email sent should have content "Fairleads password: testin"
      And last email sent should have content "Fairleads username: new_buyer888@nbs.com"
      Then I am not sign in
      And I am on the homepage
      And I visit domain http://localhost
      And I sign in as new_buyer888@nbs.com with password testin
      Then I should see translated "my_profile.edit.view.header_contact_confirmation"
      And I press translated "password.edit.view.button_update_user"
      And last email sent should have been sent to recipient "new_buyer888@nbs.com"
      And last email sent should have content "/supplier_home"
      And last email sent should have content "Login: new_buyer888@nbs.com"
      And last email sent should have content "Linked with account: not linked"


    #7574
    @m19 @requested @upgrade_to_member @$_call_centre_agent @_done @_tested @tgn
    Scenario: I can upgrade contact to member (procurment manager)
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      And I select "Upgrade to member" from "selected_result_id"
      And I follow translated "call_results.edit.button_new_result"
      And I fill in "call_result_contact_company_name" with "Custom company"
      And I fill in "call_result_contact_first_name" with "John"
      And I fill in "call_result_contact_last_name" with "Dohn"
      And I fill in "call_result_contact_address_line_1" with "LongRoad 2"
      And I fill in "call_result_contact_address_line_3" with "NY"
      And I fill in "call_result_contact_zip_code" with "21-221"
      And I fill in "call_result_contact_phone_number" with "+44 92423423232"
      And I fill in "call_result_contact_email_address" with "new_member888@nbs.com"
      And "call_result_contact_subscription_plan_id" should be selected for value "Free member subscription"
      And I select "Free member subscription" from "call_result_contact_subscription_plan_id"
      And I check "call_result_contact_newsletter_on"
      And I follow translated "call_results.new.save_button"
      And I wait 1 second
      Then I should see translated "call_results.create.flash.successfully_added"
      And last email sent should have been sent to recipient "new_member888@nbs.com"
      And last email sent should have content "fairdeals"
      And last email sent should have content "Fairdeals password: testin"
      And last email sent should have content "Fairdeals username: new_member888@nbs.com"
      Then I am not sign in
      And I am on the homepage
      And I visit domain http://fairdeals.eu
      And I sign in as new_member888@nbs.com with password testin
      Then I should see translated "my_profile.edit.view.header_contact_confirmation"
      And I press translated "password.edit.view.button_update_user"
      And last email sent should have been sent to recipient "new_member888@nbs.com"
      And last email sent should have content "fairdeals"
      And last email sent should have content "Login: new_member888@nbs.com"
      And last email sent should have content "Linked with account: not linked"

    #7746
    @m20 @requested @tgn @_tested @_done
    Scenario:  I can add new contact from agent work screen and it is already assigned to me (even if my campaign max contacts count was reached)
      When I follow translated action "campaigns.table.work_screen" within row containing "Testing One"
      Then I follow translated "agent_work_screen.index.new_contact"
      And I fill in "contact_company_name" with "ABC Ltd" within "#modal_new_contact_form_div"
      And I fill in "contact_company_phone_number" with "+45 3403248932" within "#modal_new_contact_form_div"
      And I select "Denmark" from "contact_country_id" within "#modal_new_contact_form_div"
      Then I press translated "agent_work_screen.index.create"
      And I wait 3 second
      And I should see translated "contacts.create.flash.contact_successfully_created"
      Then I am not sign in
      And I am on the homepage
      And contact "ABC Ltd" should be assigned to user "translator_call_centre_agent@nbs.com"

  #9603
  @m27 @requested @tgn @_done @_non_tested
  Scenario: When upgrading to member I can insert links to deals from CKEDITORs popup

  #9603
  @m27 @requested @tgn @_done @_non_tested
  Scenario: Popup from CKEDITOR allows to select multiple deals and insert then to email template editor

  #9602
  @m27 @requested @tgn @_done @_tested_elsewhere
  Scenario: When upgrading contact to member / supplier / cat supplier I can select subscription type

  #9602
  @m27 @requested @tgn @_done @_tested_elsewhere
  Scenario: I can enable a newsletter for user upgraded from contact

  #9995
  @m28 @requested
  Scenario: When upgrading contact to member I can choose deals that will be requested after the account creation

  #9995
  @m28 @requested
  Scenario: When upgrading contact to member I can fill out the templates

  #9995
  @m28 @requested
  Scenario: When upgrading contact to member I can choose only deals that are allowed by the subscription type

  #9995
  @m28 @requested
  Scenario: When upgrading contact to member I can change subscription after I selected deals but they will be lost

  #9995
  @m28 @requested
  Scenario: When contact is upgraded to member the e-mails for each request won't be sent out

  #9989
  @m28 @requested @tgn @_done @_tested_elsewhere
  Scenario: A free subscription should be selected by default when upgrading contact to account
