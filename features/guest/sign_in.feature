@user_accounts @m1
Feature: Sign in

  In order to get access to protected sections of the site
  A registred user
  Should be able to login
  Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is English


  @_tested
  Scenario: A user should be able to get to the login page
    Then I should see translated "activerecord.attributes.user.email"
    And I should see translated "activerecord.attributes.user.password"
   @_tested
  Scenario: User is not signed up
    Given no user exists with an email of email@person.com and role admin
     When I sign in as email@person.com with password  password
     Then I should see translated "devise.failure.invalid"
     And I should be signed out
  @_tested
  Scenario Outline: A registered user that types in the wrong password can not login
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    When I go to the login page
    And I fill in "user_email" with "<login>"
    And I fill in "user_password" with "<password>"
    And I press translated "home.show.view.sign_in"
    Then I should see translated "devise.failure.invalid"

  Examples:
    | login | password       |
    | bob   | |
    | bbo   | supersecret    |
    | bob   | wrong-password |
  @_tested
  Scenario Outline: A registered user can login and be directed to their home page
    Given I am signed up and confirmed as user with email <login> and password <password> and role <role>
    And I sign in as <login> with password <password>

    Then I should be on "<the page>"
    Examples:
    | login           | password    | role  | the page |
    | bob@person.com  | supersecret | admin | administration root |
    | bob2@person.com | supersecret | agent | agents root |
#    | bob@person.com/supersecret | call_centre | call_centres#index
#    | bob@person.com/supersecret | call_centre_agent | call_centre_agents#index
#    | bob@person.com/supersecret | customer |  customers#index
#    | bob@person.com/supersecret | lead_buyer |  lead_buyers#index
#    | bob@person.com/supersecret | lead_user | lead_users#index
    #TODO: fill in additional namespaces for all roles when they are added later
  @_tested
  Scenario: A logged in user on the login page should just redirect to their home page
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    And I sign in as bob@person.com with password supersecret
    When I go to the login page
    Then I should be on the home page

  @_tested
  Scenario Outline: A guest should be shown the login page for protected pages
    Given I am not sign in
    When I go to "<page>"
    Then I should see translated "devise.failure.unauthenticated" with options ""

  Examples:
    | page                           |
    | administration users           |
    | administration categories      |
    | administration email templates |
    | administration settings        |
    | agents leads                   |
    | buyer interests                |
    | lead user lead purchases       |
    | customers subaccounts          |
    | my profile                     |

  @_tested
  Scenario: A guest user should not see "My profile"
    Given I am not sign in
    When I go to "the homepage"
    Then I should not see translated "layout.my_profile_link"

@tgn @m1 @_tested
Scenario: Add links present on sign in page to home login page as well (forgot password and confirmation instructions)
  Then I should see translated "home.show.view.forgotten_password_link"
  And I should see translated "home.show.view.resend_confirmation_instructions"