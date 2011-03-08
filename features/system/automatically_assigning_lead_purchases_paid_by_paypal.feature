@paypal @$_system @m4 @tgn
Feature: Automatically assigning lead purchases paid by paypal

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given Category named "Computers" already exists
  And Lead named "Super printers" exists within "Computers" category

@_tested
Scenario: When I buy a lead it is automatically assigned to me
  Given I am signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role customer
  And an user with role lead_buyer and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  Then I sign in as buyer.jim.jones@nbs.com with password secret
  And I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "buyer.cart.show.view.checkout_link"
  And paypal payment for user with email "buyer.jim.jones@nbs.com" and role "customer"
  And lead named "Super printers" is owned by user "buyer.jim.jones@nbs.com" with role "customer"

@_tested
Scenario: Lead purchases are assigned to topmost owner (to customer, if exists, otherwise to self)
  Given someone is signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role customer
  And I am signed up and confirmed as user with email leadbuyer.jon@nbs.com and password secret and role lead_buyer
  And an user with role lead_buyer and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  Then I sign in as leadbuyer.jon@nbs.com with password secret
  And I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "buyer.cart.show.view.checkout_link"
  And paypal payment for user with email "leadbuyer.jon@nbs.com" and role "lead_buyer"
  And lead named "Super printers" is owned by user "buyer.jim.jones@nbs.com" with role "customer"