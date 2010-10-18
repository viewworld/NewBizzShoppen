@user_accounts @m1
Feature: User Account - Signin

  In order to get access to protected sections of the site
  A registred user
  Should be able to login

  Scenario: A user should be able to get to the login page
    Given I am on the homepage
    When I follow "Login"
    Then I should see "Email"
    And I should see "Password"

  Scenario: User is not signed up
    Given no user exists with an email of "email@person.com"
    When I sign in as "email@person.com/password"
    Then I should see "Bad email or password"
    And I should be signed out

  Scenario Outline: A registered user that types in the wrong password can not login
    Given I am signed up and confirmed as "bob@person.com/supersecret"
    When I go to the login page
    And I fill in "Email" with "&amp;amp;lt;login&amp;amp;gt;"
    And I fill in "Password" with "&amp;amp;lt;password&amp;amp;gt;"
    And I press "Login"
    Then I should see "Bad email or password"

  Examples:
    | login | password       |
    | bob   | |
    | bbo   | supersecret    |
    | bob   | wrong-password |

  Scenario: A registered user can login and be directed to their home page
    Given I am signed up and confirmed as "bob@person.com/supersecret"
    When I sign in as "email@person.com/password"
    And I press "Login"

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