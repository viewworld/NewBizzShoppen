#This is almost the same as in Buyer scope
@start_pages @m2 @faircalls
Feature: Start page for agent

Background: I am a guest and I am on the home page
  Given I visit domain http://faircalls.eu
  Given I am on the home page

@ao @m3 @_done @_deprecated
Scenario: I can see welcome text fetch from the database
#   Then I should see "Blurb agent home"

@m3 @ao @_done
Scenario: I can see 3 latest agent news excerpts
  Given published agent news exists with attributes "title:FirstNews"
  And published agent news exists with attributes "title:SecondNews"
  And published agent news exists with attributes "title:ThirdNews"
  And published agent news exists with attributes "title:FourthNews"
  When I am on the agent home page
  Then I should see "FourthNews"
  And I should see "SecondNews"
  And I should see "ThirdNews"
  And I should not see "FirstNews"

@ao @_tested @_done
Scenario: I can see 10 top bestsellers
  Given lead AwesomeLead exists within category Test
  And AwesomeLead is a best seller
  And there are "11" existing leads
  When I am on the agent home page
  Then I should see "3" items on a list within "#best_sellers"
  And I should see "AwesomeLead" first on a list within "#best_sellers"

@ao @_tested @_done
Scenario: I can see 3 latest leads
  Given there are "4" existing leads
  And lead AwesomeLead exists within category Test
  When I am on the agent home page
  Then I should see "3" items on a list within "#latest_leads"
  And I should see "AwesomeLead" first on a list within "#latest_leads"

@added @m6 @ao @_tested @_done
Scenario: I can't see inactive leads on latest leads
  When there are no leads
  And a lead InactiveLead exists within category Test and is bought by user kastomer@nbs.fake with role supplier
  And lead "InactiveLead" has attributes "sale_limit:1"
  When I am on the agent home page
  Then I should see "1" items on a list within "#latest_leads"
  And I follow translated "agent_home.show.view.complete_list_link" within "#latest_leads"
  Then I should see translated "common.nothing_to_display"

# @m3 @ao @_done @_deprecated2014
# Scenario: I can go to details of agent news
#   Given published agent news exists with attributes "title:FirstNews"                                                                                                      i
#   When I am on the agent home page
#   And I follow translated "agent_home.show.view.read_more_link" within "#news"
#   Then I should be on FirstNews news page

# @ao @_tested @_done @_deprecated2014
# Scenario: I can go to details of bestsellers
#   Given lead AwesomeLead exists within category Test
#   And AwesomeLead is a best seller
#   When I am on the agent home page
#   And I follow "AwesomeLead" within "#best_sellers"
#   Then I should be on the AwesomeLead lead page

# @ao @_tested @_done @_deprecated2014
# Scenario: I can go to details of latest leads
#   Given lead AwesomeLead exists within category Test
#   When I am on the agent home page
#   And I follow "AwesomeLead" within "#latest_leads"
#   Then I should be on the AwesomeLead lead page

@m3 @ao @_done @_tested
Scenario: I can go to agent news listing
  Given lead AwesomeLead exists within category Test
  When I am on the agent home page
  And I follow translated "agent_home.show.view.complete_list_link" within "#latest_leads"
  Then I should see "AwesomeLead" within ".leads_table"

# @ao @_tested @_done @_deprecated2014
# Scenario: I can go to bestsellers listing
#   When I am on the agent home page
#   And I follow translated "agent_home.show.view.complete_list_link" within "#best_sellers"
#   Then I should be on the leads page
#   And I should see translated "leads.index.bestsellers_header"

@ao @_tested @_done
Scenario: I can go to latest leads listing
  When I am on the agent home page
  And I follow translated "agent_home.show.view.complete_list_link" within "#latest_leads"
  Then I should be on the leads page
  And I should see translated "leads.index.latest_header"

@ao @_tested  @_deprecated
Scenario: I can go to buyer page by clicking “CLICK HERE IF YOU ARE A BUYER”
#  When I follow translated "home.show.view.agent"
#  And I follow translated "agent_home.show.view.buyer_link"
#  Then I should be on the supplier home page

# @ao @_tested @_done @_deprecated2014
# Scenario: I can go to creation of new agent account page
#   When I am on the agent home page
#   And I follow translated "agent_home.show.view.create_new_agent_account"
#   Then I should be on agent sign up page

# bestsellers removed
@ao @m3 @_done @_deprecated
Scenario: In bestsellers and latest listings I should not see leads which I've already bought
#  When I visit domain http://fairleads.eu
#  When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
#  And a lead BoughtLead exists within category Test and is bought by user jon@lajoie.ca with role supplier
#  And lead AwesomeLead exists within category Test
#  When I am on the home page
#  Then I should see "AwesomeLead"
#  And I should see "BoughtLead"
#  When I am on the home page
#  And I sign in as jon@lajoie.ca with password secret
#  When I am on the home page
#  Then I should see "AwesomeLead"
#  And I should not see "BoughtLead"

@m5 @unique_categories @tgn @added @_tested @_done
Scenario: When I am not logged in I should not see any leads from unique categories on Latest & Bestsellers lists
  Given lead CommonLead1 exists within category Common Category1
  And CommonLead1 is a best seller
  And lead CommonLead2 exists within category Common Category2
  And lead UniqueLead1 exists within category Unique Category1
  And UniqueLead1 is a best seller
  And I have user with email other_agent@nbs.com and role agent
  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
  And lead UniqueLead2 exists within category Unique Category2
  And I have user with email other_customer@nbs.com and role supplier
  And category "Unique Category2" is unique for user with email "other_customer@nbs.com" role "supplier"
  When I am on agent home page
  And I should see "CommonLead1" within "#best_sellers"
  And I should not see "UniqueLead1" within "#best_sellers"
  And I should see "CommonLead1" within "#latest_leads"
  And I should see "CommonLead2" within "#latest_leads"
  And I should not see "UniqueLead1" within "#latest_leads"
  And I should not see "UniqueLead2" within "#latest_leads"

# deprecation reason: https://redmine.selleo.com/issues/4646
@m5 @unique_categories @tgn @added @_tested @_deprecated
Scenario: I should not see leads from agent unique categories I'm not assigned to on Latest leads listing

# deprecation reason: https://redmine.selleo.com/issues/4646
@m5 @unique_categories @tgn @added @_tested @_deprecated
Scenario: I should not see leads from agent unique categories I'm not assigned to on Bestsellers listing

@m5 @unique_categories @tgn @added @_tested_elsewhere @_done
Scenario: I should see leads from customer unique categories on Latest leads listing

# deprecation reason: https://redmine.selleo.com/issues/4646
@m5 @unique_categories @tgn @added @_tested @_deprecated
Scenario: I should see leads from agent unique categories I'm assigned to on Latest leads listing

# deprecation reason: https://redmine.selleo.com/issues/4646
@m5 @unique_categories @tgn @added @_tested @_deprecated
Scenario: I should see leads from agent unique categories I'm assigned to on Bestsellers listing

@m8 @_requested @ao @_done @_tested @_deprecated
Scenario: When you are loged in as an agent and go to the role home pages, I should see column with “My sold leads”
#  Given there are no leads
#  And I am signed up and confirmed as user with email ejdzent@nbs.com and password secret and role agent
#  And lead Super ultra lead #1 is created by user ejdzent@nbs.com with role agent
#  And someone is signed up and confirmed as user with email bigbajer@nbs.com and password secret and role supplier with attributes ""
#  And User bigbajer@nbs.com with role supplier is big buyer
#  And an user with role lead_user and email lidjuzer@nbs.com exists as subaccount for customer bigbajer@nbs.com
#  And lead Super ultra lead #1 is bought by user bigbajer@nbs.com with role supplier and is assigned to user lidjuzer@nbs.com with role lead_user
#  When I sign in as ejdzent@nbs.com with password secret
#  When I am on the agent home page
#  Then I should see "Super ultra lead #1" within "#sold_leads"
#  And I should see "1" items on a list within "#sold_leads"

  @m8 @_requested @ao @_done @_tested @_deprecated
  Scenario: When you are loged in as an agent and go to the role home pages, I should see column with “My new leads” (deprecated in favour of "My new comments")

#hame page is not used anymnore
@_requested @m11 @is @call_center_comments @_done @_tested @_deprecated
Scenario: Agent can see his latest comments on home page
#  And I have user with email customer2@nbs.com and role supplier
#  And user "customer2@nbs.com" with role "supplier" has attributes "screen_name: Adam Savage"
#  And a lead Lead#1 exists within category Business and is bought by user customer2@nbs.com with role supplier
#  And comment thread for lead "Lead#1" was posted by users "agent@nbs.com"
#  And comment for lead "Lead#1" was posted by user "customer2@nbs.com" with attributes "title:First Lead1 comment, created_at: 2011-01-01, last_thread_created_at:2011-01-01"
#  Given I am on the homepage
#  And comments for lead "Lead#1" are read by by users "agent@nbs.com"
#  Then I sign in as agent@nbs.com with password secret
#  Given I am on agent home
