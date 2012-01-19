@lead_manager @$_lead_user @m2
Feature: My leads for lead user

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email lead_user44@person.com exists as subaccount for customer customer@person.com
  And lead Printers ultimate deal exists within category Computers
  And someone is signed up and confirmed as user with email johnprinting@nbs.com and password secret and role agent with attributes "company_name:Johan Printing"
  And lead Printers ultimate deal is created by user johnprinting@nbs.com with role agent
  And lead Printers ultimate deal exists with attributes "creator_name:Johan Printing,email_address:john.printer@fghprintesrs.noserver.com,address_line_3:London,zip_code:847-387,address_line_1:Veilingstreet 46,clicks_count:17,exposures_count:887,company_name:FGH Printers,contact_name:John Printer,hidden_description:Hidden description for this lead,purchase_value:3034.87,description:Public desc for printers deal,published_at:01-01-2011"
  And lead Monitors LCD deal exists within category Computers
  And lead Monitors LCD deal exists with attributes "hidden_description:Hidden description for this lead,purchase_value:2002.87"
  And lead Keyboards deal exists within category Office
  And lead Mouses deal exists within category Computers
  And lead Printers ultimate deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
  And lead Monitors LCD deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
  And lead Keyboards deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
  And lead Mouses deal is bought by user customer@person.com with role supplier and is assigned to user lead_user44@person.com with role lead_user
  Then I sign in as lead_user2@person.com with password secret
  And I follow translated "layout.main_menu.lead_user.lead_purchases"

@tgn @_done @_tested
Scenario: I can see details of lead that is assigned to me
  Given I follow "Printers ultimate deal"
  Then I should see translated "lead_user.lead_purchases.show.view.header"
  And I should see "Hidden description for this lead"

@tgn @_done @_tested
Scenario: I can access leads that are assigned to me only (as lead user)
  Given I should not see "Mouses deal"

@tgn @_done @_tested
Scenario: I can see all leads that I have access for
  Given I should see "Printers ultimate deal"
  Given I should see "Monitors LCD deal"
  Given I should see "Keyboards deal"

@tgn @_tested @_done
Scenario: I can scope down leads listing with filter
  Given I select "Denmark" from "search_with_country"
  And I select "Computers" from "search_with_category"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  When I fill in "search_with_keyword" with "printers"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see "Monitors LCD deal"
  When I fill in "search_with_keyword" with ""
  And I fill in "search_with_zip_code" with "847-387"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see "Monitors LCD deal"
  But I should see "Printers ultimate deal"

@tgn @_tested @_done
Scenario: I can see lead header, description, contact info but not purchase value
  Given I should see "Printers ultimate deal"
  And I should not see "3,034.87"
  And I should see "Public desc for printers deal"
  And I should see "John Printer"
  And I should see "john.printer@fghprintesrs.noserver.com"

@tgn @_tested @_done
Scenario: I should see company name on leads listing
  Then I should see "FGH Printers"

@tgn @bk @_tested @_done
Scenario: I can download lead as CSV
  Given I fill in "search_with_keyword" with "Printers ultimate deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I follow translated "lead_user.lead_purchases.index.view.download_csv_link"
  And I should see "Printers ultimate deal"
  And I should see "Public desc for printers deal"

@tgn @bk @_tested @selenium @_done
Scenario: I can bulk download leads as CSV
  Then I check "mark_all"
  And I follow translated "lead_user.lead_purchases.index.view.bulk_download_csv_link_short"

@tgn @_tested @_done
Scenario: I can see paginated list of leads
  Given pagination per page size in model LeadPurchase is set to 1
  And I go to lead user lead purchases
  Then I follow "2"
  Then I follow "1"

@tgn @_tested @_done
Scenario: I can see all leads bought by lead buyers that belong to my account
  Then I should see "Printers ultimate deal"
  Then I should see "Monitors LCD deal"
  Then I should see "Keyboards deal"
  Then I should not see "Mouses deal"

@noguess
Scenario: I can see all leads requested by lead users that belong to my account

@tgn @_tested @_done
Scenario: I should see created by and certification level for each lead
  Then I should see "Johan Printing"
  And I should see translated "models.lead.certification.lvl1"

@m4 @tgn @_tested @added @_deprecated @_done
Scenario: I should see rating % for each lead
#  Given a lead "Printers ultimate deal" has good rating
#  Given All leads have refreshed average ratings
#  Given I go to lead user lead purchases
#  Then I should see "100%"

@tgn @_tested @_done
Scenario: I can see company contact on lead details page
  When I fill in "search_with_keyword" with "printers"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I follow "Printers ultimate deal"
  Then I should see "John Printer"
  And I should see "john.printer@fghprintesrs.noserver.com"
  And I should see "FGH Printers"
  And I should see "London"
  And I should see "847-387"
  And I should see "Veilingstreet 46"

#Accessible from my (assigned) leads listing
#Just prepare interface for sending an email (based on email template as ususal) with recipient field read-only and prepopulated
#Have a look at bulk_lead_share_by_email_controller.rb for sume hints regarding prerendering email template
@ao @_done @_tested
Scenario: I can email the lead if email information were provided
  And an user with role lead_user and email leaduser87@nbs.com exists as subaccount for customer customer@nbs.com
  And I sign out
  And I sign in as leaduser87@nbs.com with password secret
  And lead AwesomeLead is bought by user customer@nbs.com with role supplier and is assigned to user leaduser87@nbs.com with role lead_user
  And I follow translated "layout.main_menu.lead_user.lead_purchases"
  And I follow translated "lead_user.lead_purchases.index.view.email_lead" within ".lead"
  And I press translated "lead_user.contact_lead_by_email.new.view.send_email_button"
  Then I should see translated "flash.contact_lead_by_email.create.notice"

@tgn @_done @_tested
Scenario: I should see hottness, publish date, exposure, clicks
  Then I should see translated "models.lead.hotness.lvl2"
  And I should see "01-01-2011"

@tgn @_tested @_done
Scenario: I can see company contact
  Then I should see "London"
  And I should see "847-387"
  And I should see "Veilingstreet 46"

@tgn @_tested @selenium @_done
Scenario: I can toggle select leads
  Then I check "mark_all"

@tgn @_tested @selenium @_done
Scenario: I can set status of lead (not contacted, contacted, meeting, signed)
  Given I fill in "search_with_keyword" with "Printers ultimate deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I select "Signed" from "state"
  And I go to lead user lead purchases
  Given I fill in "search_with_keyword" with "Printers ultimate deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then "state" should be selected for value "Signed"

@tgn @_tested @selenium @_done
Scenario: I can bulk set status of leads (not contacted, dontacted, meeting, signed)
  Given I check "mark_all"
  And I select "Signed" from "bulk_state"
  And I follow translated "lead_user.lead_purchases.index.view.bulk_update_button"
  Then I should see translated "lead_user.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully"

@tgn @bk @_tested @_done
Scenario: I can print out lead information
  Given I fill in "search_with_keyword" with "Printers ultimate deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I follow translated "lead_user.lead_purchases.index.view.print_link"
  Given I should see "Printers ultimate deal"
  And I should see "Public desc for printers deal"
  And I should see "john.printer@fghprintesrs.noserver.com"

@tgn @bk @selenium @_tested @_done
Scenario: I can print out multiple leads information
  Given I check "mark_all"
  And I follow translated "lead_user.lead_purchases.index.view.bulk_print_link_short"
  Then I should see "Printers ultimate deal"
  Then I should see "Keyboards deal"
  Then I should see "Monitors LCD deal"

@ao @_tested @_done @noguess
Scenario: I should see a yellow color for a lead with expiration date ending in 3 days
  Given lead Printers ultimate deal has deadline in 2 days from now
  And LeadPurchase statuses are updated
  And I follow translated "layout.main_menu.lead_user.lead_purchases"
  Then list item should be highlighted

@m5 @added @lead_templates @tgn @_tested @_done
Scenario: I can see lead template fields with public values for each lead
  Given template named "Printers details" for category "Computers" is created by user "ccagent@person.com" with role "call_centre_agent"
  And template named "Printers details" has following fields "printers protocol:true:false, vendor name:false:false, versions:false:false"
  And template named "Printers details" for lead "Printers ultimate deal" has values "printers protocol:xprinter3, vendor name:Havlett Packard, versions:3983c-39282f"
  And I follow translated "layout.main_menu.lead_user.lead_purchases"
  Then I should see "PRINTERS DETAILS"
  And I should see "printers protocol"
  And I should see "vendor name"
  And I should see "versions"
  And I should see "Havlett Packard"
  And I should see "3983c-39282f"
  And I should see "xprinter3"
  And I should not see translated "shared.lead_templates.listing.hidden_value"

@m5 @added @lead_templates @tgn @_done @_tested_elsewhere
Scenario: I can see lead template fields with hidden values for each lead that I have been assigned to