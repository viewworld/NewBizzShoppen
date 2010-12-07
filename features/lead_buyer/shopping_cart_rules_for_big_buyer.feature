@shopping_cart @$_buyer @m3 @ao
Feature: Shopping cart rules for big buyer

Background:
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email customer@person.com and password supersecret and role customer
  And User customer@person.com with role customer is big buyer
  And lead Printers ultimate deal exists within category Computers
  And I sign in as customer@person.com with password supersecret

@_done
Scenario: I can buy a lead skipping checkout
  When I go to leads
  And I follow "Computers"
  And I follow translated "leads.index.buy_lead"
  Then I should not see "Printers ultimate deal"

@_done
Scenario: I cannot buy lead through checkout
  When I go to leads
  And I follow "Computers"
  And I follow translated "leads.index.buy_lead"
  And I follow translated "layout.cart.show_cart"
  Then I should see "0.0" within ".cart"

@_done
Scenario: Lead purchase is marked with "has access" after creation
  When I go to leads
  And I follow "Computers"
  And I follow translated "leads.index.buy_lead"
  Then I should not see "Printers ultimate deal"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should see "Printers ultimate deal"

@_done
Scenario: I can instant-buy lead requested by lead user that belongs to my account and I will see a notification “You added lead to your list”
  When an user with role lead_user and email ann.lead_user2@person.com exists as subaccount for customer customer@person.com
  And I sign out
  And I sign in as ann.lead_user2@person.com with password secret
  When I go to leads
  And I follow "Computers"
  And I follow translated "leads.index.request_lead"
  And I sign out
  And I sign in as customer@person.com with password supersecret
  And I follow translated "layout.main_menu.customer.lead_requests"
  And I follow translated "customer.lead_requests.index.view.accept_lead_request_link"
  Then I should see translated "customer.lead_requests.index.flash.lead_request_accepted_successfully"

@selenium @_done
Scenario: I can bulk instant-buy leads and I will see a notification “You added {n} leads to your list”
  When lead Monitors ultimate deal exists within category Computers
  And I go to leads
  And I follow "Computers"
  And I check "mark_all"
  And I press translated "leads.index.add_to_cart_link"
  Then I should see translated "buyer.bulk_cart_items.create.flash.n_cart_items_added" with options "count:2"
  And I should not see "Printers ultimate deal"
  And I should not see "Monitors ultimate deal"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should see "Printers ultimate deal"
  And I should see "Monitors ultimate deal"

@_done
Scenario: I can instant-buy lead I will see a notification “You added lead to your list”
  And I go to leads
  And I follow "Computers"
  And I follow translated "leads.index.buy_lead"
  Then I should see translated "buyer.cart_items.create.flash.cart_item_bought_successful"
  And I should not see "Printers ultimate deal"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should see "Printers ultimate deal"

@selenium @_done
Scenario: I can bulk instant-buy leads requested by lead user that belongs to my account and I will see a notification “You added {n} leads to your list”
  When lead Monitors ultimate deal exists within category Computers
  When an user with role lead_user and email ann.lead_user2@person.com exists as subaccount for customer customer@person.com
  And I sign out
  And I sign in as ann.lead_user2@person.com with password secret
  When I go to leads
  And I follow "Computers"
  And I check "mark_all"
  And I press translated "leads.index.button_bulk_create_lead_request"
  And I sign out
  And I sign in as customer@person.com with password supersecret
  And I follow translated "layout.main_menu.customer.lead_requests"
  And I check "mark_all"
  And I press translated "customer.lead_requests.index.view.accept_lead_request_link"
  Then I should see translated "flash.bulk_lead_requests.actions.update.notice"

@_done
Scenario: I can filter the list of my leads by "paid" column
  And I go to leads
  And I follow "Computers"
  And I follow translated "leads.index.buy_lead"
  When I follow translated "layout.main_menu.lead_buyer.lead_purchases"
  Then I should see "Printers ultimate deal"
  When I select translated "common.yes_label" from "search_with_paid"
  And I press translated "lead_buyer.lead_purchases.index.view.search.search_button"
  Then I should not see "Printers ultimate deal"
