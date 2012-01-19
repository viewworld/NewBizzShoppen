@$_customer @comments @m9
Feature: Comments administration as customer

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email customer1@nbs.com and password supersecret and role supplier
  And user "customer1@nbs.com" with role "supplier" has attributes "first_name: Mark, last_name: Driscoll, company_name: Mark Driscoll"
  And an user with role lead_user and email lead_user.customer1@nbs.com exists as subaccount for customer customer1@nbs.com
  And an user with role lead_supplier and email lead_buyer.customer1@nbs.com exists as subaccount for customer customer1@nbs.com
  And user "lead_user.customer1@nbs.com" with role "lead_user" has attributes "first_name: John, company_name: John Doe"
  And user "lead_buyer.customer1@nbs.com" with role "lead_supplier" has attributes "first_name: Jane, company_name: Jane Doe"
  And a lead Lead#1 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And a lead Lead#2 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And a lead Lead#3 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And a lead Lead#4 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "lead_user.customer1@nbs.com" with attributes "title: Leadusers comment 1, created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment for lead "Lead#4" was posted by user "lead_buyer.customer1@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  Then I sign in as customer1@nbs.com with password supersecret

@noguess @_tested @selenium @_done
Scenario: I can create a comment for lead that I have access to
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#4"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  And I fill in "comment_title" with "New thread title" within ".lead_new_thread_container_div"
  And I fill in "comment_body" with "New thread body" within ".lead_new_thread_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "New thread title"
  And I should see "New thread body"

@_tested @selenium @_done
Scenario: I can reply to comment
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#4"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  And I follow translated "comments.threads.show.view.reply" within ".lead_threads_container_div"
  And I fill in "comment_title" with "Reply to First Lead1 comment" within ".lead_threads_container_div"
  And I fill in "comment_body" with "Body reply to First Lead1 comment" within ".lead_threads_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "Reply to First Lead1 comment"
  And I should see "Body reply to First Lead1 comment"

@_tested @selenium @_done
Scenario: I can see all comments created by members of my ownership branch
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#3"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  Then I should see "Leadusers comment 1"

#since all comments are visible to everybody involved with particular lead
@_deprecated @_done
Scenario: I cannot see comments created by members of ownership branch that I do not belong to

@m0
Scenario: I can bulk create comments

@_done @_deprecated
Scenario: I can sort all comments

@_done @_deprecated
Scenario: I can filter all comments

@_done @_deprecated
Scenario: I can see paginated list of comments

@_done @tested_elsewhere
Scenario: I can see tab with comments on my leads page besides show details

@_tested @_done
Scenario: I can't comment leads created by purchase manager
  Given I have user with email purchase_manager7@nbs.com and role member
  And lead Lead#7 is created by user purchase_manager7@nbs.com with role member
  And a lead Lead#7 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#7"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  Then I should not see translated "lead_purchases.listing.show_comments"
  And I should not see translated "lead_purchases.listing.create_comments"