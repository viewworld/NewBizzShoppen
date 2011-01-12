@shopping_cart @m2
Feature: Shopping cart core

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role customer
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "price:1000"
  And lead Monitors LCD deal exists within category Computers
  And lead Monitors LCD deal exists with attributes "price:2000"
  And lead Keyboards deal exists within category Computers
  And lead Keyboards deal exists with attributes "price:1000"
  And lead Mouses deal exists within category Computers
  And lead Mouses deal exists with attributes "price:2000"
  Then I sign in as customer@person.com with password supersecret
  And I go to browse leads
  And I follow "Computers"

@tgn @_done @_tested @selenium
Scenario: I can bulk add leads to basket
  Given I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "buyer.bulk_cart_items.create.flash.n_cart_items_added" with options "count:4"

@tgn @_done @_tested
Scenario: I can add lead to basket
  Given I fill in "search_with_keyword" with "printers"
  And I press translated "leads.index.search.search_button"
  Then I follow translated "leads.index.add_to_cart_link"
  And I should see translated "buyer.cart_items.create.flash.cart_item_creation_successful"

@tgn @_done @_tested @selenium
Scenario: I can see basket summary before I go to checkout and I can see a total for all leads to be bought
  Given I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "buyer.bulk_cart_items.create.flash.n_cart_items_added" with options "count:4"
  And I click hidden link by url regex "/^\/buyers\/cart$/"
  Then I should see "Printers ultimate deal"
  And  I should see "Monitors LCD deal"
  And  I should see "Keyboards deal"
  And I should see "Mouses deal"
  And I should see "6000"

@tgn @_done @_tested
Scenario: I can access my basket after I logout and login again
  Given I fill in "search_with_keyword" with "printers"
  And I press translated "leads.index.search.search_button"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated logout link for customer@person.com
  When I am not sign in
  Then I sign in as customer@person.com with password supersecret
  And I follow translated "layout.cart.show_cart"
  And I should see "Printers ultimate deal"