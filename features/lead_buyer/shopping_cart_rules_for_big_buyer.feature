@shopping_cart @$_buyer @m3 @ao
Feature: Shopping cart rules for big buyer

Background:
  Given lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal has price 200
  And currency "DKK" exists with attributes "exchange_rate: 2.5"
  And lead "Printers ultimate deal" has currency "DKK"
  And I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email customer@person.com and password supersecret and role supplier
  And user "customer@person.com" has team buyers enabled
  And User customer@person.com with role supplier is big buyer
  And I sign in as customer@person.com with password supersecret

@_done
Scenario: I can buy a lead skipping checkout
  When I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  Then I should not see "Printers ultimate deal"

# cart is no longer displayed for big buyer
@_done @_deprecated
Scenario: I cannot buy lead through checkout

@_done
Scenario: Lead purchase is marked with "has access" after creation
  When I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  Then I should not see "Printers ultimate deal"
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then I should see "Printers ultimate deal"

@_done  @noguess
Scenario: I can instant-buy lead requested by lead user that belongs to my account and I will see a notification “You added lead to your list”
  When an user with role lead_user and email ann.lead_user2@person.com exists as subaccount for customer customer@person.com
  And I sign out
  And I sign in as ann.lead_user2@person.com with password secret
  When I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.request_lead"
  And I sign out
  And I sign in as customer@person.com with password supersecret
  And I follow translated "layout.main_menu.supplier.lead_requests"
  And I follow translated "supplier.lead_requests.index.view.accept_lead_request_link"
  Then I should see translated "supplier.lead_requests.index.flash.lead_request_accepted_successfully"

@selenium @_done
Scenario: I can bulk instant-buy leads and I will see a notification “You added {n} leads to your list”
  When lead Monitors ultimate deal exists within category Computers
  And I go to leads
  And I follow category "Computers"
  And I check "mark_all"
  And I press translated "leads.index.button_bulk_buy_leads"
  Then I should see translated "supplier.bulk_cart_items.create.flash.n_leads_bought" with options "count:2"
  And I should not see "Printers ultimate deal"
  And I should not see "Monitors ultimate deal"
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then I should see "Printers ultimate deal"
  And I should see "Monitors ultimate deal"

@_done
Scenario: I can instant-buy lead I will see a notification “You added lead to your list”
  And I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  Then I should see translated "supplier.cart_items.create.flash.cart_item_bought_successful"
  And I should not see "Printers ultimate deal"
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then I should see "Printers ultimate deal"

@added @m8 @ao @_done @_tested
Scenario: I can see latest bought leads at the top of the list
  When there are no leads
  And lead Number 1 ultimate deal exists within category Computers
  And I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  And lead Number 2 ultimate deal exists within category Computers
  And I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then I should see "Number 2" before "Number 1"

@selenium @_done  @noguess
Scenario: I can bulk instant-buy leads requested by lead user that belongs to my account and I will see a notification “You added {n} leads to your list”
  When lead Monitors ultimate deal exists within category Computers
  When an user with role lead_user and email ann.lead_user2@person.com exists as subaccount for customer customer@person.com
  And I sign out
  And I sign in as ann.lead_user2@person.com with password secret
  When I go to leads
  And I follow category "Computers"
  And I check "mark_all"
  And I press translated "leads.index.button_bulk_create_lead_request"
  And I sign out
  And I sign in as customer@person.com with password supersecret
  And I follow translated "layout.main_menu.supplier.lead_requests"
  And I check "mark_all"
  And I follow translated "supplier.lead_requests.index.view.button_bulk_create_lead_request"
  Then I should see translated "flash.bulk_lead_requests.update.notice"

@_done
Scenario: I can filter the list of my leads by "paid" column
  And I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
  Then I should see "Printers ultimate deal"
  When I select translated "common.yes_label" from "search_with_paid"
  And I press translated "lead_supplier.lead_purchases.index.view.search.search_button"
  Then I should not see "Printers ultimate deal"

@m5 @tgn @_tested @_done
Scenario: I should not see the cart when I'm a big buyer
  Then I should not see translated "layout.cart.cart_header" with options "count:0"

@m8 @added @tgn @_tested @_done
Scenario: I can buy leads if total cost of my purchases don't exceed the global limit
  Given big buyer purchase limit is set to 1000
  When I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  And I should see translated "supplier.cart_items.create.flash.cart_item_bought_successful"
  Then I should not see "Printers ultimate deal"

@m8 @added @tgn @_tested @_done
Scenario: I cannot buy leads if total cost of my purchases exceeds the global limit
  Given big buyer purchase limit is set to 160
  And currency "DKK" exists with attributes "exchange_rate: 2.5"
  And lead "Printers ultimate deal #2" has currency "DKK"
  And lead Printers ultimate deal #2 has price 200
  And lead Printers ultimate deal has price 200
  And a lead Printers ultimate deal #2 exists within category Leisure and is bought by user customer@person.com with role supplier
  And all prices are converted to euro
  When I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  And I should see translated "supplier.cart_items.create.flash.cart_item_big_supplier_purchase_limit_reached"
  Then I should see "Printers ultimate deal"

@m8 @added @tgn @_tested @_done
Scenario: I cannot buy leads if total cost of my purchases exceeds my personal limit but not the global one
  Given big buyer purchase limit is set to 260
  And big buyer purchase limit for user "customer@person.com" is set to 160
  And currency "DKK" exists with attributes "exchange_rate: 2.5"
  And lead "Printers ultimate deal #2" has currency "DKK"
  And lead Printers ultimate deal #2 has price 200
  And lead Printers ultimate deal has price 200
  And a lead Printers ultimate deal #2 exists within category Leisure and is bought by user customer@person.com with role supplier
  And all prices are converted to euro
  When I go to leads
  And I follow category "Computers"
  And I follow translated "leads.index.buy_lead"
  And I should see translated "supplier.cart_items.create.flash.cart_item_big_supplier_purchase_limit_reached"
  Then I should see "Printers ultimate deal"

@m13 @_requested @auto_buy @is @_done @_tested_elsewhere
Scenario: New leads from my unique categories are automatically bought when I enable auto-buy option