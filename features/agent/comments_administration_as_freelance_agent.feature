@comments @$_freelance_agent @noguess @ao @m9
Feature: Comments administration as freelance agent

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email agent1@nbs.com and password supersecret and role agent
  And lead Lead#1 is created by user agent1@nbs.com with role agent
  And lead Lead#2 is created by user agent1@nbs.com with role agent
  And lead Lead#3 is created by user agent1@nbs.com with role agent
  And a lead Lead#1 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And a lead Lead#2 exists within category Computers and is bought by user customer2@nbs.com with role customer
  And a lead Lead#3 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "customer2@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "customer1@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And user "customer1@nbs.com" with role "customer" has attributes "screen_name: Mark Driscoll"
  And user "customer2@nbs.com" with role "customer" has attributes "screen_name: John Doe"
  And I sign in as agent1@nbs.com with password supersecret

Scenario: I can see the amount of comments per lead on listing of my leads

@m0
Scenario: I can click on comment list and get a popup with comments from different ppl

@m0
Scenario: I can click on details of a specific comment

Scenario: I can see the comment conversation details

Scenario: I can respond to a comment and my comment is added to the conversation

@_tested
Scenario: I can browse all comments with pagination
  Given pagination per page size in model Comment is set to 2
  And I follow translated "layout.main_menu.shared.comments"
  Then I follow "2"

@_tested
Scenario: I can sort comments
  Given I follow translated "layout.main_menu.shared.comments"
  When I follow translated "comments.threads.index.view.lead_header"
  And I follow translated "comments.threads.index.view.lead_header"
  Then I should see "Lead#3" before "Lead#2"
  When I follow translated "comments.threads.index.view.started_by"
  Then I should see "John Doe" before "Mark Driscoll"
  When I follow translated "comments.threads.index.view.date"
  Then I should see "01-01-2010" before "01-01-2011"
  When I follow translated "comments.threads.index.view.last_thread_date"
  Then I should see "01-01-2011" before "02-01-2011"

@_tested
Scenario: I can filter comments
  Given I follow translated "layout.main_menu.shared.comments"
  When I fill in "search_with_keyword" with "lead#1"
  And I press translated "comments.threads.index.view.search_button"
  Then I should see "Lead#1"
  And I should not see "Lead#2"