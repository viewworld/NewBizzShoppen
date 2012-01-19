@comments @$_admin @noguess @ao @m9
Feature: Comments review in lead view by admin

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email admin1@nbs.com and password supersecret and role admin
  And I have user with email customer1@nbs.com and role supplier
  And I have user with email customer2@nbs.com and role supplier

  And a lead Lead#1 exists within category Computers and is bought by user customer2@nbs.com with role supplier
  And a lead Lead#2 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And a lead Lead#3 exists within category Computers and is bought by user customer2@nbs.com with role supplier
  And a lead Lead#4 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And comment for lead "Lead#1" was posted by user "customer2@nbs.com" with attributes "title:First Lead1 comment, created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#2" was posted by user "customer2@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  Then I sign in as admin1@nbs.com with password supersecret

@_tested @_done
Scenario: I can see amount of lead comments for each lead on leads listing
  When I follow translated "layout.main_menu.admin.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "administration.leads.index.view.search_button"
  And I should see "(3)"

@_done @tested_elsewhere
Scenario: I can see lead comments in lead view

@m0
Scenario: I can contact comment creator

@_done @tested_elsewhere
Scenario: I can go to account edit page