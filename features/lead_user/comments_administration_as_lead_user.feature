@comments @$_lead_user @noguess @ao  @m9
Feature: Comments administration as lead user/buyer

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email lead_user.customer1@nbs.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user.customer1@nbs.com exists as subaccount for customer customer1@nbs.com
  And user "lead_user.customer1@nbs.com" with role "lead_user" has attributes "screen_name: John Doe"
  And lead Lead#1 is bought by user customer1@nbs.com with role customer and is assigned to user lead_user.customer1@nbs.com with role lead_user
  And lead Lead#2 is bought by user customer1@nbs.com with role customer and is assigned to user lead_user.customer1@nbs.com with role lead_user
  And lead Lead#3 is bought by user customer1@nbs.com with role customer and is assigned to user lead_user.customer1@nbs.com with role lead_user
  And comment for lead "Lead#1" was posted by user "lead_user.customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "lead_user.customer1@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "lead_user.customer1@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  Then I sign in as lead_user.customer1@nbs.com with password supersecret

Scenario: I can create a comment for a lead that is assigned to me

Scenario: I can see comments created for leads

@m0
Scenario: I can see if I have already seen the comments for given lead

Scenario: I can see a comment (subject, date and comment author)

@m0
Scenario: I can bulk create comments

Scenario: I can reply to comment

@_tested
Scenario: I can sort all comments
  Given I follow translated "layout.main_menu.shared.comments"
  When I follow translated "comments.threads.index.view.lead_header"
  And I follow translated "comments.threads.index.view.lead_header"
  Then I should see "Lead#3" before "Lead#2"
  When I follow translated "comments.threads.index.view.started_by"
  Then I should see "John Doe" before "John Doe"
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

Scenario: I can see tab with comments on my assigned leads page besides show details

Scenario: I can't comment leads created by purchase manager