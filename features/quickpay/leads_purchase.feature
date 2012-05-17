@m34 @_requested
Feature: Leads purchase

  @_done @_tested @selenium
  Scenario: When user chooses Dankort then is redirected to Quickpay
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And lead "Printers" has currency "DKK"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow category "Computers"
    And I follow translated "leads.index.add_to_cart_buyout_link"
    And I click hidden link by url regex "/\/suppliers\/cart$/"
    And I choose "payment_type_2"
    Then I press translated "supplier.cart.show.view.checkout_link"
    Then I should be redirected to quickpay page
    Then quickpay payment for user with email "jon@lajoie.ca" and role "supplier"
    And lead named "Printers" is paid and accessible for user with email "jon@lajoie.ca" and role "supplier"

    And Lead named "Awesome printers" exists within "Computers" category
    And lead "Awesome printers" has attributes "price:100"
    And lead "Awesome printers" has currency "DKK"
    And I go to browse leads
    And I follow category "Computers"
    Then I follow translated "leads.index.add_to_cart_link"
    And I click hidden link by url regex "/\/suppliers\/cart$/"
    And I choose "payment_type_2"
    Then I press translated "supplier.cart.show.view.checkout_link"
    Then I should be redirected to quickpay page
    Then quickpay payment for user with email "jon@lajoie.ca" and role "supplier"
    Then lead named "Awesome printers" is assigned to user "jon@lajoie.ca" with role "supplier"

  @_done @_tested_elsewhere @_rspec
  Scenario: When payment notification confirms payment lead is purchased

  @_done @_tested_elsewhere @_rspec
  Scenario: Invoice is generated with appropriate transaction
