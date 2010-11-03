@lead_catalog @$_guest @m1
Feature: Lead Listing for guest

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I follow translated "layout.main_menu.shared.browse_leads"

@_tested @bk
Scenario: I should see an image and a description for each category
  Then I should see "Sample category"

@tested_elsewhere
Scenario: I can click on a category name and see a list of leads in that category

@m2
Scenario: I should not see any leads that belong to a user which is blocked

@_tested @bk
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 3
  And Lead named "Lead 1" exists within "Sample category" category
  And Lead named "Lead 2" exists within "Sample category" category
  And Lead named "Lead 3" exists within "Sample category" category
  And Lead named "Lead 4" exists within "Sample category" category
  And I follow "Sample category"
  Then I follow "2"

@bk @_wip
Scenario: I should see lead header, lead price, purchase value, created by and public description
  Given a category "cat1" exists with name: "One more sample category"
  And a lead exists with header: "Nice", category: category "cat1", company_name: "Google", phone_number: "0123456789"
  And I follow translated "layout.main_menu.shared.browse_leads"
  And I follow "One more sample category"
  Then I should see "Nice"

@m2
Scenario: I should see rating % and certification level for each lead

@m2
Scenario: I should see hottness, novelty, exposure, clicks
