@user_accounts @m1
Feature: Freelance agent signup

  In order to get access to protected sections of the site
  A guest user
  Should be able to create an account on this site

 Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is English

  @_tested
  Scenario: User signs up with invalid data
    When I go to agent sign up
    And I fill in the following:
      | user_agent_email                 | invalidemail |
      | user_agent_password              | secret       |
      | user_agent_password_confirmation |              |
    And I press translated "agent_accounts.new.view.button_create_account"
    Then I should see translated "activerecord.errors.models.user/agent.attributes.email.invalid"
    And I should see translated "activerecord.errors.models.user/agent.attributes.password.confirmation"

  @_tested
  Scenario: User signs up with valid data as a freelancer
    When I go to agent sign up
    And I fill in the following:
      | user_agent_first_name            | Bob             |
      | user_agent_last_name             | Taker           |
      | user_agent_phone                 | 48928217272     |
      | user_agent_screen_name           | Bob T           |
      | user_agent_email                 | user@domain.dom |
      | user_agent_password              | secret          |
      | user_agent_password_confirmation | secret          |
      | user_agent_street                | Sunset Blv 32   |
      | user_agent_city                  | London          |
      | user_agent_zip_code              | 43-270          |
      | user_agent_county                | Wesley          |
    And I select "Denmark" from "user_agent_country"
    And I check "user_agent_agreement_read"
    And I press translated "agent_accounts.new.view.button_create_account"
    Then I should see translated "flash.agent_accounts.actions.create.notice"
    And a confirmation message should be sent to "user@domain.dom"

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
      | user_customer_street                | Sunset Blv 32   |
      | user_customer_city                  | London          |
      | user_customer_zip_code              | 43-270          |
      | user_customer_county                | Wesley          |
    And I select "Denmark" from "user_customer_country"
    And I check "user_customer_agreement_read"
    And I press translated "buyer_accounts.new.view.button_create_account"
    Then I should see translated "flash.buyer_accounts.actions.create.notice"
    And a confirmation message should be sent to "user@domain.dom"

  @_tested
  Scenario: User confirms his email account
    Given I am signed up with email email@person.com and password secret and role agent
    When I follow the confirmation link sent to email@person.com with role agent
    Then I should see translated "devise.confirmations.confirmed"
    And I should see translated "layout.my_profile_link"
    And I should be signed in

 @_tested
  Scenario: Signed in user clicks confirmation link again
    Given I am signed up and confirmed as user with email email@person.com and password secret and role agent
    And I sign in as email@person.com with password secret
    And I should be signed in
    When I follow the confirmation link sent to email@person.com with role agent
    Then I should see translated "activerecord.errors.models.user.attributes.confirmation_token.blank"

@_tested
  Scenario: Signed out user clicks confirmation link again
    Given I am signed up and confirmed as user with email email@person.com and password secret and role agent
    When I am not sign in
    And I follow the confirmation link sent to email@person.com with role agent
    Then I should see translated "activerecord.errors.models.user.attributes.confirmation_token.blank"