#This is almost the same as in Agent scope
@start_pages @m2
Feature: Start page for buyer

Background: I am a guest and I am on the home page
  Given I am on the home page

@ao @m3 @_done
Scenario: I can see welcome text fetch from the database
  Then I should see "Blurb supplier home"

@m3 @ao @_done
Scenario: I can see 3 latest buyer news excerpts
  Given published buyer news exists with attributes "title:FirstNews"
  And published buyer news exists with attributes "title:SecondNews"
  And published buyer news exists with attributes "title:ThirdNews"
  And published buyer news exists with attributes "title:FourthNews"
  And I am on the home page
  Then I should see "FourthNews"
  And I should see "SecondNews"
  And I should see "ThirdNews"
  And I should not see "FirstNews"

# bestsellers replaced by latest deals on home page
@ao @_done @_tested @_deprecated
Scenario: I can see 10 top bestsellers
#  Given lead AwesomeLead exists within category Test
#  And AwesomeLead is a best seller
#  And there are "11" existing leads
#  And I follow translated "home.show.view.buyer"
#  Then I should see "3" items on a list within "#best_sellers"
#  And I should see "AwesomeLead" first on a list within "#best_sellers"

@ao @_done @_tested
Scenario: I can see 3 latest leads
  Given there are "4" existing leads
  And lead AwesomeLead exists within category Test
  And I am on the home page
  Then I should see "3" items on a list within "#latest_leads"
  And I should see "AwesomeLead" first on a list within "#latest_leads"

@added @m6 @ao @_tested @_done
Scenario: I can't see inactive leads on latest leads
  When there are no leads
  And a lead InactiveLead exists within category Test and is bought by user kastomer@nbs.fake with role supplier
  And lead "InactiveLead" has attributes "sale_limit:1"
  And I am on the home page
  Then I should see "1" items on a list within "#latest_leads"
  And I follow translated "supplier_home.show.view.complete_list_link" within "#latest_leads"
  Then I should see translated "common.nothing_to_display"

@m3 @ao @_done
Scenario: I can go to details of buyer news
  Given published buyer news exists with attributes "title:FirstNews"
  And I am on the home page"
  And I follow translated "supplier_home.show.view.read_more_link" within "#news"
  Then I should be on FirstNews news page

@ao @_done @_tested
Scenario: I can go to details of bestsellers
  Given lead AwesomeLead exists within category Test
  And AwesomeLead is a best seller
  And I am on the home page
  And I follow "AwesomeLead" within "#best_sellers"
  Then I should be on the AwesomeLead lead page

@ao @_done @_tested
Scenario: I can go to details of latest leads
  Given lead AwesomeLead exists within category Test
  And I am on the home page
  And I follow "AwesomeLead" within "#latest_leads"
  Then I should be on the AwesomeLead lead page

@m3 @ao @_done @_tested
Scenario: I can go to buyer news listing
  Given lead AwesomeLead exists within category Test
  And I am on the home page
  And I follow translated "supplier_home.show.view.complete_list_link" within "#latest_leads"
  Then I should see "AwesomeLead" within ".leads_table"

@ao @_done @_tested
Scenario: I can go to bestsellers listing
  And I am on the home page
  And I follow translated "supplier_home.show.view.complete_list_link" within "#best_sellers"
  Then I should be on the leads page
  And I should see translated "leads.index.bestsellers_header"

@ao @_done @_tested
Scenario: I can go to latest leads listing
  And I follow translated "supplier_home.show.view.complete_list_link" within "#latest_leads"
  Then I should be on the leads page
  And I should see translated "leads.index.latest_header"

@ao @_done @_tested @_deprecated
Scenario: I can go to agent page by clicking “CLICK HERE IF YOU ARE AN AGENT”
#  When I follow translated "home.show.view.buyer"
#  And I follow translated "supplier_home.show.view.agent_link"
#  Then I should be on the agent home page

@ao @_done @_tested
Scenario: I can go to new buyer creation page
  And I follow translated "supplier_home.show.view.create_new_supplier_account"
  Then I should be on supplier sign up page

@ao @m3 @_done
Scenario: In bestsellers and latest listings I should not see leads which I've already bought
  When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
  And a lead BoughtLead exists within category Test and is bought by user jon@lajoie.ca with role supplier
  And lead AwesomeLead exists within category Test
  And user "jon@lajoie.ca" with role "supplier" has interest in following categories "Test"
  And I am on the home page
  Then I should see "AwesomeLead"
  And I should see "BoughtLead"
  When I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I am on the home page
  Then I should see "AwesomeLead" within "#latest_leads"
  And I should not see "BoughtLead" within "#latest_leads"

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
  And I am on the home page
  And I should see "CommonLead1" within "#best_sellers"
  And I should not see "UniqueLead1" within "#best_sellers"
  And I should see "CommonLead1" within "#latest_leads"
  And I should see "CommonLead2" within "#latest_leads"
  And I should not see "UniqueLead1" within "#latest_leads"
  And I should not see "UniqueLead2" within "#latest_leads"

@m5 @unique_categories @tgn @added @_tested @_done
Scenario: I should not see leads from customer unique categories I'm not assigned to on Latest leads listing
  Given I am signed up and confirmed as user with email customer23424342@nbs.com and password secret and role supplier
  Given lead CommonLead1 exists within category Common Category1
  And lead CommonLead2 exists within category Common Category2
  And lead UniqueLead1 exists within category Unique Category1
  And I have user with email other_agent@nbs.com and role agent
  And category "Unique Category1" is unique for user with email "other_agent@nbs.com" role "agent"
  And lead UniqueLead2 exists within category Unique Category2
  And I have user with email other_customer@nbs.com and role supplier
  And category "Unique Category2" is unique for user with email "other_customer@nbs.com" role "supplier"
  Given user "customer23424342@nbs.com" with role "supplier" has interest in following categories "Common Category1,Common Category2,Unique Category1"
  Then I sign in as customer23424342@nbs.com with password secret
  And I go to the home page
  And I should see "CommonLead1" within "#latest_leads"
  And I should see "CommonLead2" within "#latest_leads"
  And I should see "UniqueLead1" within "#latest_leads"
  And I should not see "UniqueLead2" within "#latest_leads"

@m5 @unique_categories @tgn @added @_tested @_done
Scenario: I should see leads from customer unique categories I'm assigned to on Latest leads listing
  Given I am signed up and confirmed as user with email customer23424342@nbs.com and password secret and role supplier
  Given lead CommonLead1 exists within category Common Category1
  And lead CommonLead2 exists within category Common Category2
  And lead UniqueLead1 exists within category Unique Category1
  And I have user with email other_customer@nbs.com and role supplier
  And category "Unique Category1" is unique for user with email "other_customer@nbs.com" role "supplier"
  And lead UniqueLead2 exists within category Unique Category2
  And category "Unique Category2" is unique for user with email "customer23424342@nbs.com" role "supplier"
  Given user "customer23424342@nbs.com" with role "supplier" has interest in following categories "Common Category1,Common Category2,Unique Category2"
  Then I sign in as customer23424342@nbs.com with password secret
  And I go to the home page
  And I should see "CommonLead1" within "#latest_leads"
  And I should see "CommonLead2" within "#latest_leads"
  And I should not see "UniqueLead1" within "#latest_leads"
  And I should see "UniqueLead2" within "#latest_leads"

@requested @m11 @is @interests @_done @_tested @deprecated
Scenario: Buyer can see link to Interests on supplier home page if he don't have set any interests yet
#  Given I am on the homepage
#  Then I sign in as buyer@nbs.com with password secret
#  And I open page in browser
#  Then I should not see translated "supplier_home.show.view.configure_interests_link"
#  Then User with email buyer@nbs.com don't have interests
#  Given I am on supplier home
#  Then I should see translated "supplier_home.show.view.configure_interests_link"
#  Then I follow translated "supplier_home.show.view.configure_interests_link"
#  Then I should see translated "supplier.interests.edit.view.title"

#7457
@m20 @requested @is @_done @_tested
Scenario: I should see Latest deals instead of bestsellers box when I am not logged in on the supplier home
  Given there are no deals
  Given there are "4" existing deals
  And a deal named "AwesomeDeal" exists within category "Dilownia"
  And I am on the supplier home page
  Then I should see translated "supplier_home.show.view.header_latest_deals"
  And I should see "3" items on a list within "#latest_deals"
  And I should see "AwesomeDeal" first on a list within "#latest_deals"
