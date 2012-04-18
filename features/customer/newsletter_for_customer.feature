@newsletter @_requested @$_customer @m31 @tgn
Feature: Newsletter for customer

  Background:
    Given I am on the homepage
    Given user buyer@nbs.com with role supplier exists with attributes "newsletter_manager:1"
    Then I sign in as buyer@nbs.com with password secret

  @_done @_tested_elsewhere
  Scenario: I should not be able to create any lists

  @_done @_tested
  Scenario: When I have  newsletter manager feature enabled then I should see Newsletters tab in main menu
    Then I should see translated "layout.main_menu.lead_supplier.newsletter"

  @_done @_non_testable
  Scenario: When I go to Newsletters tab then I am automatically logged in to Campaign monitor with my client account