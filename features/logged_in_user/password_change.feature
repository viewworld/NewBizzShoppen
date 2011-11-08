@user_accounts @m1
Feature: Password change

Background:
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as bob@person.com with password supersecret
    And I go to my profile

Scenario: I can change my password fro the account password change page

@_tested @_done
Scenario: User can change the password only with a valid password
   And I am on my profile
   Given I follow translated "password.edit.view.change_password"
   And I fill in "user_supplier_current_password" with "newpassword"
   Then I press translated "password.edit.view.button_update_user"
   And I should see translated "activerecord.errors.messages.invalid"