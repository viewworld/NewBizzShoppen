@user_accounts @$_admin @m2
Feature: Subaccounts administration

Background:
Given I am on the homepage
  And I make sure current locale is "en"
  Given I am signed up and confirmed as user with email admin_user@person.com and password supersecret and role admin
  And an user with role lead_user and email ann.lead_user2@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_user and email kirk.lead_user4@person.com exists as subaccount for customer customer@person.com
  And user customer@person.com with role supplier exists with attributes "first_name:Steven,last_name:Colbert"
  And user ann.lead_user2@person.com with role lead_user exists with attributes "first_name:Ann,last_name:Stevenson,age:30"
  And user kirk.lead_user4@person.com with role lead_user exists with attributes "first_name:Kirk,last_name:Cameron,age:28"
  Then I sign in as admin_user@person.com with password supersecret
  Then I go to administration users
  Given I fill in "search_with_keyword" with "customer@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.subaccounts"

@m5 @tgn @_tested @_done
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
  And I follow translated "layout.main_menu.admin.users"
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
  Given User customer@person.com with role supplier is big buyer
  Then I go to administration users
  Given I fill in "search_with_keyword" with "customer@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.subaccounts"
  Then I should see translated "administration.users.index.view.subaccounts_for_user" with options "user_name:Steven Colbert"
  And I should see "ann.lead_user2@person.com"
  And I should see "kirk.lead_user4@person.com"
  And I should not see "customer@person.com"

# 4.04.11 / sort by age is deprecated / no way to set up this value in interface
@tgn @_done @_tested
Scenario: I can sort by coulmns type, email (name, last name, age are deprecated)
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "ann.lead_user2@person.com" in the css path "tr:nth-child(1) td:nth-child(6)"

@m6 @added @tgn @_tested @_done
Scenario: I can sort by bought, created, volume sold, revenue, payout %
  Given customer "customer@person.com" has no subaccounts
  And an user with role lead_supplier and email ann.lead_buyer@person.com exists as subaccount for customer customer@person.com
  And an user with role lead_supplier and email kirk.lead_buyer@person.com exists as subaccount for customer customer@person.com
  And currency "DKK" exists with attributes "exchange_rate: 2.5"
  Given a lead Super printers #1 exists within category Computers and is bought by user ann.lead_buyer@person.com with role lead_supplier
  And lead "Super printers #1" has currency "DKK"
  And a lead Super printers #2 exists within category Computers and is bought by user kirk.lead_buyer@person.com with role lead_supplier
  And lead "Super printers #2" has currency "DKK"
  And a lead Super printers #3 exists within category Computers and is bought by user kirk.lead_buyer@person.com with role lead_supplier
  And lead "Super printers #3" has currency "DKK"
  And all prices are converted to euro
  And all users have refreshed cache counters
  Then I go to administration users
  Given I fill in "search_with_keyword" with "customer@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.subaccounts"
  And I follow translated "administration.users.index.view.leads_bought"
  And I follow translated "administration.users.index.view.leads_bought"
  And I should see "kirk.lead_buyer@person.com" before "ann.lead_buyer@person.com"

  Given I have user with email call_centre028@nbs.com and role call_centre
  And an user with role call_centre_agent and email ccagent01@nbs.com belongs to call centre call_centre028@nbs.com
  And an user with role call_centre_agent and email ccagent02@nbs.com belongs to call centre call_centre028@nbs.com
  And user ccagent01@nbs.com with role call_centre_agent exists with attributes "payout:20"
  And user ccagent02@nbs.com with role call_centre_agent exists with attributes "payout:10"
  And lead Super monitors #1 is created by user ccagent01@nbs.com with role call_centre_agent
  And lead "Super monitors #1" has currency "DKK"
  And lead Super monitors #2 is created by user ccagent02@nbs.com with role call_centre_agent
  And lead "Super monitors #2" has currency "DKK"
  And lead Super monitors #3 is created by user ccagent02@nbs.com with role call_centre_agent
  And lead "Super monitors #3" has currency "DKK"
  And lead "Super monitors #1" has attributes "price:102"
  And lead "Super monitors #2" has attributes "price:100"
  And lead "Super monitors #3" has attributes "price:104.99"
  And a lead Super monitors #1 exists within category Computers and is bought by user customer@person.com with role supplier
  And a lead Super monitors #2 exists within category Computers and is bought by user customer@person.com with role supplier
  And a lead Super monitors #3 exists within category Computers and is bought by user customer@person.com with role supplier
  And all prices are converted to euro
  And all users have refreshed cache counters
  Then I go to administration users
  Given I fill in "search_with_keyword" with "call_centre028@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.subaccounts"
  And I follow translated "administration.users.index.view.leads_sold"
  And I follow translated "administration.users.index.view.leads_sold"
  Then I should see "ccagent02@nbs.com" before "ccagent01@nbs.com"
  And I follow translated "administration.users.index.view.revenue"
  And I follow translated "administration.users.index.view.revenue"
  Then I should see "ccagent02@nbs.com" before "ccagent01@nbs.com"
  And I follow translated "administration.users.index.view.payout"
  And I follow translated "administration.users.index.view.payout"
  Then I should see "ccagent01@nbs.com" before "ccagent02@nbs.com"
  And I follow translated "administration.users.index.view.leads_created"
  Then I should see "ccagent01@nbs.com" before "ccagent02@nbs.com"

@m6 @added @tgn @_done @non_testable
Scenario: I can refresh volume sold and revenue for users by rake task

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