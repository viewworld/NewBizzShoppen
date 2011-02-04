@lead_catalog @$_guest @m1
Feature: Leads catalogue

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am not sign in
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:Jacek Smietana,price:989.39,purchase_value:7843.99,description:Public desc about printers deal,exposures_count:887,clicks_count:17"
  And lead Faxes ultimate deal exists within category Computers
  And lead Monitors ultimate deal exists within category Computers
  And lead Cheap mouses ultimate deal exists within category Computers
  And I have user with email jim.jones@person.com and role agent
  And lead Cheap mouses ultimate deal is created by user jim.jones@person.com with role agent
  And User jim.jones@person.com with role agent is blocked
  And I go to browse leads

@_tested
Scenario: I should see an image and a description for each category
  Then I should see "Computers"

@_tested
Scenario: I can click on a category name and see a list of leads in that category
  Then I follow "Computers"
  And I should see "Printers ultimate deal"

@_tested
Scenario: I should not see any leads that belong to a user which is blocked
  Then I follow "Computers"
  And I should see "Printers ultimate deal"
  And I should not see "Cheap mouses ultimate deal"

@_tested
Scenario: I can browse leads in a given category with pagination
  Given pagination page size for leads is set to 2
  Then I follow "Computers"
  And I follow "2"

@deprecated
Scenario: I should see created by

@m4 @tgn @_tested  @added
Scenario: I should see rating % and certification level for each lead
  Given I have user with email bob@person.com and role customer
  And a lead Printers ultimate deal exists within category Computers and is bought by user bob@person.com with role customer
  And a lead "Printers ultimate deal" has good rating
  Given All leads have refreshed average ratings
  Given I go to browse leads
  And I follow "Computers"
  Then I should see "100%"
  And I should see translated "models.lead.certification.lvl0"

@_tested
Scenario: I should see lead header, lead price, purchase value and public description
  Then I follow "Computers"
  And I should see "989.39"
  And I should see "7,843.99"
  And I should see "Printers ultimate deal"
  And I should see "Public desc about printers deal"

@m4 @tgn @_tested
Scenario: I should see hottness, novelty, exposure, clicks
  When I follow "Computers"
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"


@m3 @ao @_done
Scenario: I should see currency in which lead is being sold
  When lead "Printers ultimate deal" has currency "Euro"
  And I follow "Computers"
  And I fill in "search_with_keyword" with "Printers"
  And I press translated "leads.index.search.search_button"
  And I should see "€989.39" within "table"

@m5
Scenario: When you click on a lead that you have not bought, and you are not signed up you should be given the opportunity to sign in or create a new account

@m5
Scenario: Add blurb or info text to leads listing "To view lead details click buy lead"
