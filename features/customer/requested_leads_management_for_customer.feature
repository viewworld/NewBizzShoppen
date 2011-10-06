@lead_manager @$_customer @m6  @noguess @tgn
Feature: Requested leads management for customer

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role supplier
  And user "john@doe.com" has team buyers enabled
  And an user with role lead_supplier and email lead_buyer1@person.com exists as subaccount for customer john@doe.com
  And user "lead_buyer1@person.com" with role "lead_supplier" has attributes "first_name:Daniel,last_name:Revrend"
  And Lead named "Super printers" exists within "Another sample category" category
  And lead Super printers exists with attributes "description:Desc for super printers,price:391.72,purchase_value:193.27,exposures_count:8877,clicks_count:34987,zip_code:55-783"
  And Lead named "Ultra printers" exists within "Sample category" category
  And lead "Super printers" was requested by user "lead_buyer1@person.com" with role "lead_supplier" and is owned by user "john@doe.com"
  And lead "Ultra printers" was requested by user "lead_buyer1@person.com" with role "lead_supplier" and is owned by user "john@doe.com"
  And I sign in as john@doe.com with password secret
  And I go to suppliers lead requests

@_tested
Scenario: I should see rating % and certification level for each lead
  Given I have user with email bob@person.com and role supplier
  And a lead Super printers exists within category Computers and is bought by user bob@person.com with role supplier
  And a lead "Super printers" has good rating
  Given All leads have refreshed average ratings
  And I go to suppliers lead requests
  Then I should see "100%"
  And I should see translated "models.lead.certification.lvl1"

@_deprecated @_done
Scenario: I should see created by

@_tested
Scenario: I should see lead header, lead price, purchase value and public description
  Then I should see "Super printers"
  And I should see "Desc for super printers"
  And I should see "391.72"
  And I should see "193.27"

@_tested
Scenario: I should see hottness, novelty, exposure, clicks
  Then I should see translated "models.lead.novelty.lvl0"
  And I should see translated "models.lead.hotness.lvl1"
  And I should see "34987"
  And I should see "8877"

@_tested
Scenario: I should see requested by
  And I should see "Daniel Revrend"

@_tested @selenium
Scenario: I can toggle select leads
  Then I check "mark_all"

@_tested @selenium
Scenario: I can bulk remove leads from requested leads list
  Then I check "mark_all"
  And I follow translated "customer.lead_requests.index.view.button_bulk_destroy_lead_request"
  Then I should see translated "flash.bulk_lead_requests.destroy.notice"
  And I should not see "Super printers"
  And I should not see "Ultra printers"

@_tested
Scenario: I can remove a given leads from requested leads list
  When I follow translated "customer.lead_requests.index.view.reject_lead_request_link"
  Then I should see translated "customer.lead_requests.index.flash.lead_request_rejected_successfully"

@_tested
Scenario: Requested list should be without pagination
  Given pagination per page size in model LeadRequest is set to 1
  And I go to suppliers lead requests
  Then I should see "Super printers"
  And I should see "Ultra printers"

@_tested
Scenario: I can narrow down the results by filters and search box
  Given I select "Denmark" from "search_with_country"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Given I fill in "search_with_keyword" with "ultra"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Then I should see "Ultra printers"
  And I should not see "Super printers"
  And I go to suppliers lead requests
  Then I select "Sample category" from "search_with_category"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Then I should see "Ultra printers"
  And I should not see "Super printers"
  And I go to suppliers lead requests
  And I fill in "search_with_zip_code" with "55-783"
  And I press translated "lead_user.lead_requests.index.view.search.search_button"
  Then I should see "Super printers"
  And I should not see "Ultra printers"

@_tested @selenium
Scenario: I can bulk add selected leads to my basket
  Then I check "mark_all"
  And I follow translated "customer.lead_requests.index.view.button_bulk_create_lead_request"
  Then I click hidden link by url regex "/\/buyers\/cart$/"
  And I should see "Super printers"
  And I should see "Ultra printers"

@_tested
Scenario: I can add a given lead to my basket
  When I follow translated "customer.lead_requests.index.view.accept_lead_request_link"
  Then I should see translated "customer.lead_requests.index.flash.lead_request_accepted_successfully"