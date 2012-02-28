@m17 @global_deal_changes @is
Feature: Deals global changes

  Background:
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:awesome|description:awesome|hidden_description:awesome|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"

  Scenario: As PM I should be able to share the short deal info on the social networks (facebook, twitter, linkedin)

  @_done @_tested @selenium
  Scenario: I should be able to set normal price and discounted
    Then I follow translated "layout.main_menu.admin.deals"
    And I select "" from "search_active_is"
    And I press translated "leads.index.search.search_button"
    Then I click hidden link by url regex "/administration\/deals\/\d+\/edit/"
    Then I fill group deal edit form and submit with translated button "administration.deals.edit.view.update_button"
    Then I click hidden link by url regex "/administration\/deals\/\d+\/edit/"

  @_done @_tested_elsewhere
  Scenario: I should be able to set social media short deal info

  @_done @_tested @tgn
  Scenario: I should see the saving % (calculated) in browse deals for deals with discounted price
    Given a deal named "Zzzzzzz group deal #1" exists within category "Electronics deals"
    And a deal named "Zzzzzzz group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:100,discounted_price:25,social_media_description:quo vadis"
    And I am on the homepage
    And I make sure current locale is "en"
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Electronics deals"
    Then I should see "100.00"
    Then I should see "25.00"
    Then I should see "75%"

  @_done @non_testable @tgn
  Scenario: I should be able to see the slug for the view deal's details url

  @_done @_tested @tgn
  Scenario: I should be able to see the total leads generated by deal
    Given a deal named "Zzzzzzz group deal #1" exists within category "Electronics deals"
    And a deal named "Zzzzzzz group deal #1" exists with attributes "published:1,group_deal:0,price:100,discounted_price:25,social_media_description:quo vadis, created_leads:27"
    And I am on the homepage
    And I make sure current locale is "en"
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Electronics deals"
    Then I should see "27"

  @_done @_tested
  Scenario: As admin I can change the number of generated leads from a deal
    Then I follow translated "layout.main_menu.admin.deals"
    And I select "" from "search_active_is"
    And I press translated "leads.index.search.search_button"
    Then I follow translated "administration.deals.index.view.edit"
    Then I fill in "deal_created_leads" with "-1"
    Then I press translated "administration.deals.edit.view.update_button"
    Then I fill in "deal_created_leads" with "12.3"
    Then I press translated "administration.deals.edit.view.update_button"
    Then I fill in "deal_created_leads" with "error"
    Then I press translated "administration.deals.edit.view.update_button"
    Then I fill in "deal_created_leads" with "0"
    Then I press translated "administration.deals.edit.view.update_button"
    Then I should see translated "flash.deals.update.notice"
