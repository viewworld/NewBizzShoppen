@lead_catalog @$_guest @m1
Feature: Leads listing for guest

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

@m2 @_tested @tgn
Scenario: I should not see any leads that belong to a user which is blocked
  Given Lead named "Lead 1" exists within "Sample category" category
  And I have user with email customer1@person.com and role customer
  And lead Lead 1 is created by user customer1@person.com with role customer
  And I follow "Sample category"
  Then I should see "Lead 1"
  When User customer1@person.com with role customer is blocked
  And I go to browse leads
  And I follow "Sample category"
  Then I should not see "Lead 1"

@_tested @bk @wip
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 3
  And Lead named "Lead 1" exists within "Sample category" category
  And Lead named "Lead 2" exists within "Sample category" category
  And Lead named "Lead 3" exists within "Sample category" category
  And Lead named "Lead 4" exists within "Sample category" category
  And I follow "Sample category"
  And I open page in browser
  Then I follow "2"

@bk @_wip
Scenario: I should see lead header, lead price, purchase value, created by and public description
  Given a category "cat1" exists with name: "One more sample category"
  And a lead exists with header: "Nice", category: category "cat1", company_name: "Google", phone_number: "0123456789"
  And I follow translated "layout.main_menu.shared.browse_leads"
  And I follow "One more sample category"
  Then I should see "Nice"

@m2 @tgn @_tested
Scenario: I should see certification level for each lead
  Given Lead named "Lead 1" exists within "Sample category" category
  And I follow "Sample category"
  Then I should see translated "models.lead.certification.lvl0"

@m3 @tgn
Scenario: I should see rating % for each lead

@m2 @tgn @_tested  @wip
Scenario: I should see hottness, novelty, exposure, clicks
  Given Lead named "Lead 1" exists within "Sample category" category
  And lead Lead 1 exists with attributes "clicks_count:17,exposures_count:887"
  And I follow "Sample category"
  And I open page in browser
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@m3 @tgn
Scenario: I should be able to click "Add to cart button" that will redirect me to login page

@m0
Scenario: If I sucessfully login after requesting a lead being added to a cart, that lead should be added to cart (or bought if I am big buyer)