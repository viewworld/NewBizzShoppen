@lead_catalog @$_lead_user @m1
Feature: lead catalog - lead user- lead details

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  Then I sign in as lead_user2@person.com with password supersecret
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "creator_name:Jim Spong,price:989.39,purchase_value:7843.99,description:Public desc about printers deal"
  Given I go to browse leads
  And I follow "Computers"

@tested
Scenario: I should see created by
  Then I should see "Jim Spong"

@m0
Scenario: I should see rating % and certification level for each lead

@tested
Scenario: I should see lead header, lead price, purchase value and public description
  Then I should see "989.39"
  And I should see "7843.99"
  And I should see "Printers ultimate deal"
  And I should see "Public desc about printers deal"

@m0
Scenario: I should see hottness, novelty, exposure, clicks