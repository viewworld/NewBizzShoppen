#This is almost the same as in Buyer scope
@added @start_pages @ao  @_requested
Feature: Start page for purchase manager

Background: I am a guest and I am on the home page
#  Given I visit domain http://fairdeals.eu
#  And I am on the member home page

@added @_done @_deprecated
Scenario: I can see welcome text fetch from the database
#  Then I should see "Blurb member home"

@added @_done @_deprecated
Scenario: I can see 3 latest purchase manager news excerpts
#  Given published purchase manager news exists with attributes "title:FirstNews"
#  And published purchase manager news exists with attributes "title:SecondNews"
#  And published purchase manager news exists with attributes "title:ThirdNews"
#  And published purchase manager news exists with attributes "title:FourthNews"
#  When I am on the member home page
#  Then I should see "FourthNews"
#  And I should see "SecondNews"
#  And I should see "ThirdNews"
#  And I should not see "FirstNews"

@added @_done @_deprecated
Scenario: I can see 10 top bestsellers
#  Given lead AwesomeLead exists within category Test
#  And AwesomeLead is a best seller
#  And there are "11" existing leads
#  When I am on the member home page
#  Then I should see "3" items on a list within "#best_sellers"
#  And I should see "AwesomeLead" first on a list within "#best_sellers"

@added @_done @_deprecated
Scenario: I can see 10 latest leads
#  Given there are "4" existing leads
#  And lead AwesomeLead exists within category Test
#  When I am on the member home page
#  Then I should see "3" items on a list within "#latest_leads"
#  And I should see "AwesomeLead" first on a list within "#latest_leads"

@added @m6 @ao @_tested @_done @_deprecated
Scenario: I can't see inactive leads on latest leads
#  When there are no leads
#  And a lead InactiveLead exists within category Test and is bought by user kastomer@nbs.fake with role supplier
#  And lead "InactiveLead" has attributes "sale_limit:1"
#  When I am on the member home page
#  Then I should see "1" items on a list within "#latest_leads"
#  And I follow translated "member_home.show.view.complete_list_link" within "#latest_leads"
#  Then I should see translated "common.nothing_to_display"

@added @_done @_deprecated
Scenario: I can go to details of purchase manager news
#  Given published purchase manager news exists with attributes "title:FirstNews"
#  When I am on the member home page
#  And I follow translated "member_home.show.view.read_more_link" within "#news"
#  Then I should be on FirstNews news page

@added @_done @_deprecated
Scenario: I can go to details of bestsellers
#  Given lead AwesomeLead exists within category Test
#  And AwesomeLead is a best seller
#  When I am on the member home page
#  And I follow "AwesomeLead" within "#best_sellers"
#  Then I should be on the AwesomeLead lead page

@added @_done @_deprecated
Scenario: I can go to details of latest leads
#  Given lead AwesomeLead exists within category Test
#  When I am on the member home page
#  And I follow "AwesomeLead" within "#latest_leads"
#  Then I should be on the AwesomeLead lead page

@added @_done @_tested @_deprecated
Scenario: I can go to purchase manager news listing
#  Given lead AwesomeLead exists within category Test
#  When I am on the member home page
#  And I follow translated "member_home.show.view.complete_list_link" within "#latest_leads"
#  Then I should see "AwesomeLead" within ".leads_table"

@added @_done @_deprecated
Scenario: I can go to bestsellers listing
#  When I am on the member home page
#  And I follow translated "member_home.show.view.complete_list_link" within "#best_sellers"
#  Then I should be on the leads page
#  And I should see translated "leads.index.bestsellers_header"

@added @_done @_deprecated
Scenario: I can go to latest leads listing
#  When I am on the member home page
#  And I follow translated "member_home.show.view.complete_list_link" within "#latest_leads"
#  Then I should be on the leads page
#  And I should see translated "leads.index.latest_header"

@added @_done @_deprecated
Scenario: I can go to buyer page by clicking “CLICK HERE IF YOU ARE A BUYER”
#  When I follow translated "home.show.view.purchase_manager"
#  And I follow translated "member_home.show.view.buyer_link"
#  Then I should be on the supplier home page

@added @_done @_deprecated
Scenario: I can go to agent page by clicking “CLICK HERE IF YOU ARE AN AGENT”
#  When I follow translated "home.show.view.purchase_manager"
#  And I follow translated "member_home.show.view.agent_link"
#  Then I should be on the agent home page

@added @_done @_deprecated
Scenario: I can go to creation of new purchase manager account page
#  When I am on the member home page
#  And I follow translated "member_home.show.view.create_new_member_account"
#  Then I should be on member sign up page

@added @_done @_deprecated
Scenario: In bestsellers and latest listings I should not see leads which I've already bought
#  When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
#  And a lead BoughtLead exists within category Test and is bought by user jon@lajoie.ca with role supplier
#  And lead AwesomeLead exists within category Test
#  When I am on the member home page
#  Then I should see "AwesomeLead"
#  And I should see "BoughtLead"
#  When I am on the home page
#  And I sign in as jon@lajoie.ca with password secret
#  And I am on the home page
#  When I am on the member home page
#  Then I should see "AwesomeLead"
#  And I should not see "BoughtLead"

@m5 @unique_categories @tgn @added @_tested @_requested @_done @_deprecated
Scenario: When I am not logged in I should not see any leads from unique categories on Latest & Bestsellers lists
#  Given lead CommonLead1 exists within category Common Category1
#  And CommonLead1 is a best seller
#  And lead CommonLead2 exists within category Common Category2
#  And lead UniqueLead1 exists within category Unique Category1
#  And UniqueLead1 is a best seller
#  And I have user with email other_agent@nbs.com and role agent
#  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
#  And lead UniqueLead2 exists within category Unique Category2
#  And I have user with email other_customer@nbs.com and role supplier
#  And category "Unique Category2" is unique for user with email "other_customer@nbs.com" role "supplier"
#  When I am on the member home page
#  And I should see "CommonLead1" within "#best_sellers"
#  And I should not see "UniqueLead1" within "#best_sellers"
#  And I should see "CommonLead1" within "#latest_leads"
#  And I should see "CommonLead2" within "#latest_leads"
#  And I should not see "UniqueLead1" within "#latest_leads"
#  And I should not see "UniqueLead2" within "#latest_leads"

# deprecated in favour to 'my contact requests'
@m5 @unique_categories @tgn @added @_tested @_done @_requested @_deprecated
Scenario: I should not see leads from agent unique categories I'm not assigned to on Latest leads listing
#  Given lead CommonLead1 exists within category Common Category1
#  And lead CommonLead2 exists within category Common Category2
#  And lead UniqueLead1 exists within category Unique Category1
#  And I have user with email other_agent@nbs.com and role agent
#  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
#  And lead UniqueLead2 exists within category Unique Category2
#  And I have user with email other_customer@nbs.com and role supplier
#  And category "Unique Category2" is unique for user with email "other_customer@nbs.com" role "supplier"
#  When I am signed up and confirmed as user with email agent34234234@nbs.com and password secret and role member
#  Then I sign in as agent34234234@nbs.com with password secret
#  And I go to the home page
#  And I follow translated "home.show.view.purchase_manager"
#  And I should see "CommonLead1" within "#latest_leads"
#  And I should see "CommonLead2" within "#latest_leads"
#  And I should not see "UniqueLead1" within "#latest_leads"
#  And I should see "UniqueLead2" within "#latest_leads"

# best sellers removed in m16
@m5 @unique_categories @tgn @added @_tested  @_requested @_deprecated @_done
Scenario: I should not see leads from agent unique categories I'm not assigned to on Bestsellers listing
#  Given lead CommonLead1 exists within category Common Category1
#  And CommonLead1 is a best seller
#  And lead CommonLead2 exists within category Common Category2
#  And CommonLead2 is a best seller
#  And lead UniqueLead1 exists within category Unique Category1
#  And UniqueLead1 is a best seller
#  And I have user with email other_agent@nbs.com and role agent
#  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
#  And lead UniqueLead2 exists within category Unique Category2
#  And UniqueLead2 is a best seller
#  And I have user with email other_customer@nbs.com and role supplier
#  And category "Unique Category2" is unique for user with email "other_customer@nbs.com" role "supplier"
#  When I am signed up and confirmed as user with email agent34234234@nbs.com and password secret and role member
#  Then I sign in as agent34234234@nbs.com with password secret
#  And I go to the home page
#  And I follow translated "home.show.view.purchase_manager"
#  And I should see "CommonLead1" within "#best_sellers"
#  And I should see "CommonLead2" within "#best_sellers"
#  And I should not see "UniqueLead1" within "#best_sellers"
#  And I should see "UniqueLead2" within "#best_sellers"

@m5 @unique_categories @tgn @added @_tested_elsewhere @_done  @_requested
Scenario: I should see leads from customer unique categories on Latest leads listing

# deprecated in favour to 'my contact requests'
@m5 @unique_categories @tgn @added @_tested @_done @_requested @_deprecated
Scenario: I should see leads from agent unique categories I'm assigned to on Latest leads listing
#  Given I am signed up and confirmed as user with email agent34234234@nbs.com and password secret and role member
#  Given lead CommonLead1 exists within category Common Category1
#  And lead CommonLead2 exists within category Common Category2
#  And lead UniqueLead1 exists within category Unique Category1
#  And I have user with email other_agent@nbs.com and role agent
#  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
#  And lead UniqueLead2 exists within category Unique Category2
#  And I have user with email other_customer@nbs.com and role supplier
#  And category "Unique Category2" is unique for user with email "agent34234234@nbs.com" role "member"
#  Then I sign in as agent34234234@nbs.com with password secret
#  And I go to the home page
#  And I follow translated "home.show.view.purchase_manager"
#  And I should see "CommonLead1" within "#latest_leads"
#  And I should see "CommonLead2" within "#latest_leads"
#  And I should not see "UniqueLead1" within "#latest_leads"
#  And I should see "UniqueLead2" within "#latest_leads"

# best sellers removed in m16
@m5 @unique_categories @tgn @added @_tested  @_requested @_deprecated @_done
Scenario: I should see leads from agent unique categories I'm assigned to on Bestsellers listing
#  Given I am signed up and confirmed as user with email agent34234234@nbs.com and password secret and role member
#  Given lead CommonLead1 exists within category Common Category1
#  And CommonLead1 is a best seller
#  And lead CommonLead2 exists within category Common Category2
#  And CommonLead2 is a best seller
#  And lead UniqueLead1 exists within category Unique Category1
#  And UniqueLead1 is a best seller
#  And I have user with email other_agent@nbs.com and role agent
#  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
#  And lead UniqueLead2 exists within category Unique Category2
#  And UniqueLead2 is a best seller
#  And I have user with email other_customer@nbs.com and role supplier
#  And category "Unique Category2" is unique for user with email "agent34234234@nbs.com" role "member"
#  Then I sign in as agent34234234@nbs.com with password secret
#  And I go to the home page
#  And I follow translated "home.show.view.purchase_manager"
#  And I should see "CommonLead1" within "#best_sellers"
#  And I should see "CommonLead2" within "#best_sellers"
#  And I should not see "UniqueLead1" within "#best_sellers"
#  And I should see "UniqueLead2" within "#best_sellers"

@m12 @$_purchase_manager @_requested @_done @_tested @_deprecated
Scenario: I should see "My contact requests" instead of "Latest leads"
#  When I am signed up and confirmed as user with email pm@nbs.com and password secret and role member
#  And I am on the home page
#  And I sign in as pm@nbs.com with password secret
#  And I follow translated "member_home.show.view.complete_list_link" within "#my_contact_requests"
#  Then I should be on the leads page
#  And I should see translated "leads.index.contact_requests_for_header"

@m12 @$_guest @added @_done @_tested @_deprecated
Scenario: I should see "Latest leads" when I'm not a procurement manager
#  When I am on the member home page
#  And I follow translated "member_home.show.view.complete_list_link" within "#latest_leads"
#  Then I should be on the leads page
#  And I should see translated "leads.index.latest_header"

#1/ Lead created by given Procurement manager, and
#2/ Lead created by other agents where given Procurement manager is specified as Contact
@m12 @$_purchase_manager @_requested @_done @_tested @_deprecated
Scenario: In "My contact requests" I should see leads created by me and leads created by other agents where I am specified as a contact
#  When there are no leads
#  And I am signed up and confirmed as user with email pm@nbs.com and password secret and role member
#  And lead Lead#1 is created by user pm@nbs.com with role member
#  And lead "Lead#1" is published
#  And lead Lead#2 is created by user agent@nbs.com with role agent
#  And lead "Lead#2" has attributes "email_address:pm@nbs.com"
#  And I am on the home page
#  And I sign in as pm@nbs.com with password secret
#  Then I should see "Lead#1" within "#my_contact_requests"
#  And I should see "Lead#2" within "#my_contact_requests"