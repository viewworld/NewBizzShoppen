@lead_catalog @$_lead_user @m1
Feature: Leads listing for lead user

Background: Sign in user and set English locale
  And I am not sign in
  Given lead Printers ultimate deal exists within category Computers
  And a lead Monitors LCD deal exists within category Computers and is bought by user customer@person.com with role supplier
  And I am on the homepage
  And I make sure current locale is "en"
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  Then I sign in as lead_user2@person.com with password secret

@_tested @noguess @_done
Scenario: Listings should not show leads that are already bought or requested within my ownership branch
  Given I go to browse leads
  And I follow category "Computers"
  And I should see "Printers ultimate deal"
  And I should not see "Monitors LCD deal"
  And I follow translated "leads.index.request_lead"
  Then I go to browse leads
  And I follow category "Computers"
  And I should not see "Printers ultimate deal"
  And I go to lead user lead requests
  And I should see "Printers ultimate deal"

@_tested @noguess @_done
Scenario: I can click request lead and I will see a notification "You added lead to your requested leads list"
  Given I go to browse leads
  And I follow category "Computers"
  And I follow translated "leads.index.request_lead"
  Then I should see translated "flash.lead_users.create.notice"

@_tested @selenium @noguess @_done
Scenario: I can click bulk request leads and I will see a notification “You added leads to your requested leads list”
  And lead Another Printers ultimate deal exists within category Computers
  Given I go to browse leads
  And I follow category "Computers"
  Then I check "mark_all"
  Then I press translated "leads.index.button_bulk_create_lead_request"
  And I should see translated "flash.bulk_lead_requests.create.notice"
  Then I go to browse leads
  And I follow category "Computers"
  Then I should not see "Printers ultimate deal"
  And I should not see "Another Printers ultimate deal"

@m3 @__category_restrictions @tgn @_done @_tested @noguess @_deprecated
Scenario: I should not see categories that I have been restricted access to by customer in category listing
#  And lead Chairs ultimate deal exists within category Office
#  And lead Pipes ultimate deal exists within category Building
#  And lead AP ultimate deal exists within category Wireless Devices
#  And user "customer@person.com" with role "supplier" has interest in following categories "Office,Wireless Devices"
#  When I am not sign in
#  Then I sign in as lead_user2@person.com with password secret
#  Given I go to browse leads
#  Then I should see "Office"
#  Then I should see "Wireless Devices"
#  Then I should not see "Computers"
#  Then I should not see "Building"
 
@m3 @__category_restrictions @tgn @_done @_tested @noguess  @_deprecated
Scenario: I should not see categories that I have been restricted access to by customer in filter
#    And lead Chairs ultimate deal exists within category Office
#  And lead Pipes ultimate deal exists within category Building
#  And lead AP ultimate deal exists within category Wireless Devices
#  And user "customer@person.com" with role "supplier" has interest in following categories "Office,Wireless Devices"
#  When I am not sign in
#  Then I sign in as lead_user2@person.com with password secret
#  Given I go to browse leads
#  And I should see "Office"
#  And I should see "Wireless Devices"
#  And I should not see "Building"
#  And I should not see "Computers"

@_done @m3 @__category_restrictions @tgn @not_testable @noguess
Scenario: I should not be able to request/buy leads from categories that I have been restricted access to by customer

