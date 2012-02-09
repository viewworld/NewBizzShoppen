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

  @_done @_tested @deprecated
  Scenario: I can make Sales Manager a Deal Maker (can publish deals)
#    Then I follow translated "layout.main_menu.admin.users"
#    Given I have user with email buyer1234567@nbs.com and role supplier
#    Then I fill in "search_with_keyword" with "buyer1234567@nbs.com"
#    Then I press translated "administration.users.index.view.search_button"
#    Then I follow translated "administration.users.index.view.edit"
#    Then I check "user_supplier_deal_maker_role_enabled"

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

  @m21 @requested @_done @_tested @ao
  Scenario: I can see company name on deals list
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:awesome|description:awesome|hidden_description:awesome|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"
    Then I wait 1 second
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    And I follow "Deals"
    Then I should see translated "shared.deals.table.company_name" within "table#deals"

  @m21 @_done @_tested @ao
  Scenario: I can click a link to see public deal description (shows the deal as presented to procurement manager)
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks|group_deal:true|published:1|group_deal:1|price:123|deal_price:100|discounted_price:25|social_media_description:quo vadis"
    Then I should see translated "layout.main_menu.admin.deals"
    And I am on the administration deal edit page for super
    Then I should see "Saving: 75.00 (75%)"

  #9414
  @m27 @requested @selenium @tgn @_done @_tested
  Scenario: Deals awaiting approval should be marked
    Given I am not sign in
    And user "translator_call_centre@nbs.com" has deal maker role enabled
    And I am on the homepage
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "call_centre.deals.new.view.certify"
    Then I certify deal with translation "call_centre.deals.new.view.create_button"
    And I sign out
    And I visit domain http://localhost
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret
    And I follow translated "layout.main_menu.admin.deals"
    Then I should see translated "shared.deals.table.awaiting_approval"

  @m29 @requested @selenium @tgn @_done @_tested
  Scenario: I can click Show all for deals
    Given pagination page size for deals is set to 2
    Given a deal named "deal001" exists within category "Electronics"
    And a deal named "deal002" exists within category "Electronics"
    And a deal named "deal003" exists within category "Electronics"
    And a deal named "deal004" exists within category "Electronics"
    Then I follow translated "layout.main_menu.admin.deals"
    And "search_active_is" should be selected for value "Yes"
    And I should see "2" rows with id like "deal_" in a table
    And I follow translated "common.show_all"
    And I should see "4" rows with id like "deal_" in a table