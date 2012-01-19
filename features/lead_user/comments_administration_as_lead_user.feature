@comments @$_lead_user @noguess @ao  @m9
Feature: Comments administration as lead user/buyer

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And an user with role lead_user and email lead_user.customer1@nbs.com exists as subaccount for customer customer1@nbs.com
  And user "lead_user.customer1@nbs.com" with role "lead_user" has attributes "company_name: John Doe"
  And user "customer1@nbs.com" with role "supplier" has attributes "company_name: Customer1@Nbs"
  And lead Lead#1 is bought by user customer1@nbs.com with role supplier and is assigned to user lead_user.customer1@nbs.com with role lead_user
  And lead Lead#2 is bought by user customer1@nbs.com with role supplier and is assigned to user lead_user.customer1@nbs.com with role lead_user
  And lead Lead#3 is bought by user customer1@nbs.com with role supplier and is assigned to user lead_user.customer1@nbs.com with role lead_user
  And comment for lead "Lead#1" was posted by user "lead_user.customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "lead_user.customer1@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "customer1@nbs.com" with attributes "title: Customers comment for lead3, body: body for customers comment for lead3, created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  Then I sign in as lead_user.customer1@nbs.com with password secret

@_tested @selenium @_done
Scenario: I can create a comment for a lead that is assigned to me
  When I follow translated "layout.main_menu.lead_user.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#1"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  And I fill in "comment_title" with "New thread title" within ".lead_new_thread_container_div"
  And I fill in "comment_body" with "New thread body" within ".lead_new_thread_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "New thread title"
  And I should see "New thread body"

@_tested @selenium @_done
Scenario: I can see comments created for leads
  When I follow translated "layout.main_menu.lead_user.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#3"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  Then I should see "Customers comment for lead3"

@m0
Scenario: I can see if I have already seen the comments for given lead

@_tested @selenium @_done
Scenario: I can see a comment (subject, date and comment author)
  When I follow translated "layout.main_menu.lead_user.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#3"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  Then I should see "Customers comment for lead3"
  And I should see "body for customers comment for lead3"
  And I should see "Customer1@Nbs"
  And I should see "at 01-01-2010 00:00"

@m0
Scenario: I can bulk create comments

@_tested @selenium @_done
Scenario: I can reply to comment
  When I follow translated "layout.main_menu.lead_user.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#3"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  And I follow translated "comments.threads.show.view.reply" within ".lead_threads_container_div"
  And I fill in "comment_title" with "Reply to First Lead1 comment" within ".lead_threads_container_div"
  And I fill in "comment_body" with "Body reply to First Lead1 comment" within ".lead_threads_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "Reply to First Lead1 comment"
  And I should see "Body reply to First Lead1 comment"

@_done @_deprecated
Scenario: I can sort all comments

@_done @_deprecated
Scenario: I can filter all comments

@_done @_deprecated
Scenario: I can see paginated list of comments

@_done @tested_elsewhere
Scenario: I can see tab with comments on my assigned leads page besides show details

@_tested @_done
Scenario: I can't comment leads created by purchase manager
  Given I have user with email purchase_manager7@nbs.com and role member
  And lead Lead#7 is created by user purchase_manager7@nbs.com with role member
  And lead Lead#7 is bought by user customer1@nbs.com with role supplier and is assigned to user lead_user.customer1@nbs.com with role lead_user
  When I follow translated "layout.main_menu.lead_user.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#7"
  And I press translated "lead_user.lead_purchases.index.view.search.search_button"
  Then I should not see translated "lead_purchases.listing.show_comments"
  Then I should not see translated "lead_purchases.listing.create_comments"