@user_accounts @$_customer @m3 @tgn  @xxx
Feature: Subaccounts management for customer

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role customer
  Then I sign in as bob@person.com with password supersecret
  And I go to customers subaccounts

@_not_testable
Scenario: I do not and cannot belong to other customer

@_tested
Scenario: I can see accounts managament tab
  When I go to customers lead requests
  Then I should see translated "layout.main_menu.customer.subaccounts"

@_tested
Scenario: I can add new lead buyer that belongs to my account (checkbox selected - can buy leads -- req deprecated)
  Then I follow translated "customer.subaccounts.index.view.new_lead_buyer"
  And I fill in "user_lead_buyer_first_name" with "Mark"
  And I fill in "user_lead_buyer_last_name" with "Driscoll"
  And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
  And I fill in "user_lead_buyer_password" with "secret"
  And I fill in "user_lead_buyer_password_confirmation" with "secret"
  And I press translated "customer.subaccounts.new.view.button_create"
  Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"

@_tested
Scenario: Each lead buyer added has lead user role automatically assigned
  When I have user with email lead_buyer11@person.com and role lead_buyer
  Then user "lead_buyer11@person.com" with role "lead_buyer" also has role "lead_user"

@_tested
Scenario: I can add new lead user that belongs to my account
  Then I follow translated "customer.subaccounts.index.view.new_lead_user"
  And I fill in "user_lead_user_first_name" with "Mark"
  And I fill in "user_lead_user_last_name" with "Driscoll"
  And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_user_screen_name" with "ML Driscoll"
  And I fill in "user_lead_user_password" with "secret"
  And I fill in "user_lead_user_password_confirmation" with "secret"
  And I press translated "customer.subaccounts.new.view.button_create"
  Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"

@_tested
Scenario: Lead buyer have to be activated through activation email
  When I follow translated "customer.subaccounts.index.view.new_lead_buyer"
  And I fill in "user_lead_buyer_first_name" with "Mark"
  And I fill in "user_lead_buyer_last_name" with "Driscoll"
  And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
  And I fill in "user_lead_buyer_password" with "secret"
  And I fill in "user_lead_buyer_password_confirmation" with "secret"
  And I press translated "customer.subaccounts.new.view.button_create"
  Then a confirmation message should be sent to driscoll@person.noserver.com

@_tested
Scenario: Lead user have to be activated through activation email
  When I follow translated "customer.subaccounts.index.view.new_lead_user"
  And I fill in "user_lead_user_first_name" with "Mark"
  And I fill in "user_lead_user_last_name" with "Driscoll"
  And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_user_screen_name" with "ML Driscoll"
  And I fill in "user_lead_user_password" with "secret"
  And I fill in "user_lead_user_password_confirmation" with "secret"
  And I press translated "customer.subaccounts.new.view.button_create"
  Then a confirmation message should be sent to driscoll@person.noserver.com

@_tested
Scenario: I can remove lead buyer role from lead buyer (leaving him lead user role)
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.edit"
  And I uncheck "user_lead_buyer_lead_buyer_role_enabled"
  And I press translated "customer.subaccounts.edit.view.button_update"
  Then user "lead_buyer@person.com" with role "lead_user" should not have role "lead_buyer"

@_tested
Scenario: I can remove lead buyer that belongs to my account
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.delete"
  And I should see translated "customer.subaccounts.destroy.flash.subaccount_deletion_successful"

@_tested
Scenario: I can remove lead user that belongs to my account (What happens here - exceptions?)
  Given an user with role lead_user and email lead_user@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.delete"
  And I should see translated "customer.subaccounts.destroy.flash.subaccount_deletion_successful"

@_tested
Scenario: I can edit lead buyer that belongs to my account
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.edit"
  And I fill in "user_lead_buyer_first_name" with "Bob"
  And I fill in "user_lead_buyer_last_name" with "Spark"
  And I press translated "customer.subaccounts.edit.view.button_update"
  Then I should see translated "customer.subaccounts.update.flash.subaccount_update_successful"

@_tested
Scenario: I can edit lead user that belongs to my account
  Given an user with role lead_user and email lead_user@person.com exists as subaccount for customer bob@person.com
  And go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.edit"
  And I fill in "user_lead_user_first_name" with "Bob"
  And I fill in "user_lead_user_last_name" with "Spark"
  And I press translated "customer.subaccounts.edit.view.button_update"
  Then I should see translated "customer.subaccounts.update.flash.subaccount_update_successful"

@_tested
Scenario: I can see all lead buyers/lead users that belong to my account
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And user lead_buyer@person.com with role lead_buyer exists with attributes "last_name:Clark"
  Given an user with role lead_user and email lead_user@person.com exists as subaccount for customer bob@person.com
  And user lead_user@person.com with role lead_user exists with attributes "last_name:Rovecky"
  And go to customers subaccounts
  Then I should see "Clark"
  And I should see "Rovecky"

@_tested
Scenario: I can lock lead buyer/lead user account
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.lock"
  Then I should see translated "customer.subaccounts.update.flash.subaccount_update_successful"

@_tested
Scenario: I can unlock lead buyer/lead user account
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.lock"
  And I follow translated "customer.subaccounts.index.view.unlock"
  Then I should see translated "customer.subaccounts.update.flash.subaccount_update_successful"

@_tested @selenium @bulk
Scenario: I can bulk lock/unlock lead buyer/lead user accounts
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And an user with role lead_user and email lead_user@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I check "mark_all"
  And I press translated "customer.subaccounts.index.view.button_bulk_subbaccounts_update"
  And I should see translated "flash.bulk_subaccounts_update.update.notice"
  Then I check "mark_all"
  And I select translated "customer.subaccounts.index.view.unlock" from "locked"
  And I press translated "customer.subaccounts.index.view.button_bulk_subbaccounts_update"
  And I should see translated "flash.bulk_subaccounts_update.update.notice"

Scenario: I can sort by name, last name, department, completed leads, new leads requested, num. of leads assigned last 30days, num. of leads assigned last 12months, num. of leads assigned last total
  #Given an user with role lead_buyer and email lead_buyer1@person.com exists as subaccount for customer bob@person.com
  #And an user with role lead_buyer and email lead_buyer2@person.com exists as subaccount for customer bob@person.com
  #And an user with role lead_user and email lead_user6@person.com exists as subaccount for customer bob@person.com


@_tested
Scenario: I can select pagination level from following list: 10, 25, 50, None
  Given an user with role lead_buyer and email lead_buyer1@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_buyer and email lead_buyer2@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_buyer and email lead_buyer3@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_buyer and email lead_buyer4@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_buyer and email lead_buyer5@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_user and email lead_user1@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_user and email lead_user2@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_user and email lead_user3@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_user and email lead_user4@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_user and email lead_user5@person.com exists as subaccount for customer bob@person.com
  Given an user with role lead_user and email lead_user6@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  And I follow "10"
  Then I follow "2"

@_tested
Scenario: I can browse leads assigned to one of my lead users with pagination
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And lead Ultimate printers deal is bought by user bob@person.com with role customer and is assigned to user lead_buyer@person.com with role lead_user
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.assigned_leads"
  And I should see "Ultimate printers deal"