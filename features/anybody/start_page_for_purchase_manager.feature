#This is almost the same as in Buyer scope
@added @start_pages @ao
Feature: Start page for purchase manager

Background: I am a guest and I am on the home page
  Given I am on the home page

@added @_done
Scenario: I can see welcome text fetch from the database
  When I follow translated "home.show.view.purchase_manager"
  Then I should see "Blurb purchase manager home"

@added @_done
Scenario: I can see 3 latest purchase manager news excerpts
  Given published purchase manager news exists with attributes "title:FirstNews"
  And published purchase manager news exists with attributes "title:SecondNews"
  And published purchase manager news exists with attributes "title:ThirdNews"
  And published purchase manager news exists with attributes "title:FourthNews"
  And I follow translated "home.show.view.purchase_manager"
  Then I should see "FourthNews"
  And I should see "SecondNews"
  And I should see "ThirdNews"
  And I should not see "FirstNews"

@added @_done
Scenario: I can see 10 top bestsellers
  Given lead AwesomeLead exists within category Test
  And AwesomeLead is a best seller
  And there are "11" existing leads
  And I follow translated "home.show.view.purchase_manager"
  Then I should see "10" items on a list within "#best_sellers"
  And I should see "AwesomeLead" first on a list within "#best_sellers"

@added @_done
Scenario: I can see 10 latest leads
  Given there are "11" existing leads
  And lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.purchase_manager"
  Then I should see "10" items on a list within "#latest_leads"
  And I should see "AwesomeLead" first on a list within "#latest_leads"

@added @_done
Scenario: I can go to details of purchase manager news
  Given published purchase manager news exists with attributes "title:FirstNews"
  And I follow translated "home.show.view.purchase_manager"
  And I follow translated "purchase_manager_home.show.view.read_more_link" within "#news"
  Then I should be on FirstNews news page

@added @_done
Scenario: I can go to details of bestsellers
  Given lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.purchase_manager"
  And I follow "AwesomeLead" within "#best_sellers"
  Then I should be on the AwesomeLead lead page

@added @_done
Scenario: I can go to details of latest leads
  Given lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.purchase_manager"
  And I follow "AwesomeLead" within "#latest_leads"
  Then I should be on the AwesomeLead lead page

@added @tested_elsewhere
Scenario: I can go to purchase manager news listing

@added @_done
Scenario: I can go to bestsellers listing
  When I follow translated "home.show.view.purchase_manager"
  And I follow translated "purchase_manager_home.show.view.complete_list_link" within "#best_sellers"
  Then I should be on the leads page
  And I should see translated "leads.index.bestsellers_header"

@added @_done
Scenario: I can go to latest leads listing
  When I follow translated "home.show.view.purchase_manager"
  And I follow translated "purchase_manager_home.show.view.complete_list_link" within "#latest_leads"
  Then I should be on the leads page
  And I should see translated "leads.index.latest_header"

@added @_done
Scenario: I can go to buyer page by clicking “CLICK HERE IF YOU ARE A BUYER”
  When I follow translated "home.show.view.purchase_manager"
  And I follow translated "purchase_manager_home.show.view.buyer_link"
  Then I should be on the buyer home page

@added @_done
Scenario: I can go to agent page by clicking “CLICK HERE IF YOU ARE AN AGENT”
  When I follow translated "home.show.view.purchase_manager"
  And I follow translated "purchase_manager_home.show.view.agent_link"
  Then I should be on the agent home page

@added @_done
Scenario: I can go to creation of new purchase manager account page
  When I follow translated "home.show.view.purchase_manager"
  And I follow translated "purchase_manager_home.show.view.create_new_purchase_manager_account"
  Then I should be on purchase manager sign up page

@added @_done
Scenario: In bestsellers and latest listings I should not see leads which I've already bought
  When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
  And a lead BoughtLead exists within category Test and is bought by user jon@lajoie.ca with role customer
  And lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.purchase_manager"
  Then I should see "AwesomeLead"
  And I should see "BoughtLead"
  When I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I am on the home page
  And I follow translated "home.show.view.purchase_manager"
  Then I should see "AwesomeLead"
  And I should not see "BoughtLead"