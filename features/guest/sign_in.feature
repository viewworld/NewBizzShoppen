@user_accounts @m1
Feature: Sign in

  In order to get access to protected sections of the site
  A registred user
  Should be able to login
  Background: Set English locale on the home page
    Given I am on the homepage
    And I make sure current locale is "en"


  @_tested @_done
  Scenario: A user should be able to get to the login page
    Then I should see translated "activerecord.attributes.user.email"
    And I should see translated "activerecord.attributes.user.password"

  @_tested @_done
  Scenario: User is not signed up
    Given no user exists with an email of email@person.com and role admin
     When I sign in as email@person.com with password  password
     Then I should see translated "devise.failure.invalid"
     And I should be signed out

  @_tested @_done
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

  @_tested @_done @faircalls
  Scenario Outline: A registered user can login and be directed to their home page
    Given I am signed up and confirmed as user with email <login> and password <password> and role <role>
    And user with email "<login>" is a subaccount of user with email "<parent_email>" and role "<parent_role>"
    And user with email "<login>" has logged before
    And I visit domain <domain>
    And I fill in "user_email" with "<login>"
    And I fill in "user_password" with "<password>"
    And I press translated "home.show.view.sign_in"

    Then I should be on "<the page>"

    Examples:
    | domain              | login           | password    | role              | the page              |  parent_email | parent_role |
    | http://localhost    | bob@person.com  | supersecret | admin             | the homepage          | | |
    | http://faircalls.eu | bob@person.com  | supersecret | agent             | agent home            | | |
    | http://faircalls.eu | bob@person.com  | supersecret | call_centre       | agent home            | | |
    | http://faircalls.eu | bob@person.com  | supersecret | call_centre_agent | agent home            | call_centre2121@nbs.com | call_centre |
    | http://fairdeals.eu | bob@person.com  | supersecret | member            | the homepage | | |
    | http://fairleads.eu | bob@person.com  | supersecret | supplier          | supplier home            | ||
    | http://fairleads.eu | leadbuyer@nbs.com  | secret | lead_supplier       | supplier home            |  | |
    | http://fairleads.eu | leaduser@nbs.com  | secret | lead_user            | supplier home            |  | |

  @_tested @_done
  Scenario: A logged in user on the login page should just redirect to their home page
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    And I sign in as bob@person.com with password supersecret
    When I go to the login page
    Then I should be on the home page

  @_tested @_done
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
    | supplier interests             |
    | lead user lead purchases       |
    | suppliers subaccounts          |
    | my profile                     |

  @_tested @_done
  Scenario: A guest user should not see "My profile"
    Given I am not sign in
    When I go to "the homepage"
    Then I should not see translated "layout.my_profile_link"

@tgn @m1 @_tested @_deprecated @_done
Scenario: Add links present on sign in page to home login page as well (forgot password and confirmation instructions)
#  Then I should see translated "home.show.view.forgotten_password_link"
#  And I should see translated "home.show.view.resend_confirmation_instructions"

@requested @m8b @tgn @_tested @_done
Scenario: We need a forgot password function, where the user is e-maild his password, this should be available when you enter a wrong password
  Given I am not sign in
  And I go to the homepage
  And I sign in as unknown_user@nohost.com with password none
  Then I should see "Forgot password?"

@m8b @added @tgn @_tested @_done
Scenario: I can login to fairleads as any user without password by hash key that I can create in console (suggested by developers for future debuging of live fairleads.com)
  Given I am not sign in
  And I am signed up and confirmed as user with email bob7@person.com and password supersecret and role admin
  And user with email "bob7@person.com" has login key generated
  And I login as user with email "bob7@person.com" using login key
  And I should see "Logout bob7@person.com"

@m11 @requested @is @_done @_non_testable
Scenario: I can see Facebook/Linkedin/Google icons on bottom of signing in box

#Since the user has not been loged in before he is given the following prompt:
#Hi xxx we have no fairleads account assosiated to your facebook profile, do you
#want to create a new fairleds account and link it to this facebook account
#(Facebook account namen) (Link Button)(Cancel) Or do you want to login using
#another account (Icons of facebook, linkin and googel)
  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I try to login with Facebook/Google and I have no Fairleads account associated, I should be given chance to register new or login using different FB/Google/Linkedin/Fairleads account

  @m12 @$_guest @janrain @requested @is @_done @_not_testable
  Scenario: When I try to login with Facebook/Google and I have Fairleads account for this email, then this accounts should be linked and login page should be displayed

  @m12 @$_guest @janrain @requested @is @added @_done @_not_testable
  Scenario: When I try to login with LinkedIn and I have no Fairleads account associated then the note about linking account should be displayed

  @m13 @$_guest @janrain @requested @is @$_signed_in_user @_done @_not_testable
  Scenario: After I connect the social account with an existing account I should be logged in and redirect to role home page

  @m13 @$_guest @janrain @requested @is @$_signed_in_user @_done @_tested
  Scenario: Agree to terms & conditions should be marked as required field
    Given I am not sign in
    Then I go to agent sign up
    Then I should see "Agree to Terms & Conditions*"
    Then I go to supplier sign up
    Then I should see "Agree to Terms & Conditions*"
    Then I go to member sign up
    Then I should see "Agree to Terms & Conditions*"

  @m13 @$_guest @janrain @requested @is @$_signed_in_user @_done @_tested
  Scenario: I can click cancel button when I creating new account and it redirect me to home page
    Given I am not sign in
    Then I go to agent sign up
    Then I should see translated "shared.accounts.new_account_form.button_cancel"
    Then I go to supplier sign up
    Then I should see translated "shared.accounts.new_account_form.button_cancel"
    Then I go to member sign up
    Then I should see translated "shared.accounts.new_account_form.button_cancel"

  @m13 @$_guest @janrain @requested @is @$_signed_in_user @_done @_not_testable
  Scenario: In header of the creation of new account page I can see who am I and what social account am I using right now

  #7554
  @m19 @requested @_tested @_done @tgn
  Scenario: When user confirms his account he should be redirected to his home page
    #buyer
    Given setting for "email_verification_for_suppliers" is set to "1"
    And I visit domain http://fairleads.eu
    Given I am not sign in
    Given I have not confirmed user with email buyer_not_confirmed@nbs.com and role supplier
    Then confirmation link should confirm account for buyer_not_confirmed@nbs.com
    And I should be on supplier home
    #agent
    And I visit domain http://faircalls.eu
    Given I am not sign in
    Given I have not confirmed user with email agent_not_confirmed@nbs.com and role agent
    Then confirmation link should confirm account for agent_not_confirmed@nbs.com
    And I should be on agent home
    #purchase manager deprecated
#    Given setting for "email_verification_for_members" is set to "1"
#    Given I am not sign in
#    Given I have not confirmed user with email purchase_manager_not_confirmed@nbs.com and role member
#    Then confirmation link should confirm account for purchase_manager_not_confirmed@nbs.com
#    And I should be on member home