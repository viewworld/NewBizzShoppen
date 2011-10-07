@m16 @requested @admin_deals @_deals @$_administrator
Feature: Deals from admin perspective

  Background:
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret

  @_done @_tested
  Scenario: I can see a tab "Deals" right to "Leads"
    Then I should see translated "layout.main_menu.admin.deals"

  @_done @_tested
  Scenario: I can list deals
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:awesome|description:awesome|hidden_description:awesome|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"
    Then I wait 1 second
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I filter and sort deals with my deals translation "layout.main_menu.admin.deals"

  @_done @_tested_elsewhere
  Scenario: I can search deals

  @_done @_tested_elsewhere
  Scenario: I can filter list of deals

  @_done @_tested @selenium
  Scenario: I can create a Deal
    Then I follow translated "layout.main_menu.admin.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill in "supplier_email" with "buyer@nbs.com"
    Then I follow translated "administration.deals.new.view.check_supplier_email"
    And I wait 1 second
    And I follow translated "call_centre_agent.deals.new.view.confirm"
    Then I fill deal creation form
    Then I select "DKK" from "deal_currency_id"
    Then I fill in "deal_price" with "10"
    Then I select "Business" from "deal_lead_category_id"
    Then I press translated "administration.deals.new.view.create_button"
    Then I should see translated "flash.deals.create.notice"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/administration\/deals\/\d+\/edit/"
    Then I should see translated "administration.deals.edit.view.title"
    Then I fill deal edit form and submit with translated button "administration.deals.edit.view.update_button"

  @_done @_tested_elsewhere
  Scenario: I can edit deals

  @_done @_tested_elsewhere
  Scenario: I can publish a deal

  @_done @_tested
  Scenario: I can make Sales Manager a Deal Maker (can publish deals)
    Then I follow translated "layout.main_menu.admin.users"
    Then I fill in "search_with_keyword" with "buyer@nbs.com"
    Then I press translated "administration.users.index.view.search_button"
    Then I follow translated "administration.users.index.view.edit"
    Then I check "user_category_supplier_deal_maker_role_enabled"

  @_done @_tested
  Scenario: I can make an agent or call centre a Deal Maker
    # agent
    Then I follow translated "layout.main_menu.admin.users"
    Then I fill in "search_with_keyword" with "translator_agent@nbs.com"
    Then I press translated "administration.users.index.view.search_button"
    Then I follow translated "administration.users.index.view.edit"
    Then I check "user_agent_deal_maker_role_enabled"
    # call centre
    Then I follow translated "layout.main_menu.admin.users"
    Then I fill in "search_with_keyword" with "translator_call_centre@nbs.com"
    Then I press translated "administration.users.index.view.search_button"
    Then I follow translated "administration.users.index.view.edit"
    Then I check "user_call_centre_deal_maker_role_enabled"
    # call centre agent
    Then I follow translated "layout.main_menu.admin.users"
    Then I fill in "search_with_keyword" with "translator_call_centre_agent@nbs.com"
    Then I press translated "administration.users.index.view.search_button"
    Then I follow translated "administration.users.index.view.edit"
    Then I check "user_call_centre_agent_deal_maker_role_enabled"

  @_done @_tested @selenium
  Scenario: I can set an agent to be deal admin in setting menu
    Then I click hidden link by url regex "/administration\/setting\/edit/"
    Then I should see translated "administration.settings.common.view.vars.default_deal_admin_email"

# The category that a lead is assigned to, when it is requested. If the deal is created by a sales manager it is set by default (se sales manager)

  @_done @_tested_elsewhere
  Scenario: I can select Lead category

  @_done @_tested_elsewhere
  Scenario: I can specify lead price