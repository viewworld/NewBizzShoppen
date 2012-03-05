@paypal @$_system @m4 @tgn
Feature: Automatically assigning lead purchases paid by paypal

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given Category named "Computers" already exists
  And Lead named "Super printers" exists within "Computers" category

@_tested @_done
Scenario: When I buy a lead it is automatically assigned to me
  Given I am signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role supplier
  And an user with role lead_supplier and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  Then I sign in as buyer.jim.jones@nbs.com with password secret
  And I go to browse leads
  And I follow category "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "supplier.cart.show.view.checkout_link"
  And paypal payment for user with email "buyer.jim.jones@nbs.com" and role "supplier"
  And lead named "Super printers" is owned by user "buyer.jim.jones@nbs.com" with role "supplier"

@_tested @_done
Scenario: Lead purchases are owned by topmost owner (to customer, if exists, otherwise to self)
  Given someone is signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role supplier
  And an user with role lead_supplier and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  Then I sign in as leadbuyer.jon@nbs.com with password secret
  And I go to browse leads
  And I follow category "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "supplier.cart.show.view.checkout_link"
  And paypal payment for user with email "leadbuyer.jon@nbs.com" and role "lead_supplier"
  And lead named "Super printers" is owned by user "buyer.jim.jones@nbs.com" with role "supplier"

@m8b @_requested @tgn @_tested @_done
Scenario: When team buyer with buying permissions buys a leads, then it should be assigned to him/her, not the sales manager
  Given someone is signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role supplier
  And an user with role lead_supplier and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  Then I sign in as leadbuyer.jon@nbs.com with password secret
  And I go to browse leads
  And I follow category "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "supplier.cart.show.view.checkout_link"
  And paypal payment for user with email "leadbuyer.jon@nbs.com" and role "lead_supplier"
  And lead named "Super printers" is assigned to user "leadbuyer.jon@nbs.com" with role "lead_supplier"