@lead_catalog @$_lead_user @m1
Feature: lead catalog - lead user- lead details

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  Then I sign in as lead_user2@person.com with password supersecret
  And lead Printers ultimate deal exists within category Computers
  Given I go to browse leads
  And I follow "Computers"

@_todo
Scenario: I should see created by, rating % and certification level for each lead
  Then I can see following fields: creator_name for lead Printers ultimate deal

@_tested
Scenario: I should see lead header, lead price, purchase value and public description
  Then I can see following fields: header,price,purchase_value,description for lead Printers ultimate deal
@_wip
Scenario: I should see hottness, novelty, exposure, clicks
  Then I can see following fields: clicks for lead Printers ultimate deal

Scenario: I can see company contact

Scenario: I can email the lead if email information were provided
# popup with email form appears