@lead_catalog @m1
Feature: Categories Listing

Background: Set English locale
  Given I am on the homepage
  And I make sure current locale is "en"

@_tested @bk @_done
Scenario: I can see all active categories
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I am on the homepage
  And I sign in as translator_customer@nbs.com with password secret
  When I follow translated "layout.main_menu.shared.browse_leads"
  Then I should see category named "Another sample category" within category named "Sample category"

@_tested @bk @_done
Scenario: I can click on a category and go to appropriate lead listing
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category
  And I am on the homepage
  And I sign in as translator_customer@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"
  And I follow "Another sample category"
  Then I should see "Super printers"
  And I should see "Ultra printers"

@tgn @m11 @added @_done @_tested
Scenario: I can see customised total number of leads on the browse categories page
  Given there are no categories
  And Category Computers is created
  And I have user with email agent1@nbs.com and role agent
  Given lead "lead1" is created in category "Computers" by user "agent1@nbs.com" with role "agent"
  And lead "lead2" is created in category "Computers" by user "agent1@nbs.com" with role "agent"
  And lead "lead3" is created in category "Computers" by user "agent1@nbs.com" with role "agent"
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role supplier
  And User john@doe.com with role supplier is big buyer
  And I am on the homepage
  And I sign in as john@doe.com with password secret
  Then I follow translated "layout.main_menu.shared.browse_leads"
  And I should see "(3)"
  And I follow category "Computers"
  When I follow translated "leads.index.buy_lead"
  Then I follow translated "layout.main_menu.shared.browse_leads"
  And I should see "(2)"

@m19 @requested @non_testable @_done
Scenario: Categories should be in a form of a list

#7839
@m20 @requested @ao @non_testable @_done
Scenario: I should be able to click on the category row to browse leads

#10251
@m29 @requested @tgn @_done @_tested
Scenario: Deal and lead categories should be listed alphabetically by default
  And I am on the homepage
  And I sign in as buyer@nbs.com with password secret
  Then I follow translated "layout.main_menu.shared.browse_leads"
  And I should see "Business" before "Electronics"