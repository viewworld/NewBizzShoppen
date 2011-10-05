@purchase_manager @m3 @ao  @noguess
Feature: Purchase Manager signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create a Purchase Manager account

  Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is "en"

  @added @_done
  Scenario: User signs up with invalid data as a Purchase Manager
    When I go to purchase manager sign up
    And I fill in the following:
      | user_member_email                 | invalidemail |
      | user_member_password              | secret       |
      | user_member_password_confirmation |              |
    And I press translated "purchase_manager_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.messages.invalid"
    And I should see translated "activerecord.errors.models.user.member.attributes.password.confirmation"

  @added @_done
  Scenario: User signs up with valid data as a Purchase Manager
    Given setting for "email_verification_for_procurement_managers" is set to "1"
    When I go to purchase manager sign up
    And I fill in the following:
      | user_member_first_name            | Jon             |
      | user_member_last_name             | Lajoie          |
      | user_member_company_name          | LajoieInc       |
      | user_member_phone                 | 48928217272     |
      | user_member_screen_name           | Normal Guy      |
      | user_member_email                 | jon@lajoie.ca   |
      | user_member_password              | secret          |
      | user_member_password_confirmation | secret          |
      | user_member_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_member_address_attributes_address_line_2        | Montreal        |
      | user_member_address_attributes_zip_code              | 43-270          |
      | user_member_address_attributes_address_line_3        | Quebec          |
    And I select "Denmark" from "user_member_address_attributes_country_id"
    And I check "user_member_agreement_read"
    And I press translated "purchase_manager_accounts.new.view.button_create_account"
    Then I should see translated "flash.purchase_manager_accounts.create.notice"
    And a confirmation message should be sent to jon@lajoie.ca

  @added @_done
  Scenario: Purchase Manager confirms his email account
    Given setting for "email_verification_for_procurement_managers" is set to "1"
    Given I am signed up with email jon@lajoie.ca and password secret and role member
    When I follow the confirmation link sent to jon@lajoie.ca with role member
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in

  #7549
  @m19 @requested @_done @_done @tgn
  Scenario: All fields for procurment sign up must be mandatory
    When I go to purchase manager sign up
    And I select "" from "user_member_address_attributes_country_id"
    And I press translated "purchase_manager_accounts.new.view.button_create_account"
    And I should see "12" occurrences of css class "inline-errors" for tag "p"
