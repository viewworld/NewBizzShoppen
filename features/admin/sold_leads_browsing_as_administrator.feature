#:::info::: http://redmine.selleo.com/issues/2674
@lead_catalog @$_admin @m2
Feature: Sold leads browsing as admin

Background:
  Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And pagination page size for leads is set to 3
  And there are "4" sold leads
  And there are "4" existing leads

@ao @done @_tested
Scenario: I can browse sold leads with pagination
  When I follow translated "layout.main_menu.admin.leads"
  And I check "search_purchased"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "2" within ".pagination"
  And I should not see "3" within ".pagination"
  And I follow "2" within ".pagination"

@ao @_todo
Scenario: I can filter the listing (similiar to those in lead catalogue + categories)

@ao @done @_tested
Scenario: I can sort by columns (those that do match to database columns)
  Given pagination page size for leads is set to 100
  And lead ZZZZZLead exists within category Test
  And lead AAAAALead exists within category Test
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "leads.table.header"
  Then I should see AAAAALead before ZZZZZLead
  And I follow translated "leads.table.header"
  Then I should see ZZZZZLead before AAAAALead

@ao @_todo
Scenario: I can go to lead details by clicking on the show link