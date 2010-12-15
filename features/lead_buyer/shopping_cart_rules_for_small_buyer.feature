@shopping_cart @$_buyer @m4
Feature: Shopping cart rules for small buyer

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given Category named "Computers" already exists
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"
  And Lead named "Super printers" exists within "Another sample category" category
  And Lead named "Ultra printers" exists within "Another sample category" category
  And Lead named "Keyboards deal" exists within "Another sample category" category
  And Lead named "Ultra new printers" exists within "Computers" category
  Given I am signed up and confirmed as user with email john@doe.com and password secret and role customer
  And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
  And lead "Keyboards deal" was requested by user "lead_user2@person.com" with role "lead_user" and is owned by user "john@doe.com"
  And I sign in as john@doe.com with password secret

@tgn @_tested
Scenario: I cannot buy a lead skipping checkout
  Given I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should not see "Ultra new printers" within ".leads_table"

Scenario: I can buy lead through checkout

@tgn @_tested
Scenario: Lead purchase is not marked with "has access" after creation
  Given I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should not see "Ultra new printers" within ".leads_table"

Scenario: Invoice is auto-created if a new paypal transaction (payment for cart content has been confirmed) is created in the system

@tgn @_tested
Scenario: I can add to cart lead requested by lead user that belongs to my account
  When I go to customers lead requests
  Then I follow translated "customer.lead_requests.index.view.accept_lead_request_link"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should not see "Keyboards deal" within ".leads_table"

@tgn @_tested @selenium
Scenario: I can bulk add to cart leads requested by lead user that belongs to my account
  When I go to customers lead requests
  Then I check "mark_all"
  And I follow translated "customer.lead_requests.index.view.button_bulk_create_lead_request"
  And I should see translated "flash.bulk_lead_requests.actions.update.notice"
