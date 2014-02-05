# @comments @$_call_centre @noguess @ao @m9 @faircalls @_deprecated2014
# Feature: Comments administration as call centre agent

#   Background:
#     Given I am on the homepage
#     And I visit domain http://faircalls.eu
#     And I make sure current locale is "en"
#     And I am signed up and confirmed as user with email cca1.call_centre1@nbs.com and password supersecret and role call_centre_agent
#     And an user with role call_centre_agent and email cca1.call_centre1@nbs.com belongs to call centre call_centre1@nbs.com
#     And lead Lead#1 is created by user cca1.call_centre1@nbs.com with role call_centre_agent
#     And lead Lead#2 is created by user cca1.call_centre1@nbs.com with role call_centre_agent
#     And lead Lead#3 is created by user cca1.call_centre1@nbs.com with role call_centre_agent
#     And a lead Lead#1 exists within category Computers and is bought by user customer1@nbs.com with role supplier
#     And a lead Lead#2 exists within category Computers and is bought by user customer2@nbs.com with role supplier
#     And a lead Lead#3 exists within category Computers and is bought by user customer1@nbs.com with role supplier
#     And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
#     And comment for lead "Lead#2" was posted by user "customer2@nbs.com" with attributes "last_thread_created_at:2011-01-02"
#     And comment for lead "Lead#3" was posted by user "customer1@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
#     And comment thread for lead "Lead#3" was posted by users "customer1@nbs.com, call_centre1@nbs.com, customer1@nbs.com"
#     And user "customer1@nbs.com" with role "supplier" has attributes "first_name: Mark, company_name: Mark Driscoll"
#     And user "customer2@nbs.com" with role "supplier" has attributes "first_name: John, company_name: John Doe"
#     And I sign in as cca1.call_centre1@nbs.com with password supersecret

#   @_tested @_done
#   Scenario: I can see the amount of comments per lead on listing of Leads created by me
#     When I follow translated "layout.main_menu.call_centre_agent.leads"
#     And I fill in "search_with_keyword" with "lead#1"
#     And I press translated "call_centre_agent.leads.index.view.search_button"
#     And I should see "(1)"

#   @m0
#   Scenario: I can click on comment list and get a popup with comments from different ppl

#     @m0
#   Scenario: I can click on details of a specific comment

#     @_tested @selenium @_done
#   Scenario: I can see the comment conversation details
#     When I follow translated "layout.main_menu.call_centre_agent.leads"
#     And I fill in "search_with_keyword" with "lead#3"
#     And I press translated "call_centre_agent.leads.index.view.search_button"
#     And I follow translated "comments.shared.show_comments"
#     Then I should see "Comment title #1"
#     Then I should see "Comment title #2"
#     Then I should see "Comment title #3"

#   @_tested @selenium @_done
#   Scenario: I can respond to a comment and my comment is added to the conversation
#     When I follow translated "layout.main_menu.call_centre_agent.leads"
#     And I fill in "search_with_keyword" with "lead#1"
#     And I press translated "call_centre_agent.leads.index.view.search_button"
#     And I follow translated "comments.shared.show_comments"
#     And I follow translated "comments.threads.show.view.reply" within ".row_tooltip_content"
#     And I fill in "comment_title" with "Reply to First Lead1 comment" within ".lead_threads_container_div"
#     And I fill in "comment_body" with "Body reply to First Lead1 comment" within ".lead_threads_container_div"
#     And I press translated "comments.threads.show.view.create_comment_button"
#     Then I should see "Reply to First Lead1 comment"
#     And I should see "Body reply to First Lead1 comment"

#   @_tested @_done
#   Scenario: I can browse all comments with pagination
#     Given pagination per page size in model Comment is set to 2
#     And I follow translated "layout.main_menu.shared.comments"
#     Then I follow "2"

#   @_tested @_done
#   Scenario: I can sort comments
#     Given I follow translated "layout.main_menu.shared.comments"
#     When I follow translated "comments.threads.index.view.lead_header"
#     And I follow translated "comments.threads.index.view.lead_header"
#     Then I should see "Lead#3" before "Lead#2"
#     When I follow translated "comments.threads.index.view.started_by"
#     Then I should see "John Doe" before "Mark Driscoll"
#     When I follow translated "comments.threads.index.view.date"
#     Then I should see "01-01-2010" before "01-01-2011"
#     When I follow translated "comments.threads.index.view.last_thread_date"
#     Then I should see "01-01-2011" before "02-01-2011"

#   @_tested @_done
#   Scenario: I can filter comments
#     Given I follow translated "layout.main_menu.shared.comments"
#     When I fill in "search_with_keyword" with "lead#1"
#     And I press translated "comments.threads.index.view.search_button"
#     Then I should see "Lead#1"
#     And I should not see "Lead#2"

#   @added @_tested @selenium @_done
#   Scenario: I cannot start new thread
#     When I follow translated "layout.main_menu.call_centre_agent.leads"
#     And I fill in "search_with_keyword" with "lead#3"
#     And I press translated "call_centre_agent.leads.index.view.search_button"
#     And I follow translated "comments.shared.show_comments"
#     And I should not see translated "comments.threads.new.view.header" with options "header: Lead#3"
