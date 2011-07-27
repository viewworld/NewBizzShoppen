@m16 @requested @sales_manager_deals @_deals @$_sales_manager
Feature: Deals from Sales Manager perspective
  Background:
    Given I am on the homepage
    Then user "buyer@nbs.com" has deal maker role enabled
    And I sign in as buyer@nbs.com with password secret

  @_done @_tested
  Scenario: I can see new tab "My deals" right to the "My leads"
    Then I should see translated "layout.main_menu.lead_buyer.my_deals"

  @_done @_tested
  Scenario: I can see a list of my created deals sorted by creation date when I click "My deals"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I wait 1 second
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business" with attributes "header:awesome|description:awesome|hidden_description:awesome|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"
    Then a deal is created by "translator_customer@nbs.com" for user "translator_customer@nbs.com" and category "Business" with attributes "header:hidden|description:hidden|hidden_description:hidden|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"
    Then I follow translated "layout.main_menu.lead_buyer.my_deals"
    Then I should not see "hidden"
    Then I should see "super" before "awesome"
    Then I filter and sort deals with my deals translation "layout.main_menu.lead_buyer.my_deals"

  @_done @_tested_elsewhere
  Scenario: I can filter the list by "active" and "inactive" deals

  @_done @_tested
  Scenario: I can see creation date, deal name, expire time, likes, publish/awaiting approval on deal list
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I follow translated "layout.main_menu.lead_buyer.my_deals"
    Then I should see translated "shared.deals.table.creation_date"
    Then I should see translated "shared.deals.table.name"
    Then I should see translated "shared.deals.table.expires"
    Then I should see translated "shared.deals.table.likes"
    Then I should see translated "shared.deals.table.published"
    Then I should see "super" within "#deals"
    Then I should see "2016-12-12" within "#deals"
    Then I should see "false" within "#deals"

  # when I am Deal Maker
  @_done @_tested_elsewhere
  Scenario: I can publish deals

  # CREATING DEALS
  # --------------
  # There is an orange arrow on the top right “create new deal”
  @selenium @_done @_tested
  Scenario: I can create a new deal
    Then I follow translated "layout.main_menu.lead_buyer.my_deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    Then I press translated "buyer.deals.new.view.create_button"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/buyers\/deals\/\d+\/edit/"
    Then I fill deal edit form and submit with translated button "buyer.deals.edit.view.update_button"

  # "Deal description"
  @_done @_tested_elsewhere
  Scenario: I can select a deal category

  @_done @_tested_elsewhere
  Scenario: I can see creation date (generated automatically)

  @_done @_tested_elsewhere
  Scenario: I can enter deal name

  @_done @_tested_elsewhere
  Scenario: I can enter short description (140 chars) and see how many is left when I enter text

  @_done @_tested_elsewhere
  Scenario: I can enter detailed description

  @_done @_tested_elsewhere
  Scenario: I can enter fine print (note field)

  @wip
  Scenario: I can edit Company logo
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I follow translated "layout.main_menu.lead_buyer.my_deals"
    Then I follow translated "buyer.deals.index.view.edit"
    Then attach the file "sample image" to "asset_deal_logo_asset" within "#deal_logo_form"
    Then I press translated "deals.common.assets.view.add_logo_button" within "#deal_logo_form"
    Then I should

  Scenario: I can upload material to download

  Scenario: I can attach multiple pictures

  @_done @_not_testable
  Scenario: I can see thumbnails when I attach pictures

  @_done @_tested_elsewhere
  Scenario: I can specify start and end dates

  @_done @_deprecated
  Scenario: I can select currency

  Scenario: I can click a link to see public deal description (shows the deal as presented to procurement manager)

  # "Contact"
  Scenario: Contact data should be populated from sales manager

  @_done @_tested_elsewhere
  Scenario: I can edit company name / contact person / email / direct number / mobile number

  @_done @_tested_elsewhere
  Scenario: I can edit address

  @_done @_tested_elsewhere
  Scenario: I can edit URL

  @_done @_tested_elsewhere
  Scenario: I can edit Company description (note field)

  # "Additional information"

  Scenario: I can create a new template for this Deal

  Scenario: I can use existing templates for this category

  Scenario: Mandatory templates for category should be automatically included

  # Backend
  Scenario: When a deal is created a new lead category should be created named the same as sales manager's company name

  Scenario: The category is company unique to the sales manager