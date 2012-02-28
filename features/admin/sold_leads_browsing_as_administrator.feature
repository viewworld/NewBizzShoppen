#:::info::: http://redmine.selleo.com/issues/2674
@lead_catalog @$_admin @m2
Feature: Sold leads browsing as admin

Background:
  Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret

@ao @_done @_tested
Scenario: I can browse sold leads with pagination
  Given pagination page size for leads is set to 3
  And there are "4" sold leads
  And there are "4" existing leads
  When I follow translated "layout.main_menu.admin.leads"
  And I check "search_purchased"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "2" within ".pagination"
  And I should not see "3" within ".pagination"
  And I follow "2" within ".pagination"

@ao @_done @_tested @selenium
Scenario: I can filter the listing (similiar to those in lead catalogue + categories)
  Given pagination page size for leads is set to 10
  And lead NotBoughtLead exists within category Test
  And bought lead BoughtLead exists within category Test
  And lead OtherCategoryLead exists within category Other
  And lead ForKeywordLead exists within category Test
  And lead Price100Lead exists within category Test
  And lead Price100Lead has price 100
  And lead Value500Lead exists within category Test
  And lead Value500Lead has purchase value 500
  And lead BestsellerLead exists within category Test
  And BestsellerLead is a best seller
  When I follow translated "layout.main_menu.admin.leads"
  Then I should see "10" rows with id like "lead_" in a table within "#leads"
  When I check translated "administration.leads.index.view.filter_purchased"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "2" rows with id like "lead_" in a table within "#leads"
  When I uncheck translated "administration.leads.index.view.filter_purchased"
  And I fill in translated "administration.leads.index.search.keyword_label" with "ForKeywordLead"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "1" rows with id like "lead_" in a table within "#leads"
  And I should see "ForKeywordLead"
  When I fill in translated "administration.leads.index.search.keyword_label" with ""
  And I fill in hidden field "search_price_from" with "99"
  And I fill in hidden field "search_price_to" with "101"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "1" rows with id like "lead_" in a table within "#leads"
  And I should see "Price100Lead"
  When I fill in hidden field "search_price_from" with ""
  And I fill in hidden field "search_price_to" with ""
  And I fill in hidden field "search_purchase_value_from" with "500"
  And I fill in hidden field "search_purchase_value_to" with "500"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "1" rows with id like "lead_" in a table within "#leads"
  And I should see "Value500Lead"

@ao @_done @_tested @wip
Scenario: I can sort by columns (those that do match to database columns)
  Given pagination page size for leads is set to 100
  And lead ZZZZZLead exists within category Test
  And lead AAAAALead exists within category Test
  And lead PurchaseValue1000Lead exists with attributes "purchase_value:1000"
  And lead PurchaseValue1999Lead exists with attributes "purchase_value:1999"
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "leads.table.header"
  Then I should see "AAAAALead" before "ZZZZZLead"
  And I follow translated "leads.table.header"
  Then I should see "ZZZZZLead" before "AAAAALead"
  When I follow translated "leads.table.purchase_value"
  Then I should see "PurchaseValue1000Lead" before "PurchaseValue1999Lead"
  When I follow translated "leads.table.purchase_value"
  Then I should see "PurchaseValue1999Lead" before "PurchaseValue1000Lead"

@ao @_done @_tested
Scenario: I can go to lead details by clicking on the edit link
  Given pagination page size for leads is set to 1
  And lead AwesomeLead exists within category TestShowLink
  When I follow translated "layout.main_menu.admin.leads"
  And I select "TestShowLink" from "search_with_category"
  And I press translated "leads.index.search.search_button"
  And I click hidden translated link "administration.leads.index.view.edit"
  Then I should see translated "administration.leads.edit.view.header" with options "lead_header:AwesomeLead"