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

@tgn @tbd
Scenario: I cannot buy a lead skipping checkout
  Given I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should not see "Ultra new printers" within ".leads_table"

@tgn @tbd
Scenario: I can buy lead through checkout
  And I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "buyer.cart.show.view.checkout_link"
  And paypal payment for user with email "john@doe.com" and role "customer"
  And lead named "Ultra new printers" is owned by user "john@doe.com" with role "customer"

@tgn @tbd
Scenario: Lead purchase is not marked with "has access" after creation
  Given I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should not see "Ultra new printers" within ".leads_table"

#after AO finishes invoicing subsystem
@tgn @tbd
Scenario: Invoice is auto-created if a new paypal transaction (payment for cart content has been confirmed) is created in the system
  And I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "buyer.cart.show.view.checkout_link"
  And paypal payment for user with email "john@doe.com" and role "customer"
  Then invoice is created for user with email "john@doe.com" and role "customer"
  And invoice line is created for lead "Ultra new printers" and user with email "john@doe.com" and role "customer"

@tgn @tbd @added
Scenario: Invoice is NOT created when payment notification is duplicated
  And I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "buyer.cart.show.view.checkout_link"
  And paypal payment for user with email "john@doe.com" and role "customer"
  Then invoice is created for user with email "john@doe.com" and role "customer"
  And invoice line is created for lead "Ultra new printers" and user with email "john@doe.com" and role "customer"
  When paypal payment for user with email "john@doe.com" and role "customer"
  Then last payment notification is marked as "Duplicated"
  And invoices count for user with email "john@doe.com" and role "customer" is 1

@tgn @tbd
Scenario: I can add to cart lead requested by lead user that belongs to my account
  When I go to customers lead requests
  Then I follow translated "customer.lead_requests.index.view.accept_lead_request_link"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should not see "Keyboards deal" within ".leads_table"

@tgn @tbd @selenium
Scenario: I can bulk add to cart leads requested by lead user that belongs to my account
  When I go to customers lead requests
  Then I check "mark_all"
  And I follow translated "customer.lead_requests.index.view.button_bulk_create_lead_request"
  And I should see translated "flash.bulk_lead_requests.actions.update.notice"
