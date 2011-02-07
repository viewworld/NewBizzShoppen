#This is almost the same as in Agent scope
@start_pages @m2
Feature: Start page for buyer

Background: I am a guest and I am on the home page
  Given I am on the home page

@ao @m3 @_done
Scenario: I can see welcome text fetch from the database
  When I follow translated "home.show.view.buyer"
  Then I should see "Blurb buyer home"

@m3 @ao @_done
Scenario: I can see 3 latest buyer news excerpts
  Given published buyer news exists with attributes "title:FirstNews"
  And published buyer news exists with attributes "title:SecondNews"
  And published buyer news exists with attributes "title:ThirdNews"
  And published buyer news exists with attributes "title:FourthNews"
  And I follow translated "home.show.view.buyer"
  Then I should see "FourthNews"
  And I should see "SecondNews"
  And I should see "ThirdNews"
  And I should not see "FirstNews"

@ao @_done @_tested
Scenario: I can see 10 top bestsellers
  Given lead AwesomeLead exists within category Test
  And AwesomeLead is a best seller
  And there are "11" existing leads
  And I follow translated "home.show.view.buyer"
  Then I should see "10" items on a list within "#best_sellers"
  And I should see "AwesomeLead" first on a list within "#best_sellers"

@ao @_done @_tested
Scenario: I can see 10 latest leads
  Given there are "11" existing leads
  And lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.buyer"
  Then I should see "10" items on a list within "#latest_leads"
  And I should see "AwesomeLead" first on a list within "#latest_leads"

@m3 @ao @_done
Scenario: I can go to details of buyer news
  Given published buyer news exists with attributes "title:FirstNews"
  And I follow translated "home.show.view.buyer"
  And I follow translated "buyer_home.show.view.read_more_link" within "#news"
  Then I should be on FirstNews news page

@ao @_done @_tested
Scenario: I can go to details of bestsellers
  Given lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.buyer"
  And I follow "AwesomeLead" within "#best_sellers"
  Then I should be on the AwesomeLead lead page

@ao @_done @_tested
Scenario: I can go to details of latest leads
  Given lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.buyer"
  And I follow "AwesomeLead" within "#latest_leads"
  Then I should be on the AwesomeLead lead page

@m3 @ao @tested_elsewhere @_done
Scenario: I can go to buyer news listing

@ao @_done @_tested
Scenario: I can go to bestsellers listing
  When I follow translated "home.show.view.buyer"
  And I follow translated "buyer_home.show.view.complete_list_link" within "#best_sellers"
  Then I should be on the leads page
  And I should see translated "leads.index.bestsellers_header"

@ao @_done @_tested
Scenario: I can go to latest leads listing
  When I follow translated "home.show.view.buyer"
  And I follow translated "buyer_home.show.view.complete_list_link" within "#latest_leads"
  Then I should be on the leads page
  And I should see translated "leads.index.latest_header"

@ao @_done @_tested
Scenario: I can go to agent page by clicking “CLICK HERE IF YOU ARE AN AGENT”
  When I follow translated "home.show.view.buyer"
  And I follow translated "buyer_home.show.view.agent_link"
  Then I should be on the agent home page

@ao @_done @_tested
Scenario: I can go to new buyer creation page
  When I follow translated "home.show.view.buyer"
  And I follow translated "buyer_home.show.view.create_new_buyer_account"
  Then I should be on buyer sign up page

@ao @m3 @_done
Scenario: In bestsellers and latest listings I should not see leads which I've already bought
  When I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
  And a lead BoughtLead exists within category Test and is bought by user jon@lajoie.ca with role customer
  And lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.buyer"
  Then I should see "AwesomeLead"
  And I should see "BoughtLead"
  When I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And I am on the home page
  And I follow translated "home.show.view.buyer"
  Then I should see "AwesomeLead"
  And I should not see "BoughtLead"

@m5 @ao
Scenario: I can see latest leads in my categories (interests)

# including hidden descriptions
@m5 @ao
Scenario: I can see my leads

@m5 @ao
Scenario: I can add team members

@m5 @ao
Scenario: I can sign out