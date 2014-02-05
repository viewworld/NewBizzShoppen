@shopping_cart @$_buyer @m4
Feature: Shopping cart rules for small buyer

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"
    Given Category named "Computers" already exists
    Given Category named "Sample category" already exists
    Given Category named "Another sample category" already exists within category named "Sample category"
    And Lead named "Super printers" exists within "Another sample category" category
    And Lead named "Ultra printers" exists within "Another sample category" category
    And Lead named "Keyboards deal" exists within "Another sample category" category
    And Lead named "Ultra new printers" exists within "Computers" category
    Given I am signed up and confirmed as user with email john@doe.com and password secret and role supplier
    And user "john@doe.com" has team buyers enabled
    And an user with role lead_user and email lead_user2@person.com exists as subaccount for customer customer@person.com
    And lead "Keyboards deal" was requested by user "lead_user2@person.com" with role "lead_user" and is owned by user "john@doe.com"
    And I sign in as john@doe.com with password secret

  @tgn @_tested @_done
  Scenario: I cannot buy a lead skipping checkout
    Given I go to browse leads
    And I follow category "Computers"
    Then I follow translated "leads.index.add_to_cart_link"
    When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    Then I should see translated "common.nothing_to_display"

  # @tgn @_tested @_done @_deprecated2014
  # Scenario: I can buy lead through checkout
  #   And I go to browse leads
  #   And I follow category "Computers"
  #   Then I follow translated "leads.index.add_to_cart_link"
  #   And I follow translated "layout.cart.show_cart"
  #   Then I press translated "supplier.cart.show.view.checkout_link"
  #   And paypal payment for user with email "john@doe.com" and role "supplier"
  #   And lead named "Ultra new printers" is owned by user "john@doe.com" with role "supplier"

  @tgn @_tested @_done
  Scenario: Lead purchase is not marked with "has access" after creation
    Given I go to browse leads
    And I follow category "Computers"
    Then I follow translated "leads.index.add_to_cart_link"
    When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    Then I should see translated "common.nothing_to_display"

  # #after AO finishes invoicing subsystem
  # @tgn @_tested @_done @_deprecated2014
  # Scenario: Invoice is auto-created if a new paypal transaction (payment for cart content has been confirmed) is created in the system
  #   And I go to browse leads
  #   And I follow category "Computers"
  #   Then I follow translated "leads.index.add_to_cart_link"
  #   And I follow translated "layout.cart.show_cart"
  #   Then I press translated "supplier.cart.show.view.checkout_link"
  #   And paypal payment for user with email "john@doe.com" and role "supplier"
  #   Then invoice is created for user with email "john@doe.com" and role "supplier"
  #   And invoice line is created for lead "Ultra new printers" and user with email "john@doe.com" and role "supplier"

  # @tgn @_tested @added @_done @_deprecated2014
  # Scenario: Invoice is NOT created when payment notification is duplicated
  #   And I go to browse leads
  #   And I follow category "Computers"
  #   Then I follow translated "leads.index.add_to_cart_link"
  #   And I follow translated "layout.cart.show_cart"
  #   Then I press translated "supplier.cart.show.view.checkout_link"
  #   And paypal payment for user with email "john@doe.com" and role "supplier"
  #   Then invoice is created for user with email "john@doe.com" and role "supplier"
  #   And invoice line is created for lead "Ultra new printers" and user with email "john@doe.com" and role "supplier"
  #   When paypal payment for user with email "john@doe.com" and role "supplier"
  #   Then last payment notification is marked as "Duplicated"
  #   And invoices count for user with email "john@doe.com" and role "supplier" is 1

  @tgn @_tested @_done
  Scenario: I can add to cart lead requested by lead user that belongs to my account
    When I go to suppliers lead requests
    Then I follow translated "supplier.lead_requests.index.view.accept_lead_request_link"
    When I follow translated "layout.main_menu.lead_supplier.lead_purchases"
    And I should see translated "common.nothing_to_display"

  @tgn @_tested @selenium @_done
  Scenario: I can bulk add to cart leads requested by lead user that belongs to my account
    When I go to suppliers lead requests
    Then I check "mark_all"
    And I follow translated "supplier.lead_requests.index.view.button_bulk_create_lead_request"
    And I should see translated "flash.bulk_lead_requests.update.notice"

  @tgn @m5 @added @_tested @_done
  Scenario: Item cannot be added to the cart if its currency does not match items' currencies already added to the cart
    Given Category named "Super Computers" already exists
    Given Category named "Awesome Computers" already exists
    Given Lead named "Super joysticks" exists within "Super Computers" category
    And lead "Super joysticks" has currency "DKK"
    Given Lead named "Super keyboards" exists within "Awesome Computers" category
    And lead "Super keyboards" has currency "EUR"
    Then I go to browse leads
    And I follow category "Super Computers"
    Then I follow translated "leads.index.add_to_cart_link"
    And I should see translated "supplier.cart_items.create.flash.cart_item_creation_successful"
    Then I go to browse leads
    And I follow category "Awesome Computers"
    Then I follow translated "leads.index.add_to_cart_link"
    And I should see translated "supplier.cart_items.create.flash.cart_item_currencies_mismatch"
