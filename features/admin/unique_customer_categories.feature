@$_admin @m5 @tgn @unique_categories
Feature: Unique customer categories

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is English
  Given there are no categories
  And Category Computers is created
  Then I sign in as bob@person.com with password supersecret
  And I go to administration categories

@_tested
Scenario: I can mark category as customer unique
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_customer_unique"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"

@_tested @selenium
Scenario: I can assign one or more sales managers to category marked as customer unique
  Given I have user with email buyer93928biz@nbs.com and role customer
  And I have user with email lead_buyer3483434biz@nbs.com and role customer
  And I have user with email nbsbuyer3483434biz@nbs.com and role customer
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_customer_unique"
  And I select "lead_buyer3483434biz@nbs.com" from "all_customers"
  And I select "buyer93928biz@nbs.com" from "all_customers"
  And I press translated "administration.categories.form.move_users_right"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"
  Then I follow translated "administration.categories.index.view.edit_link"
  And "selected_customers" should be selected for value "lead_buyer3483434biz@nbs.com"
  And "selected_customers" should be selected for value "buyer93928biz@nbs.com"

@_tested @selenium
Scenario: I can search customers by first name, last name and email
  Given I have user with email buyer93928biz@nbs.com and role customer
  And I have user with email lead_buyer3483434biz@nbs.com and role customer
  And I have user with email nbsbuyer3483434biz@nbs.com and role customer
  And user "nbsbuyer3483434biz@nbs.com" with role "customer" has attributes "last_name:Aronofsky Jr"
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_customer_unique"
  And I fill in "filer_customers" with "Aronofsky Jr" within "#users_selection_customers_div"
  And I follow translated "administration.categories.form.search" within "#users_selection_customers_div"
  And I select "nbsbuyer3483434biz@nbs.com" from "all_customers"
  And I press translated "administration.categories.form.move_users_right" within "#users_selection_customers_div"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"
  Then I follow translated "administration.categories.index.view.edit_link"
  And I open page in browser
  And "all_customers" should be selected for value "nbsbuyer3483434biz@nbs.com"