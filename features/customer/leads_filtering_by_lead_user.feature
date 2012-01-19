@lead_manager @$_customer @m2
Feature: Leads filtering by lead user

#This is basically filtering by assignee_id - so do not create new view for that, just add dropdown with user selection to filter in Owned
#Leads view. Probably all tests beside the first will be possible to be marked as @_tested_elsewhere

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role supplier
  And user customer@person.com with role supplier exists with attributes ""
  And user "customer@person.com" has team buyers enabled
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email lead_user44@person.com exists as subaccount for customer customer@person.com
  And user lead_user2@person.com with role lead_user exists with attributes "company_name:John McCoy,first_name:John,last_name:McCoy"
  And user lead_user44@person.com with role lead_user exists with attributes "company_name:Martin Gleesse,first_name:Martin,last_name:Gleesse"
  And lead Printers ultimate deal exists within category Computers
  And lead Monitors LCD deal exists within category Computers
  And lead Keyboards deal exists within category Office
  And lead Mouses deal exists within category Office
  And lead Keyboards deal exists with attributes "purchase_value:3001.99,zip_code:123"
  And lead Mouses deal exists with attributes "purchase_value:4400.99,zip_code:456"
  And lead Printers ultimate deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
  And lead Monitors LCD deal is bought by user customer@person.com with role supplier and is assigned to user lead_user44@person.com with role lead_user
  And lead Keyboards deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
  And lead Mouses deal is bought by user customer@person.com with role supplier and is assigned to user lead_user44@person.com with role lead_user
  And purchase for lead "Mouses deal" and user "customer@person.com" exists with attributes "state:1"
  Then I sign in as customer@person.com with password supersecret
  Then I go to supplier lead purchases

@tgn @_tested @_done
Scenario: I can browse leads assigned to one of my lead users with pagination
  Given I should see "Printers ultimate deal"
  And I should see "Monitors LCD deal"
  And I should see "Keyboards deal"
  And I should see "Mouses deal"
  Given I select "John McCoy" from "search_with_assignee"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see "Monitors LCD deal"
  Then I should not see "Mouses deal"

@tgn @_tested_elsewhere @_done
Scenario: I can see lead header, purchase value, lead price, description, hottness, novelty, exposures, clicks

@tgn @_tested_elsewhere @_done
Scenario: I can see created by, rating, certification level

@tgn @_tested @_done
Scenario: I can see the status of that lead assigned by my lead user
  When I fill in "search_with_keyword" with "Mouses deal"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then "state" should be selected for value "Contacted"

@tgn @_tested @_done
Scenario: I can filter leads
  Given I select "Denmark" from "search_with_country"
  Given I select "Office" from "search_with_category"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see "Printers ultimate deal"
  And I should not see "Monitors LCD deal"
  And I fill in "search_with_zip_code" with "123"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should see "Keyboards deal"
  And I should not see "Mouses deal"

@m6 @tgn @_done @_tested_elsewhere
Scenario: I should be able to click link in subaccounts listing and go straight to that users's leads listing