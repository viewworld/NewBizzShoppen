@user_accounts @m1
Feature: Customer signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create an account on this site

 Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is "en"

 @_tested @_done
  Scenario: User signs up with invalid data
    When I go to supplier sign up
    And I fill in the following:
      | user_supplier_email                 | invalidemail |
      | user_supplier_password              | secret       |
      | user_supplier_password_confirmation |              |
    And I press translated "supplier_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.messages.invalid"
    And I should see translated "activerecord.errors.models.user.supplier.attributes.password.confirmation"

 @_tested @_done
  Scenario: User signs up with valid data as a buyer
    Given setting for "email_verification_for_suppliers" is set to "1"
    When I go to supplier sign up
    And I fill in the following:
      | user_supplier_first_name            | Bob             |
      | user_supplier_last_name             | Taker           |
      | user_supplier_company_name          | LeadsInt Ltd    |
      | user_supplier_phone                 | 48928217272     |
      | user_supplier_screen_name           | Bob T           |
      | user_supplier_email                 | user@domain.dom |
      | user_supplier_password              | secret          |
      | user_supplier_password_confirmation | secret          |
      | user_supplier_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_supplier_address_attributes_address_line_2        | London          |
      | user_supplier_address_attributes_zip_code              | 43-270          |
      | user_supplier_address_attributes_address_line_3        | Wesley          |
    And I select "Denmark" from "user_supplier_address_attributes_country_id"
    And I choose "user_supplier_subscription_plan_id"
    And I check "user_supplier_agreement_read"
    And I press translated "supplier_accounts.new.view.button_create_account"
    Then I should see translated "flash.supplier_accounts.create.notice"
    And a confirmation message should be sent to user@domain.dom

  @_tested @_done
  Scenario: User confirms his email account
    Given setting for "email_verification_for_suppliers" is set to "1"
    Given I am signed up with email email@person.com and password secret and role supplier
    When I follow the confirmation link sent to email@person.com with role supplier
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in

  @_tested @_done
  Scenario: Signed in user clicks confirmation link again
    Given setting for "email_verification_for_suppliers" is set to "1"
    Given I am signed up and confirmed as user with email email@person.com and password secret and role supplier
    And I sign in as email@person.com with password secret
    And I should be signed in
    When I follow the confirmation link sent to email@person.com with role supplier
    Then I should see translated "activerecord.errors.messages.blank"

  @_tested @_done
  Scenario: Signed out user clicks confirmation link again
    Given setting for "email_verification_for_suppliers" is set to "1"
    Given I am signed up and confirmed as user with email email@person.com and password secret and role supplier
    When I am not sign in
    And I follow the confirmation link sent to email@person.com with role supplier
    Then I should see translated "activerecord.errors.messages.blank"

  @tgn @m1 @_tested @added @_done
  Scenario: Newsletter checkbox should be selected by default
    When I go to supplier sign up
    Then the "user_supplier_newsletter_on" checkbox should be checked

  @tgn @m1 @_tested @_done
  Scenario: Screen name has to be unique
    Given I have user with email buyer2jimconnor@person.com and role supplier
    Then user buyer2jimconnor@person.com with role supplier exists with attributes "screen_name:Jim Connor"
    When I go to supplier sign up
    And I fill in the following:
      | user_supplier_first_name            | Bob             |
      | user_supplier_last_name             | Taker           |
      | user_supplier_company_name          | LeadsInt Ltd    |
      | user_supplier_phone                 | 48928217272     |
      | user_supplier_screen_name           | Jim Connor      |
      | user_supplier_email                 | user@domain.dom |
      | user_supplier_password              | secret          |
      | user_supplier_password_confirmation | secret          |
      | user_supplier_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_supplier_address_attributes_address_line_2        | London          |
      | user_supplier_address_attributes_zip_code              | 43-270          |
      | user_supplier_address_attributes_address_line_3        | Wesley          |
    And I select "Denmark" from "user_supplier_address_attributes_country_id"
    And I check "user_supplier_agreement_read"
    And I press translated "supplier_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.messages.taken"

  @m21 @requested @subscriptions @selenium @_done @_tested @tgn
  Scenario: Free subscription doesn't allow to create deals but user can buy leads
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I should not see translated "deals.common.listing.view.new_deal"
    When subscription plan exists with attributes "name:Premium supplier,deal_maker:1,big_buyer:1,assigned_roles:supplier"
    And user with email "buyer@nbs.com" upgrades to subscription named "Premium supplier"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I follow translated "deals.common.listing.view.new_deal"
    And I fill in "deal_header" with "Templates deal test"


  @m21 @requested @subscriptions @tested_elsewhere @_done @tgn
  Scenario: When supplier is not big buyer and tries to creates the deal then the created company category will not be autobuy

  @subscriptions @m24 @tgn @selenium @_done @_tested
  Scenario: As supplier I cannot create new deals if I used my free deals limit
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper,vat_number:3947DF4738DF937824"
    And I sign in as buyer@nbs.com with password secret
    When subscription plan exists with attributes "name:Premium supplier,deal_maker:1,big_buyer:1,assigned_roles:supplier,free_period:1,free_deals_in_free_period:2"
    And user with email "buyer@nbs.com" upgrades to subscription named "Premium supplier"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    Then I press translated "supplier.deals.new.view.create_button"
    And I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    Then I press translated "supplier.deals.new.view.create_button"
    And I should not see translated "deals.common.listing.view.new_deal"

  @subscriptions @system @m24 @tgn @_done @_tested
  Scenario: Number of available free deals should decrement each time a deal is created in free period
