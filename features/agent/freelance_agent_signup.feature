@user_accounts @m1 @faircalls
Feature: Freelance agent signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create an account on this site

 Background: Set English locale on the home page
   Given I am on the homepage
   Given I visit domain http://faircalls.eu
   And I make sure current locale is "en"

  @_tested @_done
  Scenario: User signs up with invalid data
    When I go to agent sign up
    And I fill in the following:
      | user_agent_email                 | invalidemail |
      | user_agent_password              | secret       |
      | user_agent_password_confirmation |              |
    And I press translated "agent_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.messages.invalid"
    And I should see translated "activerecord.errors.models.user.agent.attributes.password.confirmation"

  @_tested @_done
  Scenario: User signs up with valid data as a freelancer
    When I go to agent sign up
    And I fill in the following:
      | user_agent_first_name                                | Bob             |
      | user_agent_last_name                                 | Taker           |
      | user_agent_phone                                     | 48928217272     |
      | user_agent_email                                     | user@domain.dom |
      | user_agent_password                                  | secret          |
      | user_agent_password_confirmation                     | secret          |
      | user_agent_address_attributes_address_line_1         | Sunset Blv 32   |
      | user_agent_address_attributes_address_line_2         | London          |
      | user_agent_address_attributes_zip_code               | 43-270          |
      | user_agent_address_attributes_address_line_3         | Wesley          |
    And I select "Denmark" from "user_agent_address_attributes_country_id"
    And I check "user_agent_agreement_read"
    And I press translated "agent_accounts.new.view.button_create_account"
    Then I should see translated "flash.agent_accounts.create.notice"
    And a confirmation message should be sent to user@domain.dom

  @_tested @_done @wip
  Scenario: User signs up with valid data as a buyer
    Given setting for "email_verification_for_suppliers" is set to "1"
    When I go to supplier sign up
    And I fill in the following:
      | user_category_supplier_first_name                               | Bob             |
      | user_category_supplier_last_name                                | Taker           |
      | user_category_supplier_company_name                             | Taker Ltd       |
      | user_category_supplier_phone                                    | 48928217272     |
      | user_category_supplier_email                                    | user@domain.dom |
      | user_category_supplier_password                                 | secret          |
      | user_category_supplier_password_confirmation                    | secret          |
      | user_category_supplier_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_category_supplier_address_attributes_address_line_2        | London          |
      | user_category_supplier_address_attributes_zip_code              | 43-270          |
      | user_category_supplier_address_attributes_address_line_3        | Wesley          |
    And I select "Denmark" from "user_category_supplier_address_attributes_country_id"
    And I check "user_category_supplier_agreement_read"
    And I choose "user_category_supplier_subscription_plan_id"
    And I press translated "supplier_accounts.new.view.button_create_account"
    Then I should see translated "flash.supplier_accounts.create.notice"
    And a confirmation message should be sent to user@domain.dom

  @_tested @_done
  Scenario: User confirms his email account
    Given I am signed up with email email@person.com and password secret and role agent
    When I follow the confirmation link sent to email@person.com with role agent
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in

 @_tested @_done
  Scenario: Signed in user clicks confirmation link again
    Given I am signed up and confirmed as user with email email@person.com and password secret and role agent
    And I sign in as email@person.com with password secret
    And I should be signed in
    When I follow the confirmation link sent to email@person.com with role agent
    Then I should see translated "activerecord.errors.messages.blank"

@_tested @m1 @_done
  Scenario: Signed out user clicks confirmation link again
    Given I am signed up and confirmed as user with email email@person.com and password secret and role agent
    When I am not sign in
    And I follow the confirmation link sent to email@person.com with role agent
    Then I should see translated "activerecord.errors.messages.blank"

@tgn @m1 @_tested @added @_done
Scenario: Newsletter checkbox should be selected by default
  When I go to agent sign up
  Then the "user_agent_newsletter_on" checkbox should be checked

@tgn @m1 @_tested @_done @_deprecated
Scenario: Screen name has to be unique
#  Given I have user with email agent2jimconnor@person.com and role agent
#  Then user agent2jimconnor@person.com with role agent exists with attributes "screen_name:Jim Connor"
#  When I go to agent sign up
#  And I fill in the following:
#    | user_agent_first_name                               | Bob             |
#    | user_agent_last_name                                | Taker           |
#    | user_agent_phone                                    | 48928217272     |
#    | user_agent_screen_name                              | Jim Connor      |
#    | user_agent_email                                    | user@domain.dom |
#    | user_agent_password                                 | secret          |
#    | user_agent_password_confirmation                    | secret          |
#    | user_agent_address_attributes_address_line_1        | Sunset Blv 32   |
#    | user_agent_address_attributes_address_line_2        | London          |
#    | user_agent_address_attributes_zip_code              | 43-270          |
#    | user_agent_address_attributes_address_line_3        | Wesley          |
#  And I select "Denmark" from "user_agent_address_attributes_country_id"
#  And I check "user_agent_agreement_read"
#  And I press translated "agent_accounts.new.view.button_create_account"
#  Then I should see translated "activerecord.errors.messages.taken"

# probably it should be renamed to “Agree to Terms and conditions”, where “Terms and conditions” should be link leadin to another page or popup with terms and conditions text displayed
@ao @_requested @m7 @selenium @_done @_tested @ff5
Scenario: I can see a link to agreement when signin up
  When I go to agent sign up
  And I follow "Terms & Conditions"
  And I wait 3 second
  Then I should see "Terms & Conditions" within "#container_popup"
