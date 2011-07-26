@m16 @requested @admin_deals @_deals @$_administrator
Feature: Deals from admin perspective

  Background:
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret

  @_done @_tested
  Scenario: I can see a tab "Deals" right to "Leads"
    Then I should see translated "layout.main_menu.admin.deals"

  @_done @_tested_elsewhere
  Scenario: I can list deals

  Scenario: I can search deals

  Scenario: I can filter list of deals

  @wip @selenium
  Scenario: I can create a Deal
    Then I follow translated "layout.main_menu.admin.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill in "buyer_email" with "buyer@nbs.com"
    Then I follow translated "administration.deals.new.view.check_buyer_email"
    Then I fill in "deal_header" with "very important deal"
    Then I should see "0 characters (140 max)"
    Then I fill in "deal_description" with "batman"
    Then I should see "6 characters (140 max)"
    Then I fill in "deal_hidden_description" with "cat woman"
    Then I fill in "deal_fine_print" with "gotham city"
    Then I fill in "deal_start_date" with "2011-06-06"
    Then I fill in "deal_end_date" with "2016-12-12"
    Then I fill in "deal_price" with "10"
    Then I select "DKK" from "deal_currency_id"
    Then I press translated "administration.deals.new.view.create_button"
    Then I should see translated "flash.deals.create.notice"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/administration\/deals\/\d+\/edit/"
    Then I should see translated "administration.deals.edit.view.title"
    Then I check "deal_published"
    Then I select "Business" from "deal_category_id"
    Then I fill in "deal_header" with "super amazing deal"
    Then I press translated "administration.deals.edit.view.update_button"
    Then I should see "super amazing deal"
    Then I should see translated "flash.deals.update.notice"
    Then I should not see "very important deal"

  @_done @_tested_elsewhere
  Scenario: I can edit deals

  @_done @_tested_elsewhere
  Scenario: I can publish a deal

  Scenario: I can make Sales Manager a Deal Maker (can publish deals)

  Scenario: I can make an agent or call centre a Deal Maker

  Scenario: I can set an agent to be deal admin in setting menu

# The category that a lead is assigned to, when it is requested. If the deal is created by a sales manager it is set by default (se sales manager)

  @_done @_tested_elsewhere
  Scenario: I can select Lead category

  @_done @_tested_elsewhere
  Scenario: I can specify lead price