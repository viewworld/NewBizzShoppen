@m16 @procurement_manager_deals @requested @_deals @$_procurement_manager
Feature: Deals from procurement manager perspective

  Background:
    Given I am signed up and confirmed as user with email procurment@nbs.com and password secret and role purchase_manager
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as procurment@nbs.com with password secret

  @_tested @_done @tgn
  Scenario: I should see "My deals" tab instead of "My leads"
    Then I should see translated "layout.main_menu.purchase_manager.my_requests"
    And I should not see "My leads"

  @_tested @_done @tgn
  Scenario: I can "Browse deals" instead of "Browse leads"
    Then I should see translated "layout.main_menu.shared.browse_deals"
    And I should not see "Browse leads"

  @_tested @_done @tgn
  Scenario: I can see list of deals categories and subcategories
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I should see "Electronics deals"

  @_tested @_done @tgn
  Scenario: I can browse deals in seelcted category
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics deals"
    Then I should see "Some deal #1"

  @_done @tested_elsewhere @tgn
  Scenario: I can see "My requests" instead of "My leads"

  @_done @_tested @tgn
  Scenario: I can't create new lead
    When I follow translated "layout.main_menu.purchase_manager.my_requests"
    And I should not see "New lead"

  @_done @_tested @tgn
  Scenario: I should see "Latest Deals" instead of "Best Sellers"
    When I follow translated "layout.main_menu.shared.home"
    Then I should see translated "purchase_manager_home.show.view.header_latest_deals"
    And I should not see "Best sellers"

  @_done @_tested @tgn
  Scenario: I can see contact information for deals when I am logged in
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Given a deal named "Some deal #1" exists with attributes "contact_name:SE Cupps"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics"
    Then I should see translated "deals.listing.contact_label"
    And I should see translated "deals.listing.contact_name_label"
    And I should see "SE Cupps"

  @_done @_tested @tgn
  Scenario: I can click "Contact me"
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics"
    Then I should see translated "deals.index.view.contact_me"

  #tested under sales manager deals
  @_done @tgn @tested_elsewhere
  Scenario: When I click "Contact me" I can enter "Additional" template information and note field

