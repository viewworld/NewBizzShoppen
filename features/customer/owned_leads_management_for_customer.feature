@lead_manager @$_customer @m2
Feature: Owned leads management for customer

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role supplier
  And user "customer@person.com" has team buyers enabled
  And user customer@person.com with role supplier exists with attributes "company_name:Liane Young,first_name:Liane,last_name:Young"
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email lead_user3@person.com exists as subaccount for customer customer@person.com
  And user lead_user2@person.com with role lead_user exists with attributes "company_name:John McCoy,first_name:John,last_name:McCoy"
  And user lead_user3@person.com with role lead_user exists with attributes "company_name:Martin Gleesse,first_name:Martin,last_name:Gleesse"
  And someone is signed up and confirmed as user with email someagent@nbs.com and password secret and role agent with attributes "company_name:SomeAgent Joe"
  And lead Printers ultimate deal is created by user someagent@nbs.com with role agent
  And a lead Printers ultimate deal exists within category Computers and is bought by user customer@person.com with role supplier
  And lead "Printers ultimate deal" has attributes "purchase_value:89.93,hidden_description:Lorem ipsum dolor sit amet consectetur adipiscing elit Suspendisse posuere turpis eget lorem sollicitudin ac volutpat Suspendisse posuere turpis eget lorem sollicitudin ac volutpat desc_end"
  And lead Keyboards deal exists within category Computers
  And lead Mouses ultimate deal exists within category Computers
  And lead Plotters ultimate deal exists within category Office
  And lead Desks ultimate deal exists within category Office
  And lead "Keyboards deal" was requested by user "lead_user2@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead "Mouses ultimate deal" was requested by user "lead_user3@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead "Plotters ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead "Desks ultimate deal" was requested by user "lead_user3@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead Keyboards deal exists with attributes "creator_name:Philip Glass,price:9893.56,purchase_value:4002.21,description:Public description for keyboards"
  Then I sign in as customer@person.com with password supersecret

@tgn @_tested @selenium @_done
Scenario: I can assign any of my leads to any of lead users that belong to my account
  Then I go to supplier lead purchases
  Given I select "Martin Gleesse" from "assignee_id"
  And I go to supplier lead purchases
  Then "assignee_id" should be selected for value "Martin Gleesse"

@_done @tgn @m3 @non_testable @noguess
Scenario: When I assign a user to a lead, then assigned_at time is recorded

@tgn @m3 @_done @_tested @selenium
Scenario: I can assign any of my leads back to myself
  Given I go to supplier lead purchases
  And I select "Martin Gleesse" from "assignee_id"
  Given I go to supplier lead purchases
  And I select "Liane Young" from "assignee_id"
  Given I go to supplier lead purchases
  Then "assignee_id" should be selected for value "Liane Young"

@tgn @_tested @selenium @_done
Scenario: I can unassing any of my leads from lead user that belong to my account and had that lead assigned to his account
  Then I go to supplier lead purchases
  Given I select "" from "assignee_id"
  And I go to supplier lead purchases
  Then "assignee_id" should be selected for ""

@tgn @_done @_tested
Scenario: Assignment should not be possible/visible if I have not lead users associated with me
  Given I am not sign in
  Given user customer@person.com with role supplier has no subaccounts
  Then I sign in as customer@person.com with password supersecret
  And I go to supplier lead purchases
  Then I should not see field "assignee_id"
  And I should not see field "bulk_assignee_id"

@tgn @_done @_tested @selenium
Scenario: I can transfer assignment of any of my leads from any of lead users that belong to my account to any other lead user that belong to my account
  Then I go to supplier lead purchases
  Given I select "Martin Gleesse" from "assignee_id"
  And I go to supplier lead purchases
  Given I select "John McCoy" from "assignee_id"
  And I go to supplier lead purchases
  Then "assignee_id" should be selected for value "John McCoy"

@tgn @_done @_non_testable
Scenario: Requested leads listing should lack pagination
  Given pagination per page size in model LeadRequest is set to 1
  Then I go to suppliers lead requests
  And I should see "Mouses ultimate deal"
  And I should see "Plotters ultimate deal"


@tgn @_done @_tested
Scenario: I should see who has requested each lead
  Then I go to suppliers lead requests
  And I should see "John McCoy"
  And I should see "Martin Gleesse"

@tgn @_tested @_done
Scenario: I can scope down requested leads listing with filter
  Then I go to suppliers lead requests
  And I fill in "search_with_keyword" with "ultimate"
  And I press translated "supplier.lead_requests.index.view.search.search_button"
  And I should not see "Keyboards deal"
  Then I select "Office" from "search_with_category"
  And I press translated "supplier.lead_requests.index.view.search.search_button"
  And I should not see "Mouses ultimate deal"
  Then I select "John McCoy" from "search_with_requested_by"
  And I select "Denmark" from "search_with_country"
  And I press translated "supplier.lead_requests.index.view.search.search_button"
  And I should not see "Desks ultimate deal"

@tgn @_tested @_done
Scenario: I should see lead header, lead price, purchase value and public description for each requested lead
  Then I go to suppliers lead requests
  And I should see "Keyboards deal"
  And I should see "9,893.56"
  And I should see "4,002.21"
  And I should see "Public description for keyboards"

@tgn @_tested @_done
Scenario: I should see certification level for each requested lead
  Then I go to suppliers lead requests
  And I should see translated "models.lead.certification.lvl1"

@m6 @added @tgn @_done @_tested_elsewhere
Scenario: I should see rating % for each requested lead

@tgn @_done @_tested
Scenario: I can delete lead requested by lead user that belong to my account
  Then I go to suppliers lead requests
  And I follow translated "supplier.lead_requests.index.view.reject_lead_request_link"
  Then I should see translated "supplier.lead_requests.index.flash.lead_request_rejected_successfully"

#I do not know if this is not already done...
@tgn @_tested @selenium @_done
Scenario: I can bulk delete leads requested by lead users that belong to my account
  Then I go to suppliers lead requests
  And I check "mark_all"
  And I follow translated "supplier.lead_requests.index.view.button_bulk_destroy_lead_request"
  Then I should see translated "flash.bulk_lead_requests.destroy.notice"

@tgn @_tested  @selenium  @noguess @_done
Scenario: I can set response deadline for lead
  Given I go to supplier lead purchases
  And I fill in "response_deadline" with "2011-01-01"
  And I make ajax call to save lead purchase for lead Printers ultimate deal
  And I wait 3 second
  Given I go to supplier lead purchases
  Then "response_deadline" should be selected for "01-01-2011"

@tgn @_tested @selenium  @noguess @_done
Scenario: I can bulk set response deadlines for lead
  Given I go to supplier lead purchases
  And I check "mark_all"
  And I fill in "bulk_response_deadline" with "2011-01-11"
  And I follow translated "lead_supplier.lead_purchases.index.view.bulk_update_button"
  Then I should see translated "supplier.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully"

@ao @nontestable  @noguess
Scenario: I am notified by email when dealine expires and status of lead has not changed

#Accessible from owned leads listing
#Just prepare interface for sending an email (based on email template as ususal) with recipient field read-only and prepopulated
#Have a look at bulk_lead_share_by_email_controller.rb for sume hints regarding prerendering email template
@ao @_tested @_done
Scenario: I can email the lead if email information were provided
  Given I am signed up and confirmed as user with email customer@nbs.com and password secret and role supplier
  And I sign out
  And I am on the home page
  And I sign in as customer@nbs.com with password secret
  And a lead AwesomeLead exists within category Test and is bought by user customer@nbs.com with role supplier
  And I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I follow translated "lead_supplier.lead_purchases.index.view.email_lead" within ".lead"
  And I press translated "lead_supplier.contact_lead_by_email.new.view.send_email_button"
  Then I should see translated "flash.contact_lead_by_email.create.notice"

@tgn @_tested @selenium @_done
Scenario: I can send selected lead by email
  When I go to supplier lead purchases
  Then I execute js for display action block for "lead_purchases_table"
  And I click hidden translated link "lead_supplier.lead_purchases.index.view.share_email_link"
  And I press translated "lead_supplier.bulk_lead_share_by_email.new.view.send_email_button"
  Then I should see translated "flash.bulk_lead_share_by_email.create.notice"

@m8b @_requested @tgn @_done @non_testable
Scenario: I can use ckeditor with limited toolbar for writting message in share by email function

@tgn @_tested @selenium @_done
Scenario: I can bulk send selected leads by email
  When I go to supplier lead purchases
  And I check "mark_all"
  And I follow translated "lead_supplier.lead_purchases.index.view.bulk_share_by_email_link" within ".bulk_links"
  And I press translated "lead_supplier.bulk_lead_share_by_email.new.view.send_email_button"
  Then I should see translated "flash.bulk_lead_share_by_email.create.notice"

#Adjust to current requirements first
@m4 @tgn @_done @non_testable
Scenario: I can rate lead that I have access for (good, bad, fake)

#Adjust to current requirements first
@m4 @tgn @_done @non_testable
Scenario: I can bulk rate leads that I have access for (good, bad, fake)

@ao @_tested @selenium @_done
Scenario: I can set status of lead
  And I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  # And I select translated "lead_purchases.statuses.contacted" from "state" [within ".lead tr:first-of-type"]
  And I select translated "lead_purchases.statuses.contacted" from "state"
  And I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then "state" should be selected for value translated "lead_purchases.statuses.contacted"

@ao @_tested @selenium @_done
Scenario: I can bulk set status of leads
  And I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I select translated "lead_purchases.statuses.contacted" from "bulk_state" within "#bulk_actions_form"
  And I check "mark_all"
  And I follow translated "lead_supplier.lead_purchases.index.view.bulk_update_button"
  Then "state" should be selected for value translated "lead_purchases.statuses.contacted"

@m5 @added @lead_templates @tgn @_tested @_requested @_done
Scenario: I can see lead template fields with public values for each lead
  Given template named "Printers details" for category "Computers" is created by user "ccagent@person.com" with role "call_centre_agent"
  And template named "Printers details" has following fields "printers protocol:true:false, vendor name:false:false, versions:false:false"
  And template named "Printers details" for lead "Printers ultimate deal" has values "printers protocol:xprinter3, vendor name:Havlett Packard, versions:3983c-39282f"
  Given I go to supplier lead purchases
  Then I should see "PRINTERS DETAILS"
  And I should see "printers protocol"
  And I should see "vendor name"
  And I should see "versions"
  And I should see "xprinter3"
  And I should see "Havlett Packard"
  And I should see "3983c-39282f"

@m5 @added @lead_templates @tgn @_done @_tested_elsewhere
Scenario: I can see lead template fields with hidden values for each lead that I have bought

@m6 @added @ao @selenium @_done @_tested
Scenario: Hidden description should be truncated and expandable by JS
  When I go to supplier lead purchases
  And I follow translated "common.js.read_more"
  Then I should see translated "common.js.collapse_expanded_text"

@m6 @tgn @selenium @_tested @_requested @_done
Scenario: I can add note to owned lead
  When I go to supplier lead purchases
  And I show accordion details for row "#lead_single_purchase_1"
  And I fill in "owner_note_1" with "My custom note"
  Then I follow translated "lead_supplier.lead_purchases.index.view.update_owner_note"
  When I go to supplier lead purchases
  And I show accordion details for row "#lead_single_purchase_1"
  And the "owner_note_1" field should contain "My custom note"

# https://redmine.selleo.com/issues/4021
# I should see show page when I click a row!
@m6 @ao @_deprecated @_done @_requested
Scenario: I should not see show page for owned lead when accordion style listing is used
    
@m7 @_requested @_tested @tgn @_done
Scenario: I can't see purchase value on my leads listing
  When I go to supplier lead purchases
  And I should not see "89.93"

# Add creator name under purchase date (should display Agent’s screen name) in details in accordion
@m7 @_requested @selenium @tgn @_tested @_done
Scenario: I can see creator name under purchase date
  When I go to supplier lead purchases
  Given I show accordion details for row "#lead_single_purchase_1"
  And I should see "SomeAgent Joe"

# My leads accordion - do not trigger accordion on mouse hover but on link-click instead (i.e. show more details)
@m7 @_requested @selenium @tgn @_tested @_done
Scenario: I can see details in accordion when clicking on header
  When I go to supplier lead purchases
  And I show accordion details for row "#lead_single_purchase_1"
  And I should see "Uniqueness"
  And I should see "Purchase date"

# 5768
# when facebook/linked URL is specified
@_requested @m11 @is @_done @_not_testable
Scenario: Facebook and Linkedin icons should be displayed next to lead header and be clickable

#10982
@_requested @m32 @tgn
Scenario: I should not see lead details on lead purchase hidden row and note field should be bigger

#10983
@_requested @m32 @tgn
Scenario: I should see hidden lead details on a lead public view if I have bought the lead
