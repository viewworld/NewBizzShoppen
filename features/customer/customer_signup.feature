@user_accounts @m1
Feature: Customer signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create an account on this site

 Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is English
@_tested
  Scenario: User signs up with invalid data
    When I go to buyer sign up
    And I fill in the following:
      | user_customer_email                 | invalidemail |
      | user_customer_password              | secret       |
      | user_customer_password_confirmation |              |
    And I press translated "buyer_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.models.user/customer.attributes.email.invalid"
    And I should see translated "activerecord.errors.models.user/customer.attributes.password.confirmation"

@_tested
  Scenario: User signs up with valid data as a buyer
    When I go to buyer sign up
    And I fill in the following:
      | user_customer_first_name            | Bob             |
      | user_customer_last_name             | Taker           |
      | user_customer_phone                 | 48928217272     |
      | user_customer_screen_name           | Bob T           |
      | user_customer_email                 | user@domain.dom |
      | user_customer_password              | secret          |
      | user_customer_password_confirmation | secret          |
      | user_customer_address_attributes_street                | Sunset Blv 32   |
      | user_customer_address_attributes_city                  | London          |
      | user_customer_address_attributes_zip_code              | 43-270          |
      | user_customer_address_attributes_county                | Wesley          |
    And I select "Denmark" from "user_customer_address_attributes_country_id"
    And I check "user_customer_agreement_read"
    And I press translated "buyer_accounts.new.view.button_create_account"
    Then I should see translated "flash.buyer_accounts.actions.create.notice"
    And a confirmation message should be sent to user@domain.dom

  @_tested
  Scenario: User confirms his email account
    Given I am signed up with email email@person.com and password secret and role customer
    When I follow the confirmation link sent to email@person.com with role customer
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in

  @_tested
  Scenario: Signed in user clicks confirmation link again
    Given I am signed up and confirmed as user with email email@person.com and password secret and role customer
    And I sign in as email@person.com with password secret
    And I should be signed in
    When I follow the confirmation link sent to email@person.com with role customer
    Then I should see translated "activerecord.errors.models.user.attributes.confirmation_token.blank"

  @_tested
  Scenario: Signed out user clicks confirmation link again
    Given I am signed up and confirmed as user with email email@person.com and password secret and role customer
    When I am not sign in
    And I follow the confirmation link sent to email@person.com with role customer
    Then I should see translated "activerecord.errors.models.user.attributes.confirmation_token.blank"

  @tgn @m1 @_tested @added
  Scenario: Newsletter checkbox should be selected by default
    When I go to buyer sign up
    Then the "user_customer_newsletter_on" checkbox should be checked

  @tgn @m1 @_tested
  Scenario: Screen name has to be unique
    Given I have user with email buyer2jimconnor@person.com and role customer
    Then user buyer2jimconnor@person.com with role customer exists with attributes "screen_name:Jim Connor"
    When I go to buyer sign up
    And I fill in the following:
      | user_customer_first_name            | Bob             |
      | user_customer_last_name             | Taker           |
      | user_customer_phone                 | 48928217272     |
      | user_customer_screen_name           | Jim Connor      |
      | user_customer_email                 | user@domain.dom |
      | user_customer_password              | secret          |
      | user_customer_password_confirmation | secret          |
      | user_customer_address_attributes_street                | Sunset Blv 32   |
      | user_customer_address_attributes_city                  | London          |
      | user_customer_address_attributes_zip_code              | 43-270          |
      | user_customer_address_attributes_county                | Wesley          |
    And I select "Denmark" from "user_customer_address_attributes_country_id"
    And I check "user_customer_agreement_read"
    And I press translated "buyer_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.models.user/customer.attributes.screen_name.taken"