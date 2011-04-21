@$_customer @comments @m9
Feature: Comments administration as customer

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email customer1@nbs.com and password supersecret and role customer
  And user "customer1@nbs.com" with role "customer" has attributes "first_name: Mark, last_name: Driscoll, screen_name: Mark Driscoll"
  And an user with role lead_user and email lead_user.customer1@nbs.com exists as subaccount for customer customer1@nbs.com
  And an user with role lead_buyer and email lead_buyer.customer1@nbs.com exists as subaccount for customer customer1@nbs.com
  And user "lead_user.customer1@nbs.com" with role "lead_user" has attributes "screen_name: John Doe"
  And user "lead_buyer.customer1@nbs.com" with role "lead_buyer" has attributes "screen_name: Jane Doe"
  And a lead Lead#1 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And a lead Lead#2 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And a lead Lead#3 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And a lead Lead#4 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "lead_user.customer1@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment for lead "Lead#4" was posted by user "lead_buyer.customer1@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  Then I sign in as customer1@nbs.com with password supersecret

@noguess
Scenario: I can create a comment for lead that I have access to

Scenario: I can see all comments created by members of my ownership branch

Scenario: I cannot see comments created by members of ownership branch that I do not belong to

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
  Then I should see "Jane Doe" before "John Doe"
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

Scenario: I can see tab with comments on my leads page besides show details

Scenario: I can't comment leads created by purchase manager