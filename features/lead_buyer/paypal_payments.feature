# @paypal @$_system @m4 @tgn @_deprecated2014
# Feature: Paypal payments

#   Background:
#     Given I am on the homepage
#     And there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"
#     And I make sure current locale is "en"
#     Given Category named "Computers" already exists
#     And Lead named "Super printers" exists within "Computers" category
#     And lead "Super printers" has attributes "price:100"
#     Given I am signed up and confirmed as user with email buyer.jim.jones@nbs.com and password secret and role supplier
#     And an user with role lead_supplier and email leadbuyer.jon@nbs.com exists as subaccount for customer buyer.jim.jones@nbs.com
#     Then I sign in as buyer.jim.jones@nbs.com with password secret
#     And I go to browse leads
#     And I follow category "Computers"
#     Then I follow translated "leads.index.add_to_cart_link"
#     And I follow translated "layout.cart.show_cart"
#     Then I press translated "supplier.cart.show.view.checkout_link"

#   @_tested @_done
#   Scenario: I am redirected to paypal from cart view on checkout
#     Then I should be redirected to paypal page

#   @_tested @_done
#   Scenario: When I buy a lead it is automatically assigned to me
#     Then paypal payment for user with email "buyer.jim.jones@nbs.com" and role "supplier"
#     Then lead named "Super printers" is assigned to user "buyer.jim.jones@nbs.com" with role "supplier"

#   @_done @non_testable
#   Scenario: I can see the leads I am paying for on paypal's summary page

#     @_done @non_testable
#   Scenario: Paypal payment information is stored in the system

#     @_tested @_done
#   Scenario: Paypal payment information is linked to appropriate invoice
#     Then paypal payment for user with email "buyer.jim.jones@nbs.com" and role "supplier"
#     And last payment notification is linked to invoice

#   @_tested @_done
#   Scenario: Paypal's IPN marks all related lead purchases as paid and accessible
#     Then paypal payment for user with email "buyer.jim.jones@nbs.com" and role "supplier"
#     And lead named "Super printers" is paid and accessible for user with email "buyer.jim.jones@nbs.com" and role "supplier"

#   @_done @non_testable
#   Scenario: Data is transfererd to paypal in encrypted form

#     @tgn @m5 @added @_non_testable @_done
#   Scenario: Currency code from cart is passed to PayPal

#     # https://redmine.selleo.com/issues/5436
#   @m10 @_requested @_done @_tested
#   Scenario: When paying by payal the price should include VAT where applicable
#     Then cart for user "buyer.jim.jones@nbs.com" has VAT included in total value

#   @m10 @_requested @_done @_tested
#   Scenario: The vat amount should be visible as additional product line in paypal
#     Then cart for user "buyer.jim.jones@nbs.com" has additional line for VAT

#   @m10 @_requested @_done @_tested
#   Scenario: Total value of a cart should not include VAT rates
#     When I am on supplier cart page
#     Then I should see "2" rows in a table within "table.cart_table tbody"
#     And I should see "100.00" within "table.cart_table tbody tr.total_row"
