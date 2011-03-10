@user_accounts @$_call_centre @m1 @ao
Feature: User accounts management

 Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I have user with email agent.jim.connor@paerson22.com and role agent
  And I have user with email agent.tom.blank@paerson22.com and role agent
  And I have user with email aaaaaaaagent.tom.blank@paerson22.com and role agent
  And I have user with email zzzenon.tom.blank@paerson22.com and role agent
  And User agent.tom.blank@paerson22.com with role agent is blocked
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I go to administration users

 @_tested
 Scenario: I can browse users with pagination
   Given pagination per page size in model User is set to 3
   When I go to administration users
   Then I should see translated "administration.users.index.view.title"
   Then I follow "2"
   Then I should see translated "administration.users.index.view.title"
   Then I follow "1"

@_tested
 Scenario: I can sort users
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "aaaaaaaagent.tom.blank@paerson22.com" in the css path "tr:nth-child(1) td:nth-child(7)"
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "zzzenon.tom.blank@paerson22.com" in the css path "tr:nth-child(1) td:nth-child(7)"

 @_tested
 Scenario: I can filter users [...]
   Given I should see "agent.jim.connor@paerson22.com"
   And I should see "agent.tom.blank@paerson22.com"
   Then I fill in "search_with_keyword" with "agent.jim.connor@paerson22.com"
   And I press translated "administration.users.index.view.search_button"
   Then I should see "agent.jim.connor@paerson22.com"
   And I should not see "agent.tom.blank@paerson22.com"

 @_tested
 Scenario: I can reset password for a user
   When I go to administration users
   And I follow translated "administration.users.index.view.edit"
   And I follow translated "administration.users.edit.view.reset_password_link"
   Then I should see translated "administration.password.destroy.flash.password_reset_successful"
   Then a password reset message should be sent to customer_agnes@domain.dom

@_tested
 Scenario: I can set the user to blocked and to unblocked
   When I go to administration users
   And I follow translated "administration.users.index.view.lock"
   Then I follow translated "administration.users.index.view.unlock"

# what should happen to all objects that he is connected too?
# is there any case when we cant delete a user?
@_tested
 Scenario: I can delete user unless he\she doesn't have related objects (e.g. leads, purchases...)
   Given User aaaaaaaagent.tom.blank@paerson22.com with role agent has leads
   When I go to administration users
   And I follow translated "administration.users.index.view.email"
   Then I follow translated "administration.users.index.view.delete"
   And I should see translated "administration.users.destroy.flash.user_deletion_failure"
   Given I follow translated "administration.users.index.view.email"
   And I follow translated "administration.users.index.view.email"
   And I follow translated "administration.users.index.view.delete"
   Then I should see translated "administration.users.destroy.flash.user_deletion_successful"

#ommitted since blocked users cannot login anyway
 Scenario: Blocked or deleted user can not ask for password in forgot password

 @_tested
 Scenario: Deleted user shouldn't be able to login
   Given I am not sign in
   And no user exists with an email of deleted_person@domain.dom and role agent
   When I go to the homepage
   And I sign in as deleted_person@domain.dom with password secret
   Then I should see translated "devise.failure.invalid"

@m5 @tgn @_tested
Scenario: I can invoice an account
  Given I have user with email bigbuyer1@person.com and role customer
  And there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,address:USA,vat_no:123" for country "Denmark"
  And User bigbuyer1@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  Given I go to administration users
  And I click hidden translated link "administration.users.index.view.create_invoice"
  Then I press translated "administration.invoices.new.view.button_create"
  And I should see translated "administration.invoices.edit.view.form.general_information"

@m5 @tgn @selenium @_tested
Scenario: I can toggle select/deselect accounts on active page
  Then I check "mark_all"
  And I uncheck "mark_all"

@m5 @tgn @selenium @_tested
Scenario: I can perform a bulk block action
  Then I check "mark_all"
  And I follow "lock_selected"
  And I should see translated "flash.bulk_users_update.update.notice"

@m5 @noguess @tgn @_tested @selenium
Scenario: I can perform a bulk invoice action
  Given I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And user bigbuyer1@person.com with role customer exists with attributes "screen_name:John von Buyer"
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  When I go to administration users
  Then I fill in "search_with_keyword" with "bigbuyer1@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I check "mark_all"
  And I follow "invoice_selected"
  And I should see translated "flash.bulk_users_update.update.notice"
  And I go to administration upcoming invoices
  And I should not see "John von Buyer"

@m4 @added @agent_certification @tgn @_tested
Scenario: I can override the certification level of any agent or call centre
  Then I fill in "search_with_keyword" with "agent@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  And I select translated "models.lead.certification.lvl11" from "user_agent_certification_level"
  And I press translated "administration.users.edit.view.button_update_user"
  Then I should see translated "administration.users.update.flash.user_update_successful"
  Given I have user with email call_centre_348282_biz@nbs.com and role call_centre
  Then I fill in "search_with_keyword" with "call_centre_348282_biz@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  And I select translated "models.lead.certification.lvl11" from "user_call_centre_certification_level"
  And I press translated "administration.users.edit.view.button_update_user"
  Then I should see translated "administration.users.update.flash.user_update_successful"

@m6
Scenario: In users listing I can see unpaid leads count

@m6
Scenario: I can change category buyer to regular buyer

@m6
Scenario: I can change regular buyer to category buyer

@m6 @selenium @_done @_tested
Scenario: I can specify one or many categories for category buyer
  When Category named "Best Leads" already exists
  And Category named "Basic Leads" already exists
  And Category named "Worst Leads" already exists
  And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Basic Leads"
  And I am on administration edit user jon@lajoie.ca
  Then "user_category_buyer_buying_category_ids_" dropdown should have values "Basic Leads"
  When I select "Best Leads" from "all_categories"
  And I follow "move_right"
  And I select "Worst Leads" from "all_categories"
  And I follow "move_right"
  And I press translated "administration.users.edit.view.button_update_user"
  And I am on administration edit user jon@lajoie.ca
  Then "user_category_buyer_buying_category_ids_" dropdown should have values "Basic Leads,Best Leads,Worst Leads"

@m6 @added @selenium @_done @_tested
Scenario: I can't specify categories for category buyer's subaccounts
  When Category named "Basic Leads" already exists
  And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Basic Leads"
  And an user with role lead_buyer and email stiw@lajoie.ca exists as subaccount for customer jon@lajoie.ca
  And I am on administration edit user stiw@lajoie.ca
  Then I should not see CSS path "#all_categories"

@m6
Scenario: I can configure buyer category interests when editing it

@m6
Scenario: I can manage user's access to unique categories as well

