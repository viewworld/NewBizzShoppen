@lead_manager @$_lead_user @m2
Feature: My leads for lead user

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email lead_user44@person.com exists as subaccount for customer customer@person.com
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:Johan Printing,email_address:john.printer@fghprintesrs.noserver.com,address:London 847-387 Veilingstreet 46,clicks_count:17,exposures_count:887,company_name:FGH Printers,lead_name:John Printer,hidden_description:Hidden description for this lead,purchase_value:3034.87,description:Public desc for printers deal"
  And lead Monitors LCD deal exists within category Computers
  And lead Monitors LCD deal exists with attributes "hidden_description:Hidden description for this lead,purchase_value:2002.87"
  And lead Keyboards deal exists within category Office
  And lead Mouses deal exists within category Computers
  And lead Printers ultimate deal is bought by user customer@person.com with role customer and is assigned to user lead_user2@person.com with role lead_user
  And lead Monitors LCD deal is bought by user customer@person.com with role customer and is assigned to user lead_user2@person.com with role lead_user
  And lead Keyboards deal is bought by user customer@person.com with role customer and is assigned to user lead_user2@person.com with role lead_user
  And lead Mouses deal is bought by user customer@person.com with role customer and is assigned to user lead_user44@person.com with role lead_user
  Then I sign in as lead_user2@person.com with password supersecret

@tgn @_done @_tested
Scenario: I can see details of lead that is assigned to me
  Given I follow translated "lead_user.lead_purchases.index.view.view_lead"
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

@tgn @_tested
Scenario: I can scope down leads listing with filter
  Given I select "Denmark" from "search_with_country"
  And I select "Computers" from "search_with_category"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  When I fill in "search_with_keyword" with "printers"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see "Monitors LCD deal"
  When I fill in "search_with_keyword" with ""
  And I select "3000" from "search_with_deal_value_from"
  And I select "5000" from "search_with_deal_value_to"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see "Monitors LCD deal"
  But I should see "Printers ultimate deal"

@tgn @_tested
Scenario: I can see lead header, purchase value, description, contact info
  Given I should see "Printers ultimate deal"
  And I should see "3034.87"
  And I should see "Public desc for printers deal"
  And I should see "John Printer"
  And I should see "john.printer@fghprintesrs.noserver.com"

@tgn @_tested
Scenario: I should see company name on leads listing
  Then I should see "FGH Printers"

@tgn @bk @_to_test
Scenario: I can download lead as CSV

@tgn @bk @_to_test
Scenario: I can bulk download leads as CSV

@tgn @_tested
Scenario: I can see paginated list of leads
  Given pagination per page size in model LeadPurchase is set to 1
  And I go to lead user lead purchases
  Then I follow "2"
  Then I follow "1"

@tgn @_tested
Scenario: I can see all leads bought by lead buyers that belong to my account
  Then I should see "Printers ultimate deal"
  Then I should see "Monitors LCD deal"
  Then I should see "Keyboards deal"
  Then I should not see "Mouses deal"

Scenario: I can see all leads requested by lead users that belong to my account  

@tgn @_tested
Scenario: I should see created by and certification level for each lead
  Then I should see "Johan Printing"
  And I should see translated "models.lead.certification.lvl0"

@m3
Scenario: I should see rating % for each lead

@_tgn @_tested
Scenario: I can see company contact on lead details page
  When I fill in "search_with_keyword" with "printers"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I follow translated "lead_user.lead_purchases.index.view.view_lead"
  Then I should see "John Printer"
  And I should see "john.printer@fghprintesrs.noserver.com"
  And I should see "FGH Printers"
  And I should see "London 847-387 Veilingstreet 46"

Scenario: I can email the lead if email information were provided
# popup with email form appears
  
@tgn @_done @_tested
Scenario: I should see hottness, novelty, exposure, clicks
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@tgn @_tested
Scenario: I can see company contact
  Then I should see "London 847-387 Veilingstreet 46"

@tgn @_tested @selenium
Scenario: I can toggle select leads
  Then I check "mark_all"

@tgn @_tested @selenium
Scenario: I can set status of lead (not contacted, contacted, meeting, signed)
  Given I fill in "search_with_keyword" with "Printers ultimate deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I select "Signed" from "lead_purchase_state"
  And I go to lead user lead purchases
  Given I fill in "search_with_keyword" with "Printers ultimate deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then "lead_purchase_state" should be selected for value "Signed"

@tgn @_tested @selenium
Scenario: I can bulk set status of leads (not contacted, dontacted, meeting, signed)
  Given I check "mark_all"
  And I select "Signed" from "bulk_state"
  And I press translated "lead_user.lead_purchases.index.view.bulk_update_button"
  Then I should see translated "lead_user.bulk_lead_purchase_update.create.flash.lead_purchases_updated_successfully"

@tgn @bk @_to_test
Scenario: I can print out lead information

@tgn @bk @_to_test
Scenario: I can print out multiple leads information

@bk @_todo
Scenario: I should see a yellow color for a lead with expiration date ending in 3 days