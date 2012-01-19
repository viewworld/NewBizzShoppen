@m2 @$_lead_user @lead_user  @noguess
Feature: Reassigning lead purchases

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
    And an user with role lead_user and email lead_user44@person.com exists as subaccount for customer customer@person.com
    And user lead_user2@person.com with role lead_user exists with attributes "company_name:John McCoy,first_name:John,last_name:McCoy"
    And user lead_user44@person.com with role lead_user exists with attributes "company_name:Martin Gleesse,first_name:Martin,last_name:Gleesse"
    And lead Printers ultimate deal exists within category Computers
    And lead Monitors LCD deal exists within category Computers
    And lead Keyboards deal exists within category Office
    And lead Printers ultimate deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
    And lead Monitors LCD deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
    And lead Keyboards deal is bought by user customer@person.com with role supplier and is assigned to user lead_user2@person.com with role lead_user
    Then I sign in as lead_user2@person.com with password secret

  @tgn @_done @_tested @selenium
  Scenario: I can transfer lead access to other lead handler that belong to the same customer (!!)
    When I follow translated "layout.main_menu.lead_user.lead_purchases"
    And I fill in "search_with_keyword" with "Printers ultimate deal"
    And I press translated "lead_user.lead_purchases.index.view.search.search_button"
    Then I select "Martin Gleesse" from "assignee_id"
    And I go to lead user lead purchases
    Then I should not see "Printers ultimate deal"