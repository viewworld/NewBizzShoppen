@requested @fairdeals_my_deals
Feature: My deals
  
Background:
  Given I am on the homepage
  And I visit domain http://fairdeals.eu
  Given a deal named "Abc group deal #1" exists within category "Electronics deals"
  And a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:0,discounted_price:25,social_media_description:quo vadis,deal_code:www.google.com,deal_confirmation_page:to get your deal you need to ..."
  When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
  And user with email "translator_purchase_manager@nbs.com" upgrades to subscription named "Premium member"
  Then I sign in as translator_purchase_manager@nbs.com with password secret
  Then I follow translated "layout.fairdeals.main_menu.deals"
  And I follow category "Electronics deals"
  And I follow "Abc group deal #1"
  And I follow translated "deals.index.view.contact_me"
  And I fill in "lead_hidden_description" with "my specific needs are following etc"
  And I press translated "member.leads.new.view.button_create"
  And I press translated "member.leads.show.view.ok_confirmation"
  And I follow translated "layout.fairdeals.main_menu.member.my_requests"
  And I follow translated "member.leads.index.view.edit"
  And I open page in browser


#9481
@m26 @tgn @_done @_tested
Scenario: I should see "My deals" in the menu instead of "My requests"
  Then I should see "My deals"
  And I should see "Abc group deal #1"
  And I should see "to get your deal you need to"
  And I should see "www.google.com"

#9481
@m26 @tgn @_done @_tested_elsewhere
Scenario: On deal request details page I should see header should set to deal's header

#9481
@m26 @tgn @_done @_tested_elsewhere
Scenario: On deal request details page I should see Confirmation page field and deal code

#9481
@m26
Scenario: On deal request details page I should see template forms aligned to right column - under Note field

#9506
@m26
Scenario: On deal request details page for deal with voucher enabled I should see How to reedem instructions