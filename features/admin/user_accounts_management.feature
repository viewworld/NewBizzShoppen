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
  Then I should have value "aaaaaaaagent.tom.blank@paerson22.com" in the css path "tr:nth-child(1) td:nth-child(6)"
  Given I follow translated "administration.users.index.view.email"
  Then I should have value "zzzenon.tom.blank@paerson22.com" in the css path "tr:nth-child(1) td:nth-child(6)"

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

@m4 @added @agent_certification @tgn @_tested  @requested
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

@m6 @tgn @_tested
Scenario: In users listing I can see unpaid leads count
  Given I have user with email big_buyer.biz@nbs.com and role customer
  And User big_buyer.biz@nbs.com with role customer is big buyer
  And a lead Super computers #1 exists within category Computers and is bought by user big_buyer.biz@nbs.com with role customer
  And all users have refreshed cache counters
  Then I fill in "search_with_keyword" with "big_buyer.biz@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  Then I should have value "1" in the css path "tr:nth-child(1) td:nth-child(8)"

@m6 @_done @_tested @requested
Scenario: I can change category buyer to regular buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_buyer" for category "CategoryBuyerCategory"
  And I fill in "search_with_keyword" with "kategory_bajer"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  Then I should see CSS path "#category_buyer_categories"
  And I should not see CSS path "#unique_categories"
  And I should not see CSS path "#category_interests"
  When I follow translated "administration.users.edit.view.change_to_regular_buyer"
  Then I should see CSS path "#unique_categories"
  And I should see CSS path "#category_interests"
  And I should not see CSS path "#category_buyer_categories"

@m6 @added @_done @_tested  @requested
Scenario: User can login after changing his account to regular buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And Category AnotherCategory is created
  And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_buyer" for category "CategoryBuyerCategory"
  And I fill in "search_with_keyword" with "kategory_bajer"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  And I follow translated "administration.users.edit.view.change_to_regular_buyer"
  And I sign out
  And I sign in as kategory_bajer@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"
  Then I should see "AnotherCategory"
  And I should see "CategoryBuyerCategory"

@m6 @added @_done @_tested  @requested
Scenario: Subaccounts can login after changing parent to regular buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And Category AnotherCategory is created
  And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_buyer" for category "CategoryBuyerCategory"
  And an user with role lead_buyer and email sub@nbs.com exists as subaccount for customer kategory_bajer@nbs.com
  And I fill in "search_with_keyword" with "kategory_bajer"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  And I follow translated "administration.users.edit.view.change_to_regular_buyer"
  And I sign out
  And I sign in as sub@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"
  Then I should see "AnotherCategory"
  And I should see "CategoryBuyerCategory"

@m6 @added @selenium @_done @_tested @requested
Scenario: User can login after changing his account to category buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And Category AnotherCategory is created
  And I am signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
  And I fill in "search_with_keyword" with "kastomer"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And I select "AnotherCategory" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I select "Electronics" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I select "Leisure" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I select "Business" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  Then I press translated "administration.categories.edit.view.button_update"
  And I follow translated "administration.users.edit.view.change_to_category_buyer"
  And I sign out
  And I sign in as kastomer@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"
  Then I should be on category leads page for AnotherCategory

@m6 @added @selenium @_done @_tested @requested
Scenario: Subaccounts can login after changing his account to category buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And Category AnotherCategory is created
  And I am signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
  And an user with role lead_buyer and email sub@nbs.com exists as subaccount for customer kastomer@nbs.com
  And I fill in "search_with_keyword" with "kastomer"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And I select "AnotherCategory" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I select "Electronics" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I select "Leisure" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I select "Business" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  Then I press translated "administration.categories.edit.view.button_update"
  And I follow translated "administration.users.edit.view.change_to_category_buyer"
  And I sign out
  And I sign in as sub@nbs.com with password secret
  And I follow translated "layout.main_menu.shared.browse_leads"
  Then I should be on category leads page for AnotherCategory

@m6 @_done @_tested  @requested @selenium
Scenario: I can change regular buyer to category buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_buyer" for category "CategoryBuyerCategory"
  And I am signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
  And I fill in "search_with_keyword" with "kastomer"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  Then I should see CSS path "#unique_categories"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And I should see CSS path "#category_interests"
  And I select "CategoryBuyerCategory" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I press translated "administration.users.edit.view.button_update_user"
  When I follow translated "administration.users.edit.view.change_to_category_buyer"
  Then I should not see CSS path "#unique_categories"
  And I should not see CSS path "#category_interests"
  And I should see CSS path "#category_buyer_categories"

@m6 @selenium @_done @_tested  @requested
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

@m6 @added @selenium @_done @_tested  @requested
Scenario: I can't specify categories for category buyer's subaccounts
  When Category named "Basic Leads" already exists
  And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Basic Leads"
  And an user with role lead_buyer and email stiw@lajoie.ca exists as subaccount for customer jon@lajoie.ca
  And I am on administration edit user stiw@lajoie.ca
  Then I should not see CSS path "#all_categories"

@m6 @tgn @selenium @_tested
Scenario: I can configure buyer category interests when editing it
  Given I have user with email buyer2222@nbs.com and role customer
  And Category Computers is created
  And Category Laptops is created
  Then I fill in "search_with_keyword" with "buyer2222@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/administration\/users\/\d+\/edit/"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And I select "Laptops" from "all_categories_for_interests"
  And I select "Computers" from "all_categories_for_interests"
  And I follow translated "administration.categories.form.move_users_right" within "#category_interests"
  And I press translated "administration.users.edit.view.button_update_user"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And "user_customer_category_ids_" dropdown should have values "Computers,Laptops"

@m6 @tgn @selenium @_tested @requested
Scenario: I can manage user's access to unique categories as well
  Given I have user with email buyer2222@nbs.com and role customer
  And category "Computers" is unique for user with email "buyer29382.biz@nbs.com" role "customer"
  And category "Laptops" is unique for user with email "buyer29383.biz@nbs.com" role "customer"
  Then I fill in "search_with_keyword" with "buyer2222@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/administration\/users\/\d+\/edit/"
  And I select "Laptops" from "all_categories"
  And I select "Computers" from "all_categories"
  And I follow translated "administration.categories.form.move_users_right" within "#unique_categories"
  And I press translated "administration.users.edit.view.button_update_user"
  Then I fill in "search_with_keyword" with "buyer2222@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/administration\/users\/\d+\/edit/"
  And "user_customer_unique_category_ids_" dropdown should have values "Computers,Laptops"

# When editing a call centre as admin, display a list of agents that belong to that particular call centre below the form. Allow going to their edit screen.*
# Same goes for buyer/big buyer - there should be a list of team-buyers displayed*
# remove first name and last name fields in favour of company name*
@requested @m7 @_tested @tgn
Scenario: I can see a list of subaccounts and edit them when editing parent account
  Given I have user with email buyer2932biz@nbs.com and role customer
  And an user with role lead_buyer and email lead_buyer29321biz@nbs.com exists as subaccount for customer buyer2932biz@nbs.com
  And an user with role lead_user and email lead_user29322biz@nbs.com exists as subaccount for customer buyer2932biz@nbs.com
  And I go to administration users
  And I fill in "search_with_keyword" with "buyer2932biz"
  And I press translated "administration.users.index.view.search_button"
  Then I follow translated "administration.users.index.view.edit"
  And I should see translated "administration.users.edit.view.subaccounts_list"
  And I should see "lead_buyer29321biz@nbs.com"
  And I should see "lead_user29322biz@nbs.com"

# When changing from regular buyer to category buyer, system should require that buyer to have category interests assigned (that will be migrated to category buyer’s assigned  categories)
@requested @m7 @selenium @_done @_tested
Scenario: I can change buyer to category buyer only if he has interests categories
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And Category AnotherCategory is created
  And I am signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
  And I fill in "search_with_keyword" with "kastomer"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  And I follow translated "administration.users.edit.view.change_to_category_buyer"
  Then I should see translated "activerecord.attributes.user.customer.base.must_have_interests"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And I select "CategoryBuyerCategory" from "all_categories_for_interests"
  And I follow "move_right" within "#category_interests"
  And I press translated "administration.users.edit.view.button_update_user"
  And I press translated "administration.users.edit.view.button_update_user"
  Then I should be on administration users page
  And I should not see translated "activerecord.attributes.user.customer.base.must_have_interests"

@requested @m7 @_tested @tgn
Scenario: I can filter users by Call center agents
  Given I have user with email call_centre_agent01@nbs.com and role call_centre_agent
  Given I have user with email call_centre_agent02@nbs.com and role call_centre_agent
  And I go to administration users
  And I select "Call centre agent" from "search_with_role"
  And I press translated "administration.users.index.view.search_button"
  Then I should see "call_centre_agent01@nbs.com"
  And I should see "call_centre_agent02@nbs.com"
  And I should not see "bob@person.com" within "#users_table"

@ao @requested @m7 @_done @_tested
Scenario: When editing a call centre agent I can see it's name in format "fullname @ callcentername"
  Given I am signed up and confirmed as user with email kol_senter@nbs.com and password secret and role call_centre with attributes "company_name:Selleo"
  And an user with role call_centre_agent and email sab@nbs.com belongs to call centre kol_senter@nbs.com
  And I go to administration users
  And I select "Call centre agent" from "search_with_role"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  Then I should see /[\w]+ @ \w+/ within ".header_ribbon"

@ao @requested @m7 @_done @_tested
Scenario: When editing call center agent I can navigate to call center's edit page
  Given I am signed up and confirmed as user with email kol_senter@nbs.com and password secret and role call_centre with attributes "company_name:Selleo,screen_name:Opeth"
  And an user with role call_centre_agent and email sab@nbs.com belongs to call centre kol_senter@nbs.com
  And I go to administration users
  And I select "Call centre agent" from "search_with_role"
  And I fill in "search_with_keyword" with "sab@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  And I follow "Selleo" within ".header_ribbon"
  Then I should be on administration edit user for kol_senter@nbs.com

@ao @requested @m7 @_done @_tested
Scenario: When editing call center agent I can navigate to list of leads created by this agent
  Given I am signed up and confirmed as user with email kol_senter@nbs.com and password secret and role call_centre with attributes "company_name:Selleo"
  And an user with role call_centre_agent and email sab@nbs.com belongs to call centre kol_senter@nbs.com
  And lead SabKolSenterLead is created by user sab@nbs.com with role call_centre_agent
  And I go to administration users
  And I select "Call centre agent" from "search_with_role"
  And I fill in "search_with_keyword" with "sab@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  And I follow translated "administration.users.edit.view.view_created_leads"
  Then I should see "SabKolSenterLead" within "#leads"
  And I should see "2" rows in a table with headers within "#leads"

@requested @m8b @_done @_tested
Scenario: I should have 'Don't verify email address' for every user I create
  When I go to administration users
  Given I select "Buyer" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I fill in "user_customer_first_name" with "Alex"
  And I fill in "user_customer_last_name" with "Nova"
  And I fill in "user_customer_company_name" with "Selleo"
  And I fill in "user_customer_phone" with "0297272341235"
  And I fill in "user_customer_email" with "alex.nova@person.com"
  And I fill in "user_customer_screen_name" with "Alex N"
  And I fill in "user_customer_address_attributes_address_line_1" with "Typical 23"
  And I fill in "user_customer_address_attributes_address_line_2" with "Paris"
  And I fill in "user_customer_address_attributes_zip_code" with "22-232"
  And I fill in "user_customer_address_attributes_address_line_3" with "Orange"
  And I check "user_customer_skip_email_verification"
  And I fill in "user_customer_password" with "secret"
  And I fill in "user_customer_password_confirmation" with "secret"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.create.flash.user_creation_successful"

@added @m8b @_done @_tested
Scenario: I can login without confirmation when 'Don't verify email address' is checked
  When I go to administration users
  Given I select "Buyer" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I fill in "user_customer_first_name" with "Alex"
  And I fill in "user_customer_last_name" with "Nova"
  And I fill in "user_customer_company_name" with "Selleo"
  And I fill in "user_customer_phone" with "0297272341235"
  And I fill in "user_customer_email" with "alex.nova@person.com"
  And I fill in "user_customer_screen_name" with "Alex N"
  And I fill in "user_customer_address_attributes_address_line_1" with "Typical 23"
  And I fill in "user_customer_address_attributes_address_line_2" with "Paris"
  And I fill in "user_customer_address_attributes_zip_code" with "22-232"
  And I fill in "user_customer_address_attributes_address_line_3" with "Orange"
  And I check "user_customer_skip_email_verification"
  And I fill in "user_customer_password" with "secret"
  And I fill in "user_customer_password_confirmation" with "secret"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.create.flash.user_creation_successful"
  When I sign out
  And I am on the home page
  And I sign in as alex.nova@person.com with password secret
  Then I should see translated "devise.sessions.signed_in"

@added @m8b @_done @_tested
Scenario: I can login without confirmation when 'Don't verify email address' is checked
  Given setting for "email_verification_for_sales_managers" is set to "1"
  When I go to administration users
  Given I select "Buyer" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I fill in "user_customer_first_name" with "Alex"
  And I fill in "user_customer_last_name" with "Nova"
  And I fill in "user_customer_company_name" with "Selleo"
  And I fill in "user_customer_phone" with "0297272341235"
  And I fill in "user_customer_email" with "alex.nova@person.com"
  And I fill in "user_customer_screen_name" with "Alex N"
  And I fill in "user_customer_address_attributes_address_line_1" with "Typical 23"
  And I fill in "user_customer_address_attributes_address_line_2" with "Paris"
  And I fill in "user_customer_address_attributes_zip_code" with "22-232"
  And I fill in "user_customer_address_attributes_address_line_3" with "Orange"
  And I fill in "user_customer_password" with "secret"
  And I fill in "user_customer_password_confirmation" with "secret"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.create.flash.user_creation_successful"
  When I sign out
  And I am on the home page
  And I sign in as alex.nova@person.com with password secret
  Then I should see translated "devise.failure.unconfirmed"

@requested @m8b @_done @_tested
Scenario: I should be able to set new password for any user not just reset it
  When I go to administration edit user for bob@person.com
  And I follow translated "administration.users.edit.view.change_password_link"
  And I fill in "user_password" with "newpass"
  And I fill in "user_password_confirmation" with "newpass"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "password.flashes.successfully_changed"

@added @m8b @_done @_tested
Scenario: It should be possible for me to login using new password
  When I go to administration edit user for bob@person.com
  And I follow translated "administration.users.edit.view.change_password_link"
  And I fill in "user_password" with "newpass"
  And I fill in "user_password_confirmation" with "newpass"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "password.flashes.successfully_changed"
  When I sign out
  And I am on the home page
  And I sign in as bob@person.com with password newpass
  Then I should see translated "devise.sessions.signed_in"

@added @m8b @_done @_tested
Scenario: It should be possible for other users to login after password change
  Given someone is signed up and confirmed as user with email ejdzent@nbs.com and password secret and role agent
  And I sign out
  And I am on the home page
  And I sign in as ejdzent@nbs.com with password secret
  Then I should see translated "devise.sessions.signed_in"
  When I sign out
  And I am on the home page
  And I sign in as bob@person.com with password supersecret
  And I am on administration edit user for ejdzent@nbs.com
  And I follow translated "administration.users.edit.view.change_password_link"
  And I fill in "user_password" with "newpass"
  And I fill in "user_password_confirmation" with "newpass"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "password.flashes.successfully_changed"
  When I sign out
  And I am on the home page
  And I sign in as ejdzent@nbs.com with password newpass
  Then I should see translated "devise.sessions.signed_in"

@requested @m8b @_done @_tested @_deprecated
Scenario: I can see company name on the users listing (in favour of dynamically displayed full name/company name)


@added @m8b @_done @_tested @_deprecated
Scenario: I can sort users by company name
#  Given someone is signed up and confirmed as user with email ejdzent@nbs.com and password secret and role agent
#  And user "ejdzent@nbs.com" with role "agent" has attributes "company_name:Abc"
#  And someone is signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
#  And user "kastomer@nbs.com" with role "customer" has attributes "company_name:Xyz"
#  And I am on administration users page
#  And I follow translated "administration.users.index.view.company_name" within "table#users_table thead"
#  Then I should see "Abc" before "Xyz"
#  When I follow translated "administration.users.index.view.company_name" within "table#users_table thead"
#  Then I should see "Xyz" before "Abc"

@added @m8b @_done @_tested
Scenario: I can search users on company name
  Given someone is signed up and confirmed as user with email ejdzent@nbs.com and password secret and role agent
  And user "ejdzent@nbs.com" with role "agent" has attributes "company_name:Abc"
  And someone is signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
  And user "kastomer@nbs.com" with role "customer" has attributes "company_name:Xyz"
  And I am on administration users page
  And I fill in "search_with_keyword" with "Abc"
  And I press translated "administration.users.index.view.search_button"
  Then I should see "Abc"
  And I should not see "Xyz"
  When I fill in "search_with_keyword" with "Xyz"
  And I press translated "administration.users.index.view.search_button"
  Then I should see "Xyz"
  And I should not see "Abc"

@requested @m8b @_done @_tested
Scenario: The header of users listing should include total number of users: 'Users: #total'
  And I am on administration users page
  Then I should see /Total:\s\d+/

@added @m9 @tgn @_tested
Scenario: When I change the certification of call centre then its agents certification should be refreshed too
  Given an user with role call_centre_agent and email ccagent01@person.com belongs to call centre call_centre1@person.com
  Then I fill in "search_with_keyword" with "call_centre1@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  And I select translated "models.lead.certification.lvl13" from "user_call_centre_certification_level"
  And I press translated "password.edit.view.button_update_user"
  And user "ccagent01@person.com" with role "call_centre_agent" has certification level 3

@m10 @requested @_done @_tested
Scenario: I can see a role name of newly created user like "New buyer account”
  When I go to administration users
  Given I select "Buyer" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I should see "New Buyer account"

@m10 @requested @_done @_tested
Scenario: I can see password fields above unique categories
  When I go to administration users
  Given I select "Agent" from "role"
  And I press translated "administration.users.index.view.new_user"
  Then I should see "Password" before "Available unique categories"

@m10 @requested @tested_elsewhere @_done @_tested
Scenario: I can see "Refresh statistics" button on users listing instead of settings page

@m10 @requested @selenium @tgn @_tested
Scenario: I can see "Set interests" button next to "Change password"
  Given I have user with email customer101@person.com and role customer
  Then I fill in "search_with_keyword" with "customer101@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  Then I should see translated "administration.users.edit.view.change_customer_interests_link"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"

@m10 @requested @tgn @_tested
Scenario: I should be redirected to edit user page after saving interests
  Given I have user with email customer101@person.com and role customer
  Then I fill in "search_with_keyword" with "customer101@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  Then I should see translated "administration.users.edit.view.change_customer_interests_link"
  And I follow translated "administration.users.edit.view.change_customer_interests_link"
  And I press translated "administration.users.edit.view.button_update_user"
  And I should be on administration edit user for customer101@person.com

@requested @m11 @_done @_tested
Scenario: When editing a user I should see the role of the user in header
  Given I have user with email customer101@person.com and role customer
  Then I fill in "search_with_keyword" with "customer101@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/users\/\d+\/edit/"
  Then I should see "Editing Buyer:"

@_done @_tested @m11 @is
Scenario: As Admin I can see Name (default Company Name, if empty then First Name + Last Name) in user listing
  Given I am on the homepage
  And I am not sign in
  Then I sign in as blazejek@gmail.com with password secret
  And I have user with email super@person.com role CategoryBuyer first_name Irek last_name Skrobis and company_name Selleo
  And I go to administration users
  Then I should see "Selleo"
  Then I should not see "Irek"
  Then I should not see "Skrobis"
  Then User with email super@person.com has blank company name
  And I go to administration users
  Then I should not see "Selleo"
  Then I should see "Irek"
  Then I should see "Skrobis"

@_bug @added @m13 @selenium @_done @_tested
Scenario: Category buyer created by admin should have buying categories assigned
  When Category named "TestingCategoryBuyer" already exists
  And I am on administration new category buyer page
  Then I fill in "user_category_buyer_first_name" with "Category"
  And I fill in "user_category_buyer_last_name" with "Buyer"
  And I fill in "user_category_buyer_company_name" with "Selleo"
  And I fill in "user_category_buyer_phone" with "0297272341235"
  And I fill in "user_category_buyer_email" with "category@buyer.fake"
  And I fill in "user_category_buyer_screen_name" with "Category Buyer"
  And I fill in "user_category_buyer_address_attributes_address_line_1" with "Typical 23"
  And I fill in "user_category_buyer_address_attributes_address_line_2" with "Paris"
  And I fill in "user_category_buyer_address_attributes_zip_code" with "22-232"
  And I fill in "user_category_buyer_address_attributes_address_line_3" with "Orange"
  And I fill in "user_category_buyer_password" with "secret"
  And I fill in "user_category_buyer_password_confirmation" with "secret"
  And I check "user_category_buyer_skip_email_verification"
  And I select "TestingCategoryBuyer" from "all_categories"
  And I follow "move_right"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.create.flash.user_creation_successful"
  When I sign out
  And I sign in as category@buyer.fake with password secret
  Then I should see "TestingCategoryBuyer"
  And I should see translated "category_home.show.view.header"
  And category "TestingCategoryBuyer" is in interests of user "category@buyer.fake" "true"

@m14 @requested @$_admin @auto_buy @tgn @_tested @_done
Scenario: When I assign unique categories to buyer I should see only categories which does not have auto-buy enabled
  Given there are no categories
  Then I have user with email nbsbuyer3483434biz@nbs.com and role customer
  Then User nbsbuyer3483434biz@nbs.com with role customer is big buyer
  Then Category Computers is created
  And category "Computers" is unique for some customers users and is not auto buy
  Then Category Phones is created
  And category "Phones" is unique for some customers users and is auto buy
  Then I fill in "search_with_keyword" with "nbsbuyer3483434biz@nbs.com"
   And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/administration\/users\/\d+\/edit/"
  And "all_categories" dropdown should have values "Computers"
  And "all_categories" dropdown should not have values "Phones"

@m14 @requested @$_admin @auto_buy @tgn @selenium @_tested @_done
Scenario: When I assign unique category to buyer the auto-buy option should be automatically enabled for that category
  Given there are no categories
  Then I have user with email new_nbsbuyer3483434biz@nbs.com and role customer
  Then User new_nbsbuyer3483434biz@nbs.com with role customer is big buyer
  Then I have user with email nbsbuyer3483434biz@nbs.com and role customer
  Then User nbsbuyer3483434biz@nbs.com with role customer is big buyer
  Then I have user with email phonesnbsbuyer3483434biz@nbs.com and role customer
  Then Category Computers is created
  And category "Computers" is unique for some customers users and is not auto buy
  Then Category Phones is created
  And category "Phones" is unique for user with email "phonesnbsbuyer3483434biz@nbs.com" role "customer"
  Then I fill in "search_with_keyword" with "new_nbsbuyer3483434biz@nbs.com"
   And I press translated "administration.users.index.view.search_button"
  And I click hidden link by url regex "/administration\/users\/\d+\/edit/"
  Then I select "Computers" from "all_categories"
  Then I follow "move_right" within "#unique_categories"
  Then I select "Phones" from "all_categories"
  Then I follow "move_right" within "#unique_categories"
  Then I press translated "administration.users.edit.view.button_update_user"
  And category named "Computers" is auto buy enabled
  And category named "Phones" is not auto buy enabled

@m14 @requested @$_admin @auto_buy @tgn @selenium @_tested @_done
Scenario: When user has unique category with auto-buy he should not be subscribed by email to that category any more
  Given there are no categories
  Then I have user with email nbsbuyer3483434biz@nbs.com and role customer
  Then User nbsbuyer3483434biz@nbs.com with role customer is big buyer
  Then Category Computers is created
  When I go to administration categories
  Then I follow translated "administration.categories.index.view.edit_link"
  Then I check "category_is_customer_unique"
  Then I select "nbsbuyer3483434biz@nbs.com" from "all_customers"
  Then I follow "move_right" within "#users_selection_customers_div"
  Then I check "category_auto_buy"
  Then I press "Save"
  Then category named "Computers" is auto buy enabled
  And category "Computers" is in interests of user "nbsbuyer3483434biz@nbs.com" "false"

@m17 @requested @log_in_as @is @_tested @_done
Scenario: I can log in as selected user
  Then I fill in "search_with_keyword" with "translator_call_centre_agent"
  Then I press translated "administration.users.index.view.search_button"
  Then I follow translated "administration.users.index.view.log_in_as"
  Then I follow translated logout link for translator_call_centre_agent@nbs.com

@m18 @category_buyer_deals @_done @_tested
Scenario: I can enable deals for each category buyer
  When I follow translated "layout.main_menu.admin.users"
  And Category CategoryBuyerCategory is created
  And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_buyer" for category "CategoryBuyerCategory"
  And I fill in "search_with_keyword" with "kategory_bajer"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  And I check "user_category_buyer_show_deals"
  Then I press "Save"
  And I sign out
  And I am on the home page
  And I sign in as kategory_bajer@nbs.com with password secret
  Then I should see CSS path "a[tab='browse_deals']"
  And I should see CSS path "a[tab='deals']"

@m18 @create_buttons @_done @_tested @tgn
Scenario: I can send welcome email to member / supplier
   Given I have user with email customer101@person.com and role customer
  Then I fill in "search_with_keyword" with "customer101@person.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.send_invitation"
  And last email sent should have been sent to recipient "customer101@person.com"