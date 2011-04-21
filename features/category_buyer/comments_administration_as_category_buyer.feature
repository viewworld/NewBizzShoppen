@comments @m9
Feature: Comments administration as category buyer

Background:
  When Category named "Computers" already exists
  And I am signed up and confirmed as user with email "catbuyer@nbs.com" and password "secret" and role "category_buyer" for category "Computers"
  And user "catbuyer@nbs.com" with role "category_buyer" has attributes "first_name: Mark, last_name: Driscoll, screen_name: Mark Driscoll"
  And a lead Lead#1 exists within category Computers and is bought by user catbuyer@nbs.com with role category_buyer
  And a lead Lead#2 exists within category Computers and is bought by user catbuyer@nbs.com with role category_buyer
  And a lead Lead#3 exists within category Computers and is bought by user catbuyer@nbs.com with role category_buyer
  And a lead Lead#4 exists within category Computers and is bought by user catbuyer@nbs.com with role category_buyer
  And comment for lead "Lead#1" was posted by user "catbuyer@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "catbuyer@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "catbuyer@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment for lead "Lead#4" was posted by user "catbuyer@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  And I am on the home page
  And I sign in as catbuyer@nbs.com with password secret

@noguess
Scenario: I can create a comment for lead that I have access for

@m0
Scenario: I can bulk create comments

Scenario: I can reply to comment

@_tested
Scenario: I can sort all comments
  Given I follow translated "layout.main_menu.shared.comments"
  When I follow translated "comments.threads.index.view.lead_header"
  And I follow translated "comments.threads.index.view.lead_header"
  Then I should see "Lead#4" before "Lead#3"
  When I follow translated "comments.threads.index.view.started_by"
  Then I should see "Mark Driscoll" before "Mark Driscoll"
  When I follow translated "comments.threads.index.view.date"
  Then I should see "01-01-2010" before "01-01-2011"
  When I follow translated "comments.threads.index.view.last_thread_date"
  Then I should see "01-01-2011" before "02-01-2011"

@_tested
Scenario: I can filter all comments
  Given I follow translated "layout.main_menu.shared.comments"
  When I fill in "search_with_keyword" with "lead#1"
  And I press translated "comments.threads.index.view.search_button"
  Then I should see "Lead#1"
  And I should not see "Lead#2"

@_tested
Scenario: I can see paginated list of comments
  Given pagination per page size in model Comment is set to 2
  And I follow translated "layout.main_menu.shared.comments"
  Then I follow "2"