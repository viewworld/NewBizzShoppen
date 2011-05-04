@comments @$_admin @noguess @ao @m9
Feature: Global comments administration

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email admin1@nbs.com and password supersecret and role admin
  And I have user with email customer1@nbs.com and role customer
  And user "customer1@nbs.com" with role "customer" has attributes "screen_name: Mark Driscoll"
  And I have user with email customer2@nbs.com and role customer
  And user "customer2@nbs.com" with role "customer" has attributes "screen_name: Adam Savage"

  And a lead Lead#1 exists within category Computers and is bought by user customer2@nbs.com with role customer
  And a lead Lead#2 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And a lead Lead#3 exists within category Computers and is bought by user customer2@nbs.com with role customer
  And a lead Lead#4 exists within category Computers and is bought by user customer1@nbs.com with role customer
  And a lead Lead#5 exists within category Jobs and is bought by user customer1@nbs.com with role customer
  And comment for lead "Lead#1" was posted by user "customer2@nbs.com" with attributes "title:First Lead1 comment, created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "customer2@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment for lead "Lead#4" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  And comment for lead "Lead#5" was posted by user "customer1@nbs.com" with attributes "last_thread_created_at:2011-02-04"
  Then I sign in as admin1@nbs.com with password supersecret

@_tested
Scenario: I can browse all comment conversations with pagination
  Given pagination per page size in model Comment is set to 2
  And I follow translated "layout.main_menu.shared.comments"
  Then I follow "2"

@_tested
Scenario: I can sort comments
  Given I follow translated "layout.main_menu.shared.comments"
  When I follow translated "comments.threads.index.view.lead_header"
  And I follow translated "comments.threads.index.view.lead_header"
  Then I should see "Lead#4" before "Lead#3"
  When I follow translated "comments.threads.index.view.started_by"
  Then I should see "Adam Savage" before "Mark Driscoll"
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
  Then I fill in "search_with_keyword" with ""
  And I select "Job" from "search_with_category"
  And I press translated "comments.threads.index.view.search_button"
  And I should see "Lead#5"
  And I should not see "Lead#1"
  And I should not see "Lead#2"

@m0
Scenario: I can contact comment creator

@_tested
Scenario: I can go to account edit page
  Given I follow translated "layout.main_menu.shared.comments"
  And I follow "Lead#1"
  And I follow "Adam Savage"
  And I should see "Editing user: Adam Savage"

@_tested @selenium
Scenario: I can edit the comment
  When I follow translated "layout.main_menu.admin.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "administration.leads.index.view.search_button"
  And I follow translated "comments.shared.show_comments"
  Then I follow translated "comments.threads.show.view.edit" within ".row_tooltip_content"
  And I fill in "comment_title" with "Corrected title" within ".lead_threads_container_div"
  And I fill in "comment_body" with "Corrected body" within ".lead_threads_container_div"
  And I press translated "comments.threads.edit.view.update_comment_button"
  And I should see "Corrected title"
  And I should see "Corrected body"

@_tested @selenium
Scenario: I can delete the comment
  When I follow translated "layout.main_menu.admin.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "administration.leads.index.view.search_button"
  And I follow translated "comments.shared.show_comments"
  And I confirm a js popup on the next step
  And I follow translated "comments.threads.show.view.destroy" within ".row_tooltip_content"
  Then I should not see "First Lead1 comment"

@_tested @selenium
Scenario: I can start new comment thread
  When I follow translated "layout.main_menu.admin.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "administration.leads.index.view.search_button"
  And I follow translated "comments.shared.show_comments"
  And I fill in "comment_title" with "New thread title" within ".lead_new_thread_container_div"
  And I fill in "comment_body" with "New thread body" within ".lead_new_thread_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "New thread title"
  And I should see "New thread body"

@_tested @selenium @added
Scenario: I can reply to existing comment thread
  When I follow translated "layout.main_menu.admin.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "administration.leads.index.view.search_button"
  And I follow translated "comments.shared.show_comments"
  And I follow translated "comments.threads.show.view.reply" within ".row_tooltip_content"
  And I fill in "comment_title" with "Reply to First Lead1 comment" within ".lead_threads_container_div"
  And I fill in "comment_body" with "Body reply to First Lead1 comment" within ".lead_threads_container_div"
  And I press translated "comments.threads.show.view.create_comment_button"
  Then I should see "Reply to First Lead1 comment"
  And I should see "Body reply to First Lead1 comment"

@added @m10
Scenario: I can block comments

@added @m10
Scenario: I can block particular agent from further dialog with given buyer
