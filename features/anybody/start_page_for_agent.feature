#This is almost the same as in Buyer scope
@start_pages @m2
Feature: Start page for agent

Background: I am a guest and I am on the home page
  Given I am on the home page

# this is gonna be stored as an article
@ao @m3
Scenario: I can see welcome text fetch from the database

@m3 @ao @_todo
Scenario: I can see 3 latest agent news excerpts

@ao @_done @_tested
Scenario: I can see 10 top bestsellers
  Given lead AwesomeLead exists within category Test
  And AwesomeLead is a best seller
  And there are "11" existing leads
  And I follow translated "home.show.view.agent"
  Then I should see "10" items on a list within "#best_sellers"
  And I should see "AwesomeLead" first on a list within "#best_sellers"

@ao @_done @_tested
Scenario: I can see 10 latest leads
  Given there are "11" existing leads
  And lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.agent"
  Then I should see "10" items on a list within "#latest_leads"
  And I should see "AwesomeLead" first on a list within "#latest_leads"

@m0 @ao @_todo
Scenario: I can go to details of agent news

@ao @_done @_tested
Scenario: I can go to details of bestsellers
  Given lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.agent"
  And I follow "AwesomeLead" within "#best_sellers"
  Then I should be on the AwesomeLead lead page

@ao @_done @_tested
Scenario: I can go to details of latest leads
  Given lead AwesomeLead exists within category Test
  And I follow translated "home.show.view.agent"
  And I follow "AwesomeLead" within "#latest_leads"
  Then I should be on the AwesomeLead lead page

@m0 @ao @_todo
Scenario: I can go to agent news listing

@ao @_done @_tested
Scenario: I can go to bestsellers listing
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.complete_list_link" within "#best_sellers"
  Then I should be on the leads page
  And I should see translated "leads.index.bestsellers_header"

@ao @_done @_tested
Scenario: I can go to latest leads listing
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.complete_list_link" within "#latest_leads"
  Then I should be on the leads page
  And I should see translated "leads.index.latest_header"


@ao @_done @done @_tested
Scenario: I can go to buyer page by clicking “CLICK HERE IF YOU ARE A BUYER”
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.buyer_link"
  Then I should be on the buyer home page


@ao @_done @done @_tested
Scenario: I can go to creation of new agent account page
  When I follow translated "home.show.view.agent"
  And I follow translated "agent_home.show.view.create_new_agent_account"
  Then I should be on agent sign up page