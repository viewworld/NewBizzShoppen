@lead_manager @$_lead_user @m2
Feature: My leads browsing

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email lead_user44@person.com exists as subaccount for customer customer@person.com
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "hidden_description:Hidden description for this lead,purchase_value:3034.87"
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
  And I open page in browser
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
  And I open page in browser

@tgn @_todo
Scenario: I can see lead header, purchase value, description, contact info

@tgn @_todo
Scenario: I should see company name on leads listing

@bk @_todo
Scenario: I can download lead as CSV

@bk @_todo
Scenario: I can bulk download leads as CSV

@tgn @_todo
Scenario: I can see paginated list of leads

Scenario: I can see all leads bought by lead buyers that belong to my account

Scenario: I can see all leads requested by lead users that belong to my account  

Scenario: I should see created by, rating % and certification level for each lead

Scenario: I can see company contact on lead details page

Scenario: I can email the lead if email information were provided
# popup with email form appears
  
@tgn @_done @_to_test
Scenario: I should see hottness, novelty, exposure, clicks

@tgn @_todo
Scenario: I can see company contact

@tgn @_todo
Scenario: I can toggle select leads

Scenario: I can set status of lead (not contacted, dontacted, meeting, signed)

Scenario: I can bulk set status of leads (not contacted, dontacted, meeting, signed)

@bk @_todo
Scenario: I can print out lead information

@bk @_todo
Scenario: I can print out multiple leads information

@bk @_todo
Scenario: I should see a yellow color for a lead with expiration date ending in 3 days