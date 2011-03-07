@paypal @$_system @m4 @tgn
Feature: Paypal payments

Background:
  Given I am on the homepage
  And there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"
  And I make sure current locale is "en"
  Given Category named "Computers" already exists
  And Lead named "Super printers" exists within "Computers" category
  Given I am signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role customer
  And an user with role lead_buyer and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
  Then I sign in as buyer.jim.jones@nbs.com with password secret
  And I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.index.add_to_cart_link"
  And I follow translated "layout.cart.show_cart"
  Then I press translated "buyer.cart.show.view.checkout_link"

@_tested
Scenario: I am redirected to paypal from cart view on checkout
  Then I should be redirected to paypal page

@_tested
Scenario: When I buy a lead it is automatically assigned to me
  Then paypal payment for user with email "buyer.jim.jones@nbs.com" and role "customer"
  Then lead named "Super printers" is assigned to user "buyer.jim.jones@nbs.com" with role "customer"

@_done @non_testable
Scenario: I can see the leads I am paying for on paypal's summary page

@_done @non_testable
Scenario: Paypal payment information is stored in the system

@_tested
Scenario: Paypal payment information is linked to appropriate invoice
  Then paypal payment for user with email "buyer.jim.jones@nbs.com" and role "customer"
  And last payment notification is linked to invoice

@_tested
Scenario: Paypal's IPN marks all related lead purchases as paid and accessible
  Then paypal payment for user with email "buyer.jim.jones@nbs.com" and role "customer"
  And lead named "Super printers" is paid and accessible for user with email "buyer.jim.jones@nbs.com" and role "customer"

@_done @non_testable
Scenario: Data is transfererd to paypal in encrypted form

@tgn @m5 @added @_non_testable @_done
Scenario: Currency code from cart is passed to PayPal
