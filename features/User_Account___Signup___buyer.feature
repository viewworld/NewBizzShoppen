@user_accounts @m1
Feature: User Account - Signup Buyer

  In order to get access to protected sections of the site
  A guest user
  Should be able to create an account on this site

  Scenario: User signs up with invalid data
    When I go to the sign up page
    And I fill in the following:
      | Email                 | invalidemail |
      | Password              | secret       |
      | Password confirmation |               |
    And I press "Create"
    Then I should see error messages


  Scenario: User signs up with valid data as a freelancer
    Given Forum is configured
    When I go to the sign up page
    And I fill in the following:
      | Email                 | user@domain.dom |
      | Password              | password  |
      | Password confirmation | password  |
    And I press "Create"
    Then I should see "Your account has been created"
    And a confirmation message should be sent to "user@domain.dom"


  Scenario: User signs up with valid data as a buyer
    Given Forum is configured
    When I go to the sign up page
    And I fill in the following:
      | Email                 | user@domain.dom |
      | Password              | password  |
      | Password confirmation | password  |
    And I press "Create"
    Then I should see "Your account has been created"
    And a confirmation message should be sent to "user@domain.dom"

  Scenario: User confirms his email account
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should see "is active now"
    And I should see "logged in"
    And I should be signed in

  Scenario: Signed in user clicks confirmation link again
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should be signed in
    When I follow the confirmation link sent to "email@person.com"
    Then I should see "You must be logged out to access this page"
    And I should be signed in

  Scenario: Signed out user clicks confirmation link again
    Given I signed up with "email@person.com/password"
    When I follow the confirmation link sent to "email@person.com"
    Then I should be signed in
    When I sign out
    And I follow the confirmation link sent to "email@person.com"
    Then I should see "You have already activated account"
    And I should be signed out