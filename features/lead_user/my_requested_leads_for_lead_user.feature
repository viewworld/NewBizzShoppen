@lead_manager @$_lead_user @m2
Feature: My requested leads for lead user

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And user "lead_user2@person.com" with role "lead_user" has attributes "first_name:Jacek,last_name:Smietana"
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:John McCain,clicks_count:17,exposures_count:887,price:989.78,purchase_value:3030.03,description:Lorem ipsum public desc"
  And lead Monitors LCD deal exists within category Computers
  And lead Keyboards deal exists within category Computers
  And lead Faxes ultimate deal exists within category Office
  And lead Faxes ultimate deal exists with attributes "purchase_value:3291.99"
  And lead Copy machines ultimate deal exists within category Office
  And lead Copy machines ultimate deal exists with attributes "purchase_value:7080.99,zip_code:123"
  And lead "Printers ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user"
  And lead "Monitors LCD deal" was requested by user "lead_user2@person.com" with role "lead_user"
  And lead "Keyboards deal" was requested by user "lead_user2@person.com" with role "lead_user"
  And lead "Faxes ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user"
  And lead "Copy machines ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user"
  Then I sign in as lead_user2@person.com with password secret
  And I go to lead user lead requests

@tgn @_tested @_done
Scenario: I should see certification level for each lead
  And I should see translated "models.lead.novelty.lvl0"

@m4 @tgn @_tested @added @_done
Scenario: I should see rating %
  Given I have user with email bob@person.com and role supplier
  And a lead Printers ultimate deal exists within category Computers and is bought by user bob@person.com with role supplier
  And a lead "Printers ultimate deal" has good rating
  Given All leads have refreshed average ratings
  And I go to lead user lead requests
  Then I should see "100%"

@tgn @_tested @_done
Scenario: I should see lead header, lead price, purchase value and public description
  Then I should see "Printers ultimate deal"
  And I should see "989.78"
  And I should see "3,030.03"
  And I should see "Lorem ipsum public desc"

@tgn @_tested @_done
Scenario: I should see hottness, novelty, exposure, clicks
  And I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@tgn @_tested @selenium @_done
Scenario: I can toggle select leads
  Then I check "mark_all"

@tgn @_tested @selenium @bulk @_done
Scenario: I can bulk remove leads from my requested leads list
  And I check "mark_all"
  And I follow translated "lead_user.lead_requests.index.view.button_bulk_destroy_lead_request"
  Then I should see translated "flash.bulk_lead_requests.destroy.notice"
  And I should not see "Printers ultimate deal"
  And I should not see "Monitors LCD deal"

@tgn @_tested @_done
Scenario: I can remove a given leads from my requested leads list
  And I follow translated "lead_user.lead_requests.index.view.destroy_lead_request"
  Then I should see translated "flash.lead_users.destroy.notice"

@tgn @_done @non_testable
Scenario: My requested list should be without pagination
  Given pagination per page size in model LeadRequest is set to 1
  And I go to lead user lead requests
  And I should see "Printers ultimate deal"
  And I should see "Faxes ultimate deal"

@tgn @_tested @_done
Scenario: I can narrow down the results by filters and search box
  Given I select "Denmark" from "search_with_country"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Given I fill in "search_with_keyword" with "ultimate"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Then I should see "Printers ultimate deal"
  And I should see "Copy machines ultimate deal"
  And I should not see "Monitors LCD deal"
  Then I select "Office" from "search_with_category"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Then I should see "Copy machines ultimate deal"
  And I should not see "Monitors LCD deal"
  And I fill in "search_with_zip_code" with "123"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Then I should see "Copy machines ultimate deal"
  And I should not see "Faxes ultimate deal"

@added @m8 @ao @_done @_tested
Scenario: I can see latest requests leads at the top of the list
  When there are no leads
  And lead Number 1 ultimate deal exists within category Computers
  And lead "Number 1 ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user"
  And lead Number 2 ultimate deal exists within category Computers
  And lead "Number 2 ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user"
  When I go to lead user lead requests
  Then I should see "Number 2" before "Number 1"
