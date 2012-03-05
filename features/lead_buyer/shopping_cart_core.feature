@shopping_cart @m2
Feature: Shopping cart core

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role supplier
  And lead Printers ultimate deal exists within category Computers
  And lead Printers ultimate deal exists with attributes "price:1000,currency_id:1"
  And lead Monitors LCD deal exists within category Computers
  And lead Monitors LCD deal exists with attributes "price:2000,currency_id:1"
  And lead Keyboards deal exists within category Computers
  And lead Keyboards deal exists with attributes "price:1000,currency_id:1"
  And lead Mouses deal exists within category Computers
  And lead Mouses deal exists with attributes "price:2000,currency_id:1"
  Then I sign in as customer@person.com with password supersecret
  And I go to browse leads
  And I follow category "Computers"

@tgn @_done @_tested @selenium
Scenario: I can bulk add leads to basket
  Given I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "supplier.bulk_cart_items.create.flash.n_cart_items_added" with options "count:4"

@tgn @_done @_tested
Scenario: I can add lead to basket
  Given I fill in "search_with_keyword" with "printers"
  And I press translated "leads.index.search.search_button"
  Then I follow translated "leads.index.add_to_cart_link"
  And I should see translated "supplier.cart_items.create.flash.cart_item_creation_successful"

@tgn @_tested @added @sprint_5_corrections @_done
Scenario: I can view details of leads added to the basket
  Given I fill in "search_with_keyword" with "printers"
  And I press translated "leads.index.search.search_button"
  Then I follow translated "leads.index.add_to_cart_link"
  And I click hidden link "Printers ultimate deal"
  Then I should see translated "leads.show.view.header"
  And I should see "Printers ultimate deal"

@tgn @_done @_tested @selenium
Scenario: I can see basket summary before I go to checkout and I can see a total for all leads to be bought
  Given I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see translated "supplier.bulk_cart_items.create.flash.n_cart_items_added" with options "count:4"
  And I click hidden link by url regex "/suppliers\/cart$/"
  Then I should see "Printers ultimate deal"
  And  I should see "Monitors LCD deal"
  And  I should see "Keyboards deal"
  And I should see "Mouses deal"
  And I should see "6,000"

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

@added @ao @m6 @_done @_tested  @_requested
Scenario: I can't buy (see) a lead when sale_limit is reached
  Given there are no leads
  And I have user with email agent01@nbs.com and role agent
  And user "agent01@nbs.com" with role "agent" has attributes "certification_level:1, company_name:Xerox1"
  And I have user with email agent02@nbs.com and role agent
  And user "agent02@nbs.com" with role "agent" has attributes "certification_level:12, company_name:Xerox2"
  And I have user with email agent03@nbs.com and role agent
  Given lead Super printers #1 is created by user agent01@nbs.com with role agent
  And a lead Super printers #1 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead Super printers #1 exists with attributes "hotness_counter:0, sale_limit:1, purchase_value:5200"
  Given lead Super printers #2 is created by user agent02@nbs.com with role agent
  And a lead Super printers #2 exists within category Computers and is bought by user ultimate.buyer@nbs.com with role supplier
  And lead Super printers #2 exists with attributes "hotness_counter:0, sale_limit:2, purchase_value:5200"
  And I go to browse leads
  And I follow category "Computers"
  Then I should see "Super printers #2"
  And I should not see "Super printers #1"

#When adding a lead to cart for the first time, there should be a small popup displayed, pointing on “Cart” button with some customizable text
#(i.e. Your lead has been added to cart. Click here to checkout.) If You close it, it should no more appear for that particular user
@_requested @m8 @tgn @selenium @_tested @_done
Scenario: When adding a lead to cart for the first time, there should be a small popup displayed
  When I follow translated "leads.index.add_to_cart_link"
  Then I should see "Your lead has been added to cart."
  And I click hidden translated link "layout.cart.close_hint"
  And I am not sign in
  Then I sign in as customer@person.com with password supersecret
  And I go to browse leads
  And I follow category "Computers"
  Given I check "mark_all"
  And I press translated "leads.index.button_bulk_create_cart_item"
  Then I should see "Your lead has been added to cart."
  And I click hidden translated link "layout.cart.close_hint"