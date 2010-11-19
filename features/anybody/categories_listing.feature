@lead_catalog @m1
Feature: Categories Listing

Background: Set English locale
  Given I am on the homepage
  And I make sure current locale is English

@_tested @bk
Scenario: I can see all active categories
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  When I follow translated "layout.main_menu.shared.browse_leads"
  Then I should see category named "Another sample category" within category named "Sample category"

@_tested @bk
Scenario: I can click on a category and go to appropriate lead listing
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category
  And I follow translated "layout.main_menu.shared.browse_leads"
  And I follow "Another sample category"
  Then I should see "Super printers"
  And I should see "Ultra printers"