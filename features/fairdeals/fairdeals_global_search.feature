@m21 @_requested @fairdeals_search @ao
Feature: Fairdeals global search

  Background:
    Given I visit domain http://fairdeals.dk

  @_done @_tested
  Scenario: I can see search box next to the main menu tabs on each page
    Then I should see CSS path "div#user_menu input#search_with_keyword"
    When I follow translated "layout.fairdeals.main_menu.deals"
    Then I should see CSS path "div#user_menu input#search_with_keyword"

  @_done @_tested
  Scenario: I can search for deals across all categories using search box next to main menu tabs
    When Deal category Primo is created
    And a deal named "DealInPrimo" exists within category "Primo"
    And Deal category Secundo is created
    And a deal named "DealInSecundo" exists within category "Secundo"
    When I fill in "search_with_keyword" with "DealIn"
    And I press translated "layout.fairdeals.main_menu.search"
    Then I should see "DealInPrimo"
    And I should see "DealInSecundo"
    And I should be on deals
