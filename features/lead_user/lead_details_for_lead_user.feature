@lead_catalog @$_lead_user @m1
Feature: Lead details for lead user

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  Then I sign in as lead_user2@person.com with password supersecret
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:Jim Spong,price:989.39,purchase_value:7843.99,description:Public desc about printers deal,exposures_count:887,clicks_count:17"
  Given I go to browse leads
  And I follow "Computers"

@_tested
Scenario: I should see created by
  Then I should see "Jim Spong"

@m4 @tgn @_tested @added
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
  Then I should see "989.39"
  And I should see "7,843.99"
  And I should see "Printers ultimate deal"
  And I should see "Public desc about printers deal"

@m4 @tgn @_tested
Scenario: I should see hottness, novelty, exposure, clicks
  Then I should see translated "models.lead.hotness.lvl1"
  And I should see translated "models.lead.novelty.lvl0"
  And I should see "887"
  And I should see "17"

@m5 @added @lead_templates
Scenario: I can see lead template fields with public values for each lead

@m5 @added @lead_templates
Scenario: I can see only lead template fields' names (not values) for hidden fields