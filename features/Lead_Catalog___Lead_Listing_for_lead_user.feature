@lead_catalog @$_lead_user @m1
Feature: Lead Listing for lead user

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role lead_user
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And lead Printers ultimate deal exists within category Computers
  And a lead Monitors LCD deal exists within category Computers and is bought by user customer@person.com with role customer
  Then I sign in as lead_user2@person.com with password supersecret

@_tested
Scenario: Listings should not show leads that are already bought or requested within my ownership branch
  Given I go to browse leads
  And I follow "Computers"
  And I should see "Printers ultimate deal"
  And I should not see "Monitors LCD deal"
  And I follow translated "leads.index.request_lead"
  Then I go to browse leads
  And I follow "Computers"
  And I should not see "Printers ultimate deal"
  And I go to lead user lead requests
  And I should see "Printers ultimate deal"

@_tested
Scenario: I can click request lead and I will see a notification "You added lead to your requested leads list"
  Given I go to browse leads
  And I follow "Computers"
  And I follow translated "leads.index.request_lead"
  Then I should see translated "flash.lead_users.actions.create.notice"

@_tested @selenium
Scenario: I can click bulk request leads and I will see a notification “You added leads to your requested leads list”
  And lead Another Printers ultimate deal exists within category Computers
  Given I go to browse leads
  And I follow "Computers"
  Then I check "mark_all"
  Then I press translated "leads.index.button_bulk_create_lead_request"
  And I should see translated "flash.bulk_lead_requests.actions.create.notice"
  Then I go to browse leads
  And I follow "Computers"
  Then I should not see "Printers ultimate deal"
  And I should not see "Another Printers ultimate deal"

