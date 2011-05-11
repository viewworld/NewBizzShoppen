@comments @m10 @requested @tgn
Feature: Comments

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
  And comment thread for lead "Lead#3" was posted by users "customer1@nbs.com, agent1@nbs.com, customer1@nbs.com"
  And user "customer1@nbs.com" with role "customer" has attributes "screen_name: Mark Driscoll"
  And user "customer2@nbs.com" with role "customer" has attributes "screen_name: John Doe"
  And I sign in as agent1@nbs.com with password supersecret

@_wip
Scenario: I can see that a comment has been read
  Given comments for lead "Lead#1" are read by by users "agent1@nbs.com"
  When I follow translated "layout.main_menu.agent.leads"

Scenario: I can see who read a comment (popup)

Scenario: The tab below lead information is red if it contains a comment that was not read

Scenario: When I open the tab with comments then the comments listed there are marked as read for me

