@comments @m10 @requested @tgn @faircalls
Feature: Comments

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email agent1@nbs.com and password supersecret and role agent
  And lead Lead#1 is created by user agent1@nbs.com with role agent
  And lead Lead#2 is created by user agent1@nbs.com with role agent
  And lead Lead#3 is created by user agent1@nbs.com with role agent
  And a lead Lead#1 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And a lead Lead#2 exists within category Computers and is bought by user customer2@nbs.com with role supplier
  And a lead Lead#3 exists within category Computers and is bought by user customer1@nbs.com with role supplier
  And comment for lead "Lead#1" was posted by user "customer1@nbs.com" with attributes "created_at: 2011-01-01, last_thread_created_at:2011-01-01"
  And comment for lead "Lead#2" was posted by user "customer2@nbs.com" with attributes "last_thread_created_at:2011-01-02"
  And comment for lead "Lead#3" was posted by user "customer1@nbs.com" with attributes "created_at: 2010-01-01, last_thread_created_at:2011-01-30"
  And comment thread for lead "Lead#3" was posted by users "customer1@nbs.com, agent1@nbs.com, customer1@nbs.com"
  And user "customer1@nbs.com" with role "supplier" has attributes "company_name: Mark Driscoll"
  And user "customer2@nbs.com" with role "supplier" has attributes "company_name: John Doe"
  And I visit domain http://faircalls.eu
  And I sign in as agent1@nbs.com with password supersecret

@selenium @_tested @_done
Scenario: I can see that a comment has been read
  Given I have user with email admin88@nbs.com and role admin
  And comments for lead "Lead#1" are read by by users "admin88@nbs.com"
  When I follow translated "layout.main_menu.agent.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "agent.leads.index.view.search_button"
  And I follow translated "comments.shared.show_comments"
  Then I should see translated "comments.threads.show.view.read_by_number_of_users" with options "count:1"

@_done @non_testable
Scenario: I can see who read a comment (popup)

@selenium @_tested @_done
Scenario: The tab below lead information is red if it contains a comment that was not read
  Given I am not sign in
  And someone is signed up and confirmed as user with email customer99@nbs.com and password supersecret and role supplier
  And a lead Lead#4 exists within category Computers and is bought by user customer99@nbs.com with role supplier
  And comment thread for lead "Lead#4" was posted by users "customer99@nbs.com, agent1@nbs.com"
  And I go to the homepage
  And I visit domain http://localhost
  And I sign in as customer99@nbs.com with password supersecret
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "lead#4"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  Then I should see "1" occurrences of css class "toggle_row_unread" for tag "a"
  And I follow translated "lead_purchases.listing.show_comments"
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  And I fill in "search_with_keyword" with "lead#4"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  Then I should see "0" occurrences of css class "toggle_row_unread" for tag "a"

@selenium @_tested @_done
Scenario: When I open the tab with comments then the comments listed there are marked as read for me
  Given I have user with email admin88@nbs.com and role admin
  And comments for lead "Lead#1" are read by by users "admin88@nbs.com"
  And comments for lead "Lead#1" should not be read by user "agent1@nbs.com"
  When I follow translated "layout.main_menu.agent.leads"
  And I fill in "search_with_keyword" with "lead#1"
  And I press translated "agent.leads.index.view.search_button"
  And I follow translated "comments.shared.show_comments"
  And I wait 2 second
  And comments for lead "Lead#1" should be read by user "agent1@nbs.com"

