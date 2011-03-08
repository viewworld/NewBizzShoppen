@user_accounts @$_customer @m3 @tgn
Feature: Subaccounts management for customer

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role customer
  And user "bob@person.com" has team buyers enabled
  Then I sign in as bob@person.com with password supersecret
  And I go to customers subaccounts

@_done @not_testable @done
Scenario: I do not and cannot belong to other customer

@_tested
Scenario: I can see accounts managament tab
  When I go to customers lead requests
  Then I should see translated "layout.main_menu.customer.subaccounts"

@_tested  @noguess
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

@_tested  @noguess
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

@_tested  @noguess
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

@_tested  @noguess
Scenario: I can remove lead buyer role from lead buyer (leaving him lead user role)
  Given an user with role lead_buyer and email lead_buyer@person.com exists as subaccount for customer bob@person.com
  And I go to customers subaccounts
  Then I follow translated "customer.subaccounts.index.view.edit"
  And I uncheck "user_lead_buyer_lead_buyer_role_enabled"
  And I press translated "customer.subaccounts.edit.view.button_update"
  Then user "lead_buyer@person.com" with role "lead_user" should not have role "lead_buyer"

@_tested  @noguess
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

@_tested  @noguess
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
  And I follow "lock_selected"
  And I should see translated "flash.bulk_subaccounts_update.update.notice"
  Then I check "mark_all"
  And I follow "unlock_selected"
  And I should see translated "flash.bulk_subaccounts_update.update.notice"

@_tested
Scenario: I can sort by name, last name, department
  Given an user with role lead_buyer and email lead_buyer1@person.com exists as subaccount for customer bob@person.com
  And user lead_buyer1@person.com with role lead_buyer exists with attributes "first_name:William,last_name:Craig,department:Public Relations"
  And an user with role lead_buyer and email lead_buyer2@person.com exists as subaccount for customer bob@person.com
  And user lead_buyer2@person.com with role lead_buyer exists with attributes "first_name:Adam,last_name:McDowell,department:QA"
  And an user with role lead_user and email lead_user3@person.com exists as subaccount for customer bob@person.com
  And user lead_user3@person.com with role lead_user exists with attributes "first_name:John,last_name:Lennox,department:Development"
  And I go to customers subaccounts
  When I follow translated "customer.subaccounts.index.view.first_name_column"
  And I follow translated "customer.subaccounts.index.view.first_name_column"
  Then I should have value "William" in the css path "tr:nth-child(1) td:nth-child(3)"
  When I follow translated "customer.subaccounts.index.view.last_name_column"
  And I follow translated "customer.subaccounts.index.view.last_name_column"
  Then I should have value "McDowell" in the css path "tr:nth-child(1) td:nth-child(4)"
  When I follow translated "customer.subaccounts.index.view.department_column"
  And I follow translated "customer.subaccounts.index.view.department_column"
  Then I should have value "QA" in the css path "tr:nth-child(1) td:nth-child(5)"

@added @_tested
Scenario: I can sort by completed leads, new leads requested, num. of leads assigned last 30days, num. of leads assigned last 12months, num. of leads assigned last total
  Given an user with role lead_buyer and email lead_buyer1@person.com exists as subaccount for customer bob@person.com
  And an user with role lead_buyer and email lead_buyer2@person.com exists as subaccount for customer bob@person.com
  And an user with role lead_user and email lead_user3@person.com exists as subaccount for customer bob@person.com
  And lead Ultimate printers deal exists within category Computers
  And lead Ultimate mouses deal exists within category Computers
  And lead Ultimate mouses 2 deal exists within category Computers
  And lead "Ultimate printers deal" was requested by user "lead_buyer1@person.com" with role "lead_buyer"
  And lead "Ultimate mouses deal" was requested by user "lead_buyer1@person.com" with role "lead_buyer"
  And lead "Ultimate mouses 2 deal" was requested by user "lead_buyer2@person.com" with role "lead_buyer"
  And lead Ultimate monitors 1 exists within category Computers
  And lead Ultimate monitors 2 exists within category Computers
  And lead Ultimate monitors 3 exists within category Computers
  And lead Ultimate monitors 4 exists within category Computers
  And lead Ultimate monitors 5 exists within category Computers
  And lead Ultimate monitors 1 is bought by user bob@person.com with role customer and is assigned to user lead_buyer1@person.com with role lead_buyer
  And lead Ultimate monitors 2 is bought by user bob@person.com with role customer and is assigned to user lead_buyer1@person.com with role lead_buyer
  And lead Ultimate monitors 3 is bought by user bob@person.com with role customer and is assigned to user lead_buyer1@person.com with role lead_buyer
  And lead Ultimate monitors 5 is bought by user bob@person.com with role customer and is assigned to user lead_buyer1@person.com with role lead_buyer
  And lead Ultimate monitors 4 is bought by user bob@person.com with role customer and is assigned to user lead_user3@person.com with role lead_user
  And a lead purchase for lead "Ultimate monitors 1" by user "bob@person.com" with role "customer" exists with attributes "state:3"
  And a lead purchase for lead "Ultimate monitors 2" by user "bob@person.com" with role "customer" exists with attributes "state:3"
  And a lead purchase for lead "Ultimate monitors 3" by user "bob@person.com" with role "customer" exists with attributes "state:3"
  And a lead purchase for lead "Ultimate monitors 4" by user "bob@person.com" with role "customer" exists with attributes "state:3"
  And a lead purchase for lead "Ultimate monitors 5" by user "bob@person.com" with role "customer" exists with attributes "state:1,assigned_at:Date.today-60"
  Given all users have refreshed cache counters
  And I go to customers subaccounts
  And I follow translated "customer.subaccounts.index.view.completed_leads_column"
  And I follow translated "customer.subaccounts.index.view.completed_leads_column"
  Then I should have value "3" in the xpath path "//tr[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//td[(((count(preceding-sibling::*) + 1) = 6) and parent::*)]"
  And I follow translated "customer.subaccounts.index.view.requested_leads_column"
  And I follow translated "customer.subaccounts.index.view.requested_leads_column"
  Then I should have value "2" in the xpath path "//tr[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//td[(((count(preceding-sibling::*) + 1) = 7) and parent::*)]"
  And I follow translated "customer.subaccounts.index.view.assigned_month_ago_column"
  And I follow translated "customer.subaccounts.index.view.assigned_month_ago_column"
  Then I should have value "3" in the xpath path "//tr[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//td[(((count(preceding-sibling::*) + 1) = 8) and parent::*)]"
  And I follow translated "customer.subaccounts.index.view.assigned_year_ago_column"
  And I follow translated "customer.subaccounts.index.view.assigned_year_ago_column"
  Then I should have value "4" in the xpath path "//tr[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//td[(((count(preceding-sibling::*) + 1) = 9) and parent::*)]"
  And I follow translated "customer.subaccounts.index.view.total_leads_assigned_column"
  And I follow translated "customer.subaccounts.index.view.total_leads_assigned_column"
  Then I should have value "4" in the xpath path "//tr[(((count(preceding-sibling::*) + 1) = 1) and parent::*)]//td[(((count(preceding-sibling::*) + 1) = 10) and parent::*)]"

@_done @non_testable @added
Scenario: I can refresh the cashed values for sort by rake task

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

@added @_done
Scenario: I should not have access to subaccounts without team buyers flag
  Given I am signed up and confirmed as user with email no_flag@nbs.com and password secret and role customer
  And I sign out
  And I sign in as no_flag@nbs.com with password secret
  And I go to customers subaccounts
  Then I should see "You are not authorized"