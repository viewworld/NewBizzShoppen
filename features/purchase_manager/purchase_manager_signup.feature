@purchase_manager
Feature: Purchase Manager signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create a Purchase Manager account

  Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is English

  Scenario: User signs up with invalid data as a Purchase Manager
    When I go to purchase manager sign up
    And I fill in the following:
      | user_purchase_manager_email                 | invalidemail |
      | user_purchase_manager_password              | secret       |
      | user_purchase_manager_password_confirmation |              |
    And I press translated "purchase_manager_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.models.user/purchase_manager.attributes.email.invalid"
    And I should see translated "activerecord.errors.models.user/purchase_manager.attributes.password.confirmation"

  Scenario: User signs up with valid data as a Purchase Manager
    When I go to purchase manager sign up
    And I fill in the following:
      | user_purchase_manager_first_name            | Jon             |
      | user_purchase_manager_last_name             | Lajoie          |
      | user_purchase_manager_phone                 | 48928217272     |
      | user_purchase_manager_screen_name           | Normal Guy      |
      | user_purchase_manager_email                 | jon@lajoie.ca   |
      | user_purchase_manager_password              | secret          |
      | user_purchase_manager_password_confirmation | secret          |
      | user_purchase_manager_street                | Sunset Blv 32   |
      | user_purchase_manager_city                  | Montreal        |
      | user_purchase_manager_zip_code              | 43-270          |
      | user_purchase_manager_county                | Quebec          |
    And I select "Denmark" from "user_purchase_manager_country"
    And I check "user_purchase_manager_agreement_read"
    And I press translated "purchase_manager_accounts.new.view.button_create_account"
    Then I should see translated "flash.purchase_manager_accounts.actions.create.notice"
    And a confirmation message should be sent to jon@lajoie.ca

  Scenario: Purchase Manager confirms his email account
    Given I am signed up with email jon@lajoie.ca and password secret and role purchase_manager
    When I follow the confirmation link sent to jon@lajoie.ca with role purchase_manager
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in
