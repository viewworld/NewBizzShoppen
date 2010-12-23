@lead_manager @$_big_buyer @m4 @tgn  @noguess
Feature: Requested leads management for big buyer

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role customer
  And an user with role lead_buyer and email lead_buyer1@person.com exists as subaccount for customer john@doe.com
  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category
  And lead "Super printers" was requested by user "lead_buyer1@person.com" with role "lead_buyer" and is owned by user "john@doe.com"
  And lead "Ultra printers" was requested by user "lead_buyer1@person.com" with role "lead_buyer" and is owned by user "john@doe.com"
  And User john@doe.com with role customer is big buyer
  And I sign in as john@doe.com with password secret
  And I go to customers lead requests

@_tested
Scenario: I can add a given lead to my lead list
  Given I follow translated "customer.lead_requests.index.view.accept_lead_request_link"
  Then I should see translated "customer.lead_requests.index.flash.lead_request_accepted_successfully"

@_tested @selenium
Scenario: I can bulk add selected leads to my lead list
  Given I check "mark_all"
  Then I follow translated "customer.lead_requests.index.view.button_bulk_create_lead_request"
  And I should see translated "flash.bulk_lead_requests.actions.update.notice"