@lead_catalog @m1
Feature: Lead Catalog - Categories Listing

Background: Set English locale
  Given I am on the homepage
  And I make sure current locale is English


@bk @_wip
Scenario: I can see all active categories
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  When I follow translated "layout.main_menu.shared.browse_leads"
  Then I should see category named "Another sample category" within category named "Sample category"

@bk @_wip
Scenario: I can click on a category and go to appropriate lead listing