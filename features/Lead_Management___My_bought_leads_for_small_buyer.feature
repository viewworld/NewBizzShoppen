@lead_manager @$_customer @m2
Feature: Lead Management

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role customer
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email lead_user3@person.com exists as subaccount for customer customer@person.com
  And user lead_user2@person.com with role lead_user exists with attributes "screen_name:John McCoy,first_name:John,last_name:McCoy"
  And user lead_user3@person.com with role lead_user exists with attributes "screen_name:Martin Gleesse,first_name:Martin,last_name:Gleesse"
  And a lead Printers ultimate deal exists within category Computers and is bought by user customer@person.com with role customer
  And lead Keyboards deal exists within category Computers
  And lead Mouses ultimate deal exists within category Computers
  And lead Plotters ultimate deal exists within category Office
  And lead Desks ultimate deal exists within category Office
  And lead "Keyboards deal" was requested by user "lead_user2@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead "Mouses ultimate deal" was requested by user "lead_user3@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead "Plotters ultimate deal" was requested by user "lead_user2@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead "Desks ultimate deal" was requested by user "lead_user3@person.com" with role "lead_user" and is owned by user "customer@person.com"
  And lead Keyboards deal exists with attributes "creator_name:Philip Glass,price:9893.56,purchase_value:4002.21,description:Public description for keyboards"
  Then I sign in as customer@person.com with password supersecret

@tgn @done @_tested @selenium
Scenario: I can assign any of my leads to any of lead users that belong to my account
  Then I go to buyer lead purchases
  Given I select "Martin Gleesse" from "assignee_id"
  And I go to buyer lead purchases
  Then "assignee_id" should be selected for value "Martin Gleesse"

@tgn @done @_tested @selenium
Scenario: I can unassing any of my leads from lead user that belong to my account and had that lead assigned to his account
  Then I go to buyer lead purchases
  Given I select "" from "assignee_id"
  And I go to buyer lead purchases
  Then "assignee_id" should be selected for value ""

@tgn @done @_tested
Scenario: Assignment should not be possible/visible if I have not lead users associated with me
  Given I am not sign in
  Given user customer@person.com with role customer has no subaccounts
  Then I sign in as customer@person.com with password supersecret
  And I go to buyer lead purchases
  Then I should not see field "assignee_id"
  And I should not see field "bulk_assignee_id"

@tgn @done @_tested @selenium
Scenario: I can transfer assignment of any of my leads from any of lead users that belong to my account to any other lead user that belong to my account
  Then I go to buyer lead purchases
  Given I select "Martin Gleesse" from "assignee_id"
  And I go to buyer lead purchases
  Given I select "John McCoy" from "assignee_id"
  And I go to buyer lead purchases
  Then "assignee_id" should be selected for value "John McCoy"

@tgn @done @_to_test
Scenario: Requested leads listing should lack pagination

@tgn @done @_tested
Scenario: I should see who has requested each lead
  Then I go to customers lead requests
  And I should see "John McCoy"
  And I should see "Martin Gleesse"

@tgn @_tested
Scenario: I can scope down requested leads listing with filter
  Then I go to customers lead requests
  And I fill in "search_with_keyword" with "ultimate"
  And I press translated "customer.lead_requests.index.view.search.search_button"
  And I should not see "Keyboards deal"
  Then I select "Office" from "search_with_category"
  And I press translated "customer.lead_requests.index.view.search.search_button"
  And I should not see "Mouses ultimate deal"
  Then I select "John McCoy" from "search_with_requested_by"
  And I select "Denmark" from "search_with_country"
  And I press translated "customer.lead_requests.index.view.search.search_button"
  And I should not see "Desks ultimate deal"

@tgn @_tested
Scenario: I should see lead header, lead price, purchase value and public description for each requested lead
  Then I go to customers lead requests
  And I should see "Keyboards deal"
  And I should see "9893.56"
  And I should see "4002.21"
  And I should see "Public description for keyboards"

@tgn @_tested
Scenario: I should see created by and certification level for each requested lead
  Then I go to customers lead requests
  And I should see "Philip Glass"
  And I should see translated "models.lead.novelty.lvl0"

@m3
Scenario: I should see rating % for each requested lead

@tgn @done @_tested
Scenario: I can delete lead requested by lead user that belong to my account
  Then I go to customers lead requests
  And I follow translated "customer.lead_requests.index.view.reject_lead_request_link"
  Then I should see translated "customer.lead_requests.index.flash.lead_request_rejected_successfully"

#I do not know if this is not already done...
@tgn @_tested @selenium
Scenario: I can bulk delete leads requested by lead users that belong to my account
  Then I go to customers lead requests
  And I check "mark_all"
  And I press translated "customer.lead_requests.index.view.button_bulk_destroy_lead_request"
  Then I should see translated "flash.bulk_lead_requests.actions.destroy.notice"

@tgn @_todo
Scenario: I can set response deadline for lead

@tgn @_todo
Scenario: I can bulk set response deadlines for lead

@bk @_todo
Scenario: I am notified by email when dealine expires and status of lead has not changed

@m0
Scenario: I can create a comment for lead that I have access for

@bk @_todo
Scenario: I can email the lead if email information were provided

@bk @_todo
Scenario: I can send selected lead by email

@bk @_todo
Scenario: I can bulk send selected leads by email

@bk @_todo
Scenario: I can rate lead that I have access for (good, bad, fake)

@bk @_todo
Scenario: I can bulk rate leads that I have access for (good, bad, fake)

@bk @_todo
Scenario: I can set status of lead

@bk @_todo
Scenario: I can bulk set status of leads