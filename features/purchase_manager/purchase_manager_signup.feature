@purchase_manager @m3 @ao  @noguess
Feature: Purchase Manager signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create a Purchase Manager account

  Background: Set English locale on the home page
    Given I am on the homepage
    Given I visit domain http://fairdeals.eu
    And I am on the homepage
    And I make sure current locale is "en"

  @added @_done
  Scenario: User signs up with invalid data as a Purchase Manager
    When I go to member sign up
    And I fill in the following:
      | user_member_email                 | invalidemail |
      | user_member_password              | secret       |
      | user_member_password_confirmation |              |
    And I press translated "supplier_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.messages.invalid"
    And I should see translated "activerecord.errors.models.user.member.attributes.password.confirmation"

  @added @_done
  Scenario: User signs up with valid data as a Purchase Manager
    Given setting for "email_verification_for_members" is set to "1"
    When I go to member sign up
    And I fill in the following:
      | user_member_first_name            | Jon             |
      | user_member_last_name             | Lajoie          |
      | user_member_company_name          | LajoieInc       |
      | user_member_phone                 | 48928217272     |
      | user_member_email                 | jon@lajoie.ca   |
      | user_member_password              | secret          |
      | user_member_password_confirmation | secret          |
      | user_member_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_member_address_attributes_address_line_2        | Montreal        |
      | user_member_address_attributes_zip_code              | 43-270          |
      | user_member_address_attributes_address_line_3        | Quebec          |
    And I select "Denmark" from "user_member_address_attributes_country_id"
    And I check "user_member_agreement_read"
    And I choose "user_member_subscription_plan_id"
    And I press translated "supplier_accounts.new.view.button_create_account"
    Then I should see translated "flash.member_accounts.create.notice"
    And a confirmation message should be sent to jon@lajoie.ca

  @added @_done
  Scenario: Purchase Manager confirms his email account
    Given setting for "email_verification_for_members" is set to "1"
    Given I am signed up with email jon@lajoie.ca and password secret and role member
    When I follow the confirmation link sent to jon@lajoie.ca with role member
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in

  #7549
  @m19 @_requested @_done @_done @tgn
  Scenario: All fields for procurment sign up must be mandatory
    When I go to member sign up
    And I select "" from "user_member_address_attributes_country_id"
    And I press translated "supplier_accounts.new.view.button_create_account"
    And I should see "11" occurrences of css class "inline-errors" for tag "p"

  # when on free subscription - get deal is displayed but informs that you have to upgrade - tested elsewhere
  @m21 @_requested @subscriptions @_done @_tested @tgn @selenium
  Scenario: Free subscription doesn't allow to get the deal but user can create tenders and see get deal button
    And I am on the homepage
    Given I visit domain http://fairdeals.dk
    Given user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And subscription plan exists with attributes "name:Premium supplier,deal_maker:1,big_buyer:1,assigned_roles:supplier"
    And user with email "buyer@nbs.com" upgrades to subscription named "Premium supplier"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I should see translated "deals.index.view.upgrade_subscription_to_get_deal"
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I wait 3 second
    And I should see "software components"

  #9532
  @m26 @_requested @tgn @_done @_tested
  Scenario: Remove screen name for member, use first name with company name
    When I visit domain http://fairdeals.eu
    And I follow translated "fairdeals_home.show.view.get_free_account"
    And I should not see "Screen name"

  #9532
  @m26 @_requested @tgn @_done @_tested
  Scenario: On the signup page remove region select for DK language
    When I visit domain http://fairdeals.eu
    And I follow translated "fairdeals_home.show.view.get_free_account"
    Then I should see "Region"
    Then I should see "Time zone"
    When I visit domain http://fairdeals.dk
    And I follow translated "fairdeals_home.show.view.get_free_account"
    Then I should not see "Region"
    Then I should not see "Time zone"

  #9532
  @m26 @_requested @tgn @_done @_tested_elsewhere
  Scenario: Remove timezone for DK language and set it to +1 CPH