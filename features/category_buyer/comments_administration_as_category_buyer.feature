@comments @m9
Feature: Comments administration as category buyer

Background:
  When Category named "Computers" already exists
  And I am signed up and confirmed as user with email "catbuyer@nbs.com" and password "secret" and role "category_supplier" for category "Computers"
  And user "catbuyer@nbs.com" with role "category_supplier" has attributes "first_name: Mark, last_name: Driscoll, company_name: Mark Driscoll"
  And a lead Lead#1 exists within category Computers and is bought by user catbuyer@nbs.com with role category_supplier
  And a lead Lead#2 exists within category Computers and is bought by user catbuyer@nbs.com with role category_supplier
  And a lead Lead#3 exists within category Computers and is bought by user catbuyer@nbs.com with role category_supplier
  And a lead Lead#4 exists within category Computers and is bought by user catbuyer@nbs.com with role category_supplier
  And comment for lead "Lead#1" was posted by user "catbuyer@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "catbuyer@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "catbuyer@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment for lead "Lead#4" was posted by user "catbuyer@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  And I am on the home page
  And I sign in as catbuyer@nbs.com with password secret

@noguess @_tested @selenium @_done
Scenario: I can create a comment for lead that I have access for
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "Lead#4"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  And I follow translated "lead_purchases.listing.show_comments"
  And I fill in "comment_title" with "New thread title" within ".lead_new_thread_container_div"
  And I fill in "comment_body" with "New thread body" within ".lead_new_thread_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "New thread title"
  And I should see "New thread body"

@m0
Scenario: I can bulk create comments

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

@_done @_deprecated
Scenario: I can sort all comments

@_done @_deprecated
Scenario: I can filter all comments

@_done @_deprecated
Scenario: I can see paginated list of comments
