@user_accounts @$_admin @m2
Feature: Subaccounts administration

Background:
Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email admin_user@person.com and password supersecret and role admin
  And an user with role lead_user and email ann.lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email kirk.lead_user4@person.com exists as subaccount for customer customer@person.com
  And user customer@person.com with role customer exists with attributes "first_name:Steven,last_name:Colbert"
  And user ann.lead_user2@person.com with role lead_user exists with attributes "first_name:Ann,last_name:Stevenson,age:30"
  And user kirk.lead_user4@person.com with role lead_user exists with attributes "first_name:Kirk,last_name:Cameron,age:28"
  Then I sign in as admin_user@person.com with password supersecret
  Then I go to administration users
  Given I fill in "search_with_keyword" with "customer@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.subaccounts"

@m5 @tgn @_tested
Scenario: I can display a list of subaccounts of call centre account
  Given I am not sign in
  Given I have user with email call_centre@person.com and role call_centre
  Given I have user with email ccagent01@nbs.com and role call_centre_agent
  And user ccagent01@nbs.com with role call_centre_agent exists with attributes "first_name:Greg,last_name:Foam"
  And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre call_centre@person.com
  Given I have user with email ccagent02@nbs.com and role call_centre_agent
  And user ccagent02@nbs.com with role call_centre_agent exists with attributes "first_name:Ann,last_name:Dryan"
  And an user with role call_centre_agent and email ccagent02@nbs.com belongs to call centre call_centre@person.com
  Then I sign in as admin_user@person.com with password supersecret
  And I fill in "search_with_keyword" with "call_centre@person.com"
  And I press translated "administration.users.index.view.search_button"
  Then I follow translated "administration.users.index.view.subaccounts"
  And I should see "Foam"
  And I should see "Dryan"

@tgn @_done @_tested
Scenario: I can display a list of subaccounts of small-buyer account
  Then I should see translated "administration.users.index.view.subaccounts_for_user" with options "user_name:Steven Colbert"
  And I should see "ann.lead_user2@person.com"
  And I should see "kirk.lead_user4@person.com"
  And I should not see "customer@person.com"

@tgn @_done @_tested
Scenario: I can display a list of subaccounts of big-buyer account
  Given User customer@person.com with role customer is big buyer
  Then I go to administration users
  Given I fill in "search_with_keyword" with "customer@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.subaccounts"
  Then I should see translated "administration.users.index.view.subaccounts_for_user" with options "user_name:Steven Colbert"
  And I should see "ann.lead_user2@person.com"
  And I should see "kirk.lead_user4@person.com"
  And I should not see "customer@person.com"

@tgn @_done @_tested
Scenario: I can sort by coulmns type, Name, Last Name, email, age,
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "ann.lead_user2@person.com" in the css path "tr:nth-child(1) td:nth-child(6)"
  Given I follow translated "administration.users.index.view.first_name"
  Then I should have value "ann.lead_user2@person.com" in the css path "tr:nth-child(1) td:nth-child(6)"
  Given I follow translated "administration.users.index.view.last_name"
  Then I should have value "kirk.lead_user4@person.com" in the css path "tr:nth-child(1) td:nth-child(6)"
  Given I follow translated "administration.users.index.view.age"
  Then I should have value "kirk.lead_user4@person.com" in the css path "tr:nth-child(1) td:nth-child(6)"

@m0 @added
Scenario: I can sort by bought, created, volume sold, revenue, payout %

@tgn @_done @_tested
Scenario: I can edit a subaccount
  Then I follow translated "administration.users.index.view.edit"
  And I fill in "user_lead_user_first_name" with "Daniel"
  And I press translated "administration.users.edit.view.button_update_user"

@tgn @_done @_tested
Scenario: I can block a subaccount
  Then I follow translated "administration.users.index.view.lock"

@tgn @_done @_tested
Scenario: I can unblock a subaccount
    Then I follow translated "administration.users.index.view.lock"
    And I follow translated "administration.users.index.view.unlock"

@tgn @_done @_tested
Scenario: I can delete a subaccount
  Then I follow translated "administration.users.index.view.delete"

@tgn @_done @_tested
Scenario: I can go back to the propper page of the accounts listing
  Then I follow translated "administration.users.index.view.show_all_users"
  And I should see translated "administration.users.index.view.title"

@tgn @_done @_tested
Scenario: I can see the name of an account I am browsing the subaccounts for
  Then I should see translated "administration.users.index.view.subaccounts_for_user" with options "user_name:Steven Colbert"