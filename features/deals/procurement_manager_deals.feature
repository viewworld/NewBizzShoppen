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

  @m18 @selenium @_done @_tested @tgn
  Scenario: I should see "View all" by the pagination links under Browse deals
    Given pagination page size for leads is set to 2
    And a deal named "Some deal #1" exists within category "Electronics deals"
    And a deal named "Some deal #2" exists within category "Electronics deals"
    And a deal named "Some deal #3" exists within category "Electronics deals"
    And a deal named "Some deal #4" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics deals"
    And I follow translated "common.show_all"
    And I should see "Some deal #1"
    And I should see "Some deal #2"
    And I should see "Some deal #3"
    And I should see "Some deal #4"
    And I follow translated "common.show_paginated"

  # only child (1 level)
  @m18 @selenium @_done @_tested @tgn
  Scenario: I can see the dropdown menu of subcategories on the particular category leads listing
    Given Deal category Sound files is created
    And Deal category named "Podcasts" already exists within category named "Sound files"
    And Deal category named "Music" already exists within category named "Sound files"
    And Deal category named "Scientific" already exists within category named "Podcasts"
    And Deal category named "Comedy" already exists within category named "Podcasts"
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then a deal named "Various music" exists within category "Music"
    Then a deal named "Various podcasts" exists within category "Podcasts"
    Then a deal named "Skeptical Guide To Universe" exists within category "Scientific"
    Then a deal named "Funny pod" exists within category "Comedy"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Sound files"
    And "category_selector" dropdown should have values "Podcasts,Music"
    And I select "Podcasts" from "category_selector"
    And "category_selector" dropdown should have values "Scientific,Comedy"
    And I should see "Various podcasts"
    And I select "Scientific" from "category_selector"
    And I should see "Skeptical Guide To Universe"

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

  @_done @_tested @tgn @_deprecated
  Scenario: I can see contact information for deals when I am logged in
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    #Given a deal named "Some deal #1" exists with attributes "contact_name:SE Cupps"
    Given a deal named "Some deal #1" exists with attributes "company_name:SE Cupps"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics"
    #Then I should see translated "deals.listing.contact_label"
    #And I should see translated "deals.listing.contact_name_label"
    And I should see "SE Cupps"

  @_done @_tested @tgn
  Scenario: I can click "Contact me"
    Given a deal named "Some deal #1" exists within category "Electronics deals"
    Then I follow translated "layout.main_menu.shared.browse_deals"
    And I follow "Electronics"
    Then I should see translated "deals.index.view.view_deal"

  #tested under sales manager deals
  @_done @tgn @tested_elsewhere
  Scenario: When I click "Contact me" I can enter "Additional" template information and note field

  @_done @_tested @tgn @added @m18
  Scenario: When I sign up on fairdeals.dk/eu and confirmation is turned off I should still get email and be signed in afterword
  Given setting for "email_verification_for_procurement_managers" is set to "0"
  Given I visit domain http://fairdeals.dk
  And I follow translated "fairdeals_home.show.view.get_free_account"
  And I fill in "user_purchase_manager_first_name" with "Ana"
  And I fill in "user_purchase_manager_last_name" with "Kasparian"
  And I fill in "user_purchase_manager_address_attributes_address_line_1" with "2222"
  And I fill in "user_purchase_manager_address_attributes_zip_code" with "2222"
  And I fill in "user_purchase_manager_screen_name" with "Ana Kasparian"
  And I fill in "user_purchase_manager_password" with "secret"
  And I fill in "user_purchase_manager_password_confirmation" with "secret"
  And I fill in "user_purchase_manager_email" with "anakasparian@tyt.com"
  And I check "user_purchase_manager_agreement_read"
  And I press translated "purchase_manager_accounts.new.view.button_create_account"
  And I should be signed in
  And last email sent should have been sent to recipient "anakasparian@tyt.com"
