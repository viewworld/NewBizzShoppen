@m18 @category_buyer_autobuy
Feature: Autobuy for category buyer

Background:
  When Category named "Best Leads" already exists
  When Category named "cb unique 01" already exists
  And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
  And user "jon@lajoie.ca" with role "category_supplier" has attributes "auto_buy_enabled:false"
  And User jon@lajoie.ca with role category_supplier is big buyer
  And I am on category home page for Best Leads
  And I sign in as jon@lajoie.ca with password secret

  @_done @_tested @tgn
  Scenario: I should not see browse leads tab when I have autobuy enabled for all my categories
    Given user "jon@lajoie.ca" with role "category_supplier" has attributes "auto_buy_enabled:true"
    And category "Best Leads" is unique for user with email "jon@lajoie.ca" role "supplier"
    Given category "Best Leads" is unique for some customers users and is auto buy
    And I am on the home page
    Then I should not see translated "layout.main_menu.shared.browse_leads"

  @_done @_tested @tgn
  Scenario: I should see Browse leads tab with all categories which are not autobuy
    And category "cb unique 01" is unique for user with email "jon@lajoie.ca" role "supplier"
    Given category "cb unique 01" is unique for some customers users and is auto buy
    And I am on the home page
    And I follow translated "layout.main_menu.shared.browse_leads"
    Then I should see "Best Leads"
    And I should not see "cb unique 01"
