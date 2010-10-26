@user_accounts @m1
Feature: User Account - Signin

  In order to get access to protected sections of the site
  A registred user
  Should be able to login
  Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is English


  @_done
  Scenario: A user should be able to get to the login page
    Then I should see "Email"
    And I should see "Password"
   @_done
  Scenario: User is not signed up
    Given no user exists with an email of "email@person.com"
     When I sign in as "email@person.com/password"
     Then I should see "Invalid email or password"
     And I should be signed out
  @_done
  Scenario Outline: A registered user that types in the wrong password can not login
    Given I am signed up and confirmed as "bob@person.com/supersecret"
    When I go to the login page
    And I fill in "user_email" with "<login>"
    And I fill in "user_password" with "<password>"
    And I press "Sign in"
    Then I should see "Invalid email or password"

  Examples:
    | login | password       |
    | bob   | |
    | bbo   | supersecret    |
    | bob   | wrong-password |
  @_done
  Scenario Outline: A registered user can login and be directed to their home page
    Given I am signed up and confirmed as "<login>"
    And User "<login>" has role "<role>"
    When I sign in as "<login>"

    Then I should be on "<the page>"
    Examples:
    | login | role | the page |
    | bob@person.com/supersecret | admin | users#index |
    | bob@person.com/supersecret | agent | leads#index |
#    | bob@person.com/supersecret | call_centre | call_centres#index
#    | bob@person.com/supersecret | call_centre_agent | call_centre_agents#index
#    | bob@person.com/supersecret | customer |  customers#index
#    | bob@person.com/supersecret | lead_buyer |  lead_buyers#index
#    | bob@person.com/supersecret | lead_user | lead_users#index
    #TODO: fill in additional namespaces for all roles when they are added later

  Scenario: A logged in user on the login page should just redirect to their home page
    Given I am signed up and confirmed as "bob@person.com/supersecret"
    And I sign in as "bob@person.com/supersecret"
    When I go to the login page

  Scenario Outline: A guest should be shown the login page for protected pages
    Given I am not sign in
    When I go to &amp;amp;lt;page&amp;amp;gt;
    Then I should see "Access denied"

  Examples:
    | page                     |
    | administration user page |
    | translator dashboard     |

  Scenario: A guest user should not see "My profile"
    Given I am not sign in
    When I go to "the homepage"
    Then I should not see "My profile"