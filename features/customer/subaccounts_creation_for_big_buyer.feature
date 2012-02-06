@user_accounts @$_big_buyer @m2
Feature: Subaccounts creation for big buyer
Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given I am signed up and confirmed as user with email customer@person.com and password supersecret and role supplier
  And user "customer@person.com" has team buyers enabled
  And User customer@person.com with role supplier is big buyer
  Then I sign in as customer@person.com with password supersecret
  Then I go to suppliers subaccounts

@tgn @_done @_tested
Scenario: I can create a lead user account
  Then I follow translated "supplier.subaccounts.index.view.new_lead_user"
  And I fill in "user_lead_user_first_name" with "Mark"
  And I fill in "user_lead_user_last_name" with "Driscoll"
  And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_user_password" with "secret"
  And I fill in "user_lead_user_password_confirmation" with "secret"
  And I press translated "supplier.subaccounts.new.view.button_create"
  Then I should see translated "supplier.subaccounts.create.flash.subaccount_creation_successful"

@tgn @_done @_tested @_deprecated
Scenario: Account have to be activated through activation email
#  Then I follow translated "supplier.subaccounts.index.view.new_lead_user"
#  And I fill in "user_lead_user_first_name" with "Mark"
#  And I fill in "user_lead_user_last_name" with "Driscoll"
#  And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
#  And I fill in "user_lead_user_password" with "secret"
#  And I fill in "user_lead_user_password_confirmation" with "secret"
#  And I press translated "supplier.subaccounts.new.view.button_create"
#  Then user driscoll@person.noserver.com with role lead_user should not be confirmed
#  And a confirmation message should be sent to driscoll@person.noserver.com
#  And a confirmation message to driscoll@person.noserver.com should include confirmation link
#  Then confirmation link should confirm account for driscoll@person.noserver.com
#  And I should see translated "devise.confirmations.confirmed"

@added @_done
Scenario: I should not have access to subaccounts without team buyers flag
  Given I am signed up and confirmed as user with email no_flag@nbs.com and password secret and role supplier
  And User no_flag@nbs.com with role supplier is big buyer
  And I sign out
  And I sign in as no_flag@nbs.com with password secret
  And I go to suppliers subaccounts
  Then I should see "You are not authorized"

@requested @m8b @tgn @_tested @_done
Scenario: The big buyer property of a customer should be inherited by all his subaccounts
  Then I follow translated "supplier.subaccounts.index.view.new_lead_supplier"
  And I fill in "user_lead_supplier_first_name" with "Mark"
  And I fill in "user_lead_supplier_last_name" with "Driscoll"
  And I fill in "user_lead_supplier_email" with "driscoll@person.noserver.com"
  And I fill in "user_lead_supplier_password" with "secret"
  And I fill in "user_lead_supplier_password_confirmation" with "secret"
  And I press translated "supplier.subaccounts.new.view.button_create"
  Then I should see translated "supplier.subaccounts.create.flash.subaccount_creation_successful"
  And user "driscoll@person.noserver.com" should be big buyer

@requested @m8b @tgn @_tested @_done
Scenario: I should have option to hide the profile page for my team members
  Given an user with role lead_supplier and email lead_buyer2232@nbs.com exists as subaccount for customer customer@person.com
  And I follow translated "layout.main_menu.supplier.subaccounts"
  Then I should see translated "layout.my_profile_link"
  And I follow translated "supplier.subaccounts.index.view.edit"
  And I check "user_lead_supplier_hide_profile_page"
  And I press translated "supplier.subaccounts.edit.view.button_update"
  Given I am not sign in
  And I sign in as lead_buyer2232@nbs.com with password secret
  Then I should not see translated "layout.my_profile_link"

@requested @m8b @tgn @_tested @_done
Scenario: Give sales manager the option not to show lead price for team buyer
  Given an user with role lead_supplier and email lead_buyer2232@nbs.com exists as subaccount for customer customer@person.com
  And I follow translated "layout.main_menu.supplier.subaccounts"
  Then I should see translated "layout.my_profile_link"
  And I follow translated "supplier.subaccounts.index.view.edit"
  And I check "user_lead_supplier_hide_lead_prices"
  And I press translated "supplier.subaccounts.edit.view.button_update"
  Given I am not sign in
  And lead Monitors deal exists within category Leisure
  And lead Monitors deal exists with currency "DKK"
  And lead Monitors deal has price 957.49
  And I go to the homepage
  And I sign in as lead_buyer2232@nbs.com with password secret
  And I go to browse leads
  And I follow category "Leisure"
  And I should not see "957.49"
