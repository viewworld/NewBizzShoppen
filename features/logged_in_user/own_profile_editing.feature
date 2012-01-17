@user_accounts @m1
Feature: User Account - Profile edit

  Background:
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as bob@person.com with password supersecret
    And I go to my profile

 @_tested @_done
  Scenario: I change my password
    Given I follow translated "password.edit.view.change_password"
    And I fill in "user_supplier_current_password" with "supersecret"
    And I fill in "user_supplier_password" with "secret"
    And I fill in "user_supplier_password_confirmation" with "secret"
    Then I press translated "password.edit.view.button_update_user"
    And I should see translated "password.update.controller.successful_update_notice"
    Given I am not sign in
    And  I sign in as bob@person.com with password secret
    And I should see translated "devise.sessions.signed_in"

  @_tested_in_rspec @_done
  Scenario: The screen name I enter have to be unique

  @_non_testable
  Scenario: I shouldn't be able to access other people profile

  @_tested @_done
  Scenario: A user must be logged on to see their account information
    Given I am not sign in
    When I go to my profile page
    Then  I should see translated "devise.failure.unauthenticated"

  @_tested @_done
  Scenario: A user should be able to update their profile
    And I fill in "user_supplier_email" with "new-email@example.com"
    And I press translated "password.edit.view.button_update_user"
    Then I should see translated "my_profile.update.controller.successful_update_notice"

  @_tested @_done
  Scenario: A user shouldn't be able to update their profile with bad data
    And I fill in "user_supplier_email" with "not-an-email"
    And I press translated "password.edit.view.button_update_user"
    Then I should see translated "activerecord.errors.messages.invalid"

  @_tested @_done
  Scenario: A logged in user shouldn't be able to create a new account
   When I go to supplier sign up
   Then I am on suppliers root
   When I go to agent sign up
   Then I am on suppliers root

  @m5 @tgn @_tested @added @_done
  Scenario: I can add to my profile company name, company registration number, ean number
    When I go to my profile page
    Then I fill in "user_supplier_company_name" with "My Company"
    And I fill in "user_supplier_vat_number" with "32543453482354"
    And I fill in "user_supplier_company_ean_number" with "Y7894D"
    When I press translated "password.edit.view.button_update_user"
    Then I should see translated "my_profile.update.controller.successful_update_notice"

  #5941
  #in user profile
  @requested @$_customer @m12 @notifications @tgn @_tested @_done
  Scenario: I can select to be notified instantly, once a day or once a week on new leads
    Given I am not sign in
    And I am on the homepage
    Given I am signed up and confirmed as user with email bobcustomer@person.com and password supersecret and role supplier
    Then I sign in as bobcustomer@person.com with password supersecret
    When I go to my profile page
    Then I choose "user_supplier_lead_notification_type_0"
    And I press translated "password.edit.view.button_update_user"
    Then I should see translated "my_profile.update.controller.successful_update_notice"

  #Log in using their fairleds account.
  #Go to their profile page
  #Clik on link to thid party login (Display facbokk, linkeid and google icons)
  #The user login and their facebook account is linked to the apporpiate sevice.
  @requested @$_all @m12 @janrain @is @_done @not_testable
  Scenario: I can link my fairleads account with Facebook/Google/Linkedin account

  @requested @$_all @m12 @janrain @is @_done @not_testable
  Scenario: I can unlink Facebook/Google/Linkedin account from my fairleads account

  @requested @$_all @m12 @janrain @is @_done @not_testable
  Scenario: Only one Facebook/Google/Linkedin account can be connected to fairleads account
    
  @m12 @$_all @is
  Scenario: I can see time zone for user

  #9509
  @m26 @requested @tgn @_done @_tested
  Scenario: As category supplier I should not see Change account to normal supplier
    Given I am not sign in
    And I have user with email category_supplier@nbs.com and role category_supplier
    And I sign in as category_supplier@nbs.com with password secret
    Then I follow translated "layout.my_profile_link"
    And I should not see translated "my_profile.edit.view.remove_category_supplier"

  #9503
  @m26 @requested @tgn @_done @_tested
  Scenario: The OK button on my profile should redirect to main page
    When I go to my profile page
    Then I press translated "password.edit.view.button_update_user"
    And I should be on the homepage