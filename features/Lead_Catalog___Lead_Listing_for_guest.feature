@lead_catalog @$_guest @m1
Feature: Lead Listing for guest

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I follow translated "layout.main_menu.shared.browse_leads"

Scenario: I should see an image and a description for each category

@tested_elsewhere
Scenario: I can click on a category name and see a list of leads in that category

Scenario: I should not see any leads that belong to a user which is blocked

@_wip
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 3
  And Lead named "Lead 1" exists within "Sample category" category
  And Lead named "Lead 2" exists within "Sample category" category
  And Lead named "Lead 3" exists within "Sample category" category
  And Lead named "Lead 4" exists within "Sample category" category
  And I follow "Sample category"
  Then show me the page
  Then I follow "2"




Scenario: I should see created by, rating % and certification level for each lead

Scenario: I should see lead header, lead price, purchase value and public description

Scenario: I should see hottness, novelty, exposure, clicks
