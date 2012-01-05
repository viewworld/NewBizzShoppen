@lead_catalog @$_admin @m1 @tc_file_mgmt
Feature: Categories administration
  Background: Set English locale and login
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as bob@person.com with password supersecret

@_tested @bk @_done
Scenario: I can see categories tree
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I go to browse leads
  And I should see category named "Another sample category" within category named "Sample category"

@_tested @bk @_done
Scenario: I can navigate through the categories
  Given Category named "Sample category" already exists
  And I go to browse leads
  And I follow translated "administration.categories.index.view.edit_link"
  Then I should see "Sample category"

@_tested @_done
Scenario: I can create a category
  Given I go to browse leads
  And I follow translated "administration.categories.index.view.new_category"
  And I fill in "category_name" with "Test category"
  And I fill in "category_description" with "Description"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I select "EUR" from "category_currency_id"
  Then I press translated "administration.categories.new.view.button_create"
  And I should be on browse leads
  And I should see translated "flash.categories.create.notice"

@_tested @added @tgn @_done
Scenario: I can create a category even when I am on DK locales (slug is not set then)
  Given I click hidden link by url regex "/locales\/da/"
  And I go to browse leads
  And I follow translated "administration.categories.index.view.new_category"
  And I fill in "category_name" with "Test category"
  And I fill in "category_description" with "Description"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I select "EUR" from "category_currency_id"
  Then I press translated "administration.categories.new.view.button_create"
  And I should be on browse leads
  And I should see translated "flash.categories.create.notice"

@_tested @_done
Scenario: I can edit category - name and description
  Given Category named "New test category" already exists
  And I go to browse leads
  Then I follow translated "administration.categories.index.view.edit_link"
  And I fill in "category_name" with "Test category correction"
  And I fill in "category_description" with "Description correction"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I select "EUR" from "category_currency_id"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should be on browse leads
  And I should see translated "flash.categories.update.notice"


@_tested @bk @_done
Scenario: I can delete a category if it is empty
  Given Category named "New test category" already exists
  And I go to browse leads
  And I follow translated "administration.categories.index.view.destroy_link" within "New test category" category
  Then I should see translated "flash.categories.destroy.notice"

@_tested @bk @_done
Scenario: I cannot delete a category if it is not empty
  Given Category named "New test category" already exists
  And I go to browse leads
  And Lead named "Super printers" exists within "New test category" category
  And I follow translated "administration.categories.index.view.destroy_link" within "New test category" category
  Then I should see translated "flash.categories.destroy.error"

@question
Scenario: I can see statistics for a selected category

@_tested @bk @_done
Scenario: I can reattach node
  Given Category named "Parent category 1" already exists
  And Category named "Parent category 2" already exists
  And Category named "Child category" already exists within category named "Parent category 1"
  And I go to browse leads
  Then I should see category named "Child category" within category named "Parent category 1"
  When I follow translated "administration.categories.index.view.edit_link" for category "Child category"
  And I select "Parent category 2" from "category_parent_id"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I press translated "administration.categories.edit.view.button_update"
  Then I should see category named "Child category" within category named "Parent category 2"

@_tested @_done
Scenario: I can upload a category image
  Given Category named "New test category" already exists
  And I go to browse leads
  And I go to browse leads
  Then I follow translated "administration.categories.index.view.edit_link"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should be on browse leads
  And I should see translated "flash.categories.update.notice"

@m6 @tgn @_tested @_done
Scenario: I can manage categories from Browse categories. Categories tab should be removed
  Then I should not see translated "layout.main_menu.admin.categories"

@m6 @tgn @_tested @requested @_done
Scenario: I can make any category country specific (Category can have one or more countries assigned to it)
  Given there are no categories
  And Category Computers is created
  When I go to browse leads
  And I follow translated "administration.categories.index.view.edit_link"
  And I select "Denmark" from "category_country_ids"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.update.notice"
  Then I follow translated "administration.categories.index.view.edit_link"
  And "category_country_ids" should be selected for value "Denmark"

@m6 @ao @_done @_tested  @requested
Scenario: I can mark category to allow buyouts
  Given Category named "Sample category" already exists
  And category "Sample category" has attributes "buyout_enabled:0"
  And I am on administration edit category Sample category
  Then checkbox named "category_buyout_enabled" should not be checked
  When I check "category_buyout_enabled"
  And I press translated "administration.categories.edit.view.button_update"
  And I am on administration edit category Sample category
  Then checkbox named "category_buyout_enabled" should be checked

@m6 @ao @_done @_tested @requested @deprecated
Scenario: When creating new category it is marked with buyout flag by default
#  When I go to administration categories
#  And I follow translated "administration.categories.index.view.new_category"
#  And I fill in "category_name" with "New category"
#  And I fill in "category_description" with "Description"
#  And checkbox named "category_buyout_enabled" should be checked
#  And I select "EUR" from "category_currency_id"
#  Then I press translated "administration.categories.new.view.button_create"
#  And I am on administration edit category New category
#  Then checkbox named "category_buyout_enabled" should be checked

# Allow admin to flag a category with option “Do not show prices to team members” - this will basically make team-buyers (subeaccounts) not see lead price when browsing leads within that particular category.
@requested @m7 @tgn @_tested @_done
Scenario: I can flag a category to not show prices to team members
  Given there are no categories
  And Category Computers is created
  When I go to administration categories
  Then I follow translated "administration.categories.index.view.edit_link"
  And I check "category_no_prices_for_team_members"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I press translated "administration.categories.edit.view.button_update"
  Then I am not sign in
  And lead Monitors deal #1 exists within category Computers
  And lead "Monitors deal #1" has attributes "price:589.17"
  And lead Monitors deal #2 exists within category Computers
  And lead "Monitors deal #2" has attributes "price:439.58"
  And someone is signed up and confirmed as user with email buyer888@nbs.com and password secret and role supplier
  And an user with role lead_supplier and email lead_buyer888@nbs.com exists as subaccount for customer buyer888@nbs.com
  Then I sign in as lead_buyer888@nbs.com with password secret
  And I go to browse leads
  And I follow category "Computers"
  Then I should not see "589.17"
  And I should not see "439.58"
  Then I am not sign in
  Then I sign in as buyer888@nbs.com with password secret
  And I go to browse leads
  And I follow category "Computers"
  Then I should see "589.17"
  And I should see "439.58"

@m13 @added @auto_buy @is @_done @_tested @selenium
Scenario: I can enable auto-buy option for big buyer for categories which are unique to him
  Given there are no categories
  Then I have user with email nbsbuyer3483434biz@nbs.com and role supplier
  Then User nbsbuyer3483434biz@nbs.com with role supplier is big buyer
  Then Category Computers is created
  When I go to administration categories
  Then I follow translated "administration.categories.index.view.edit_link"
  Then I check "category_is_customer_unique"
  Then I select "nbsbuyer3483434biz@nbs.com" from "all_customers"
  Then I follow "move_right" within "#users_selection_customers_div"
  Then I check "category_auto_buy"
  Then I press "Save"
  Then category named "Computers" is auto buy enabled
  Then Lead named "sub zero" exists within "Computers" category
  Then lead sub zero has 1 lead purchases
  Then last email sent should have been sent to recipient "nbsbuyer3483434biz@nbs.com"

@m14 @requested @$_admin @auto_buy @is @_done @_tested
Scenario: I can edit "Additional information" for category
  Given there are no categories
  Then Category Computers is created
  When I go to administration categories
  Then I follow translated "administration.categories.index.view.edit_link"
  Then I fill in "category_additional_information" with "new additional information"
  Then I press "Save"


@m18 @_tested @_done @tgn
Scenario: Buyout for all categories is disabled by default
  Given I go to browse leads
  And I follow translated "administration.categories.index.view.new_category"
  And the "category_buyout_enabled" checkbox should not be checked

@m20 @ao @added @_done @_tested
Scenario: I should be able to delete category image
  When there are no categories
  And Category Computers is created
  And I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I press "Save"
  And I follow translated "administration.categories.index.view.edit_link"
  And I press "Save"
  Then I should see CSS path "table#categories_table tr:nth-of-type(1) td:nth-of-type(2) img"
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_remove_image"
  And I press "Save"
  Then I should not see CSS path "table#categories_table tr:nth-of-type(1) td:nth-of-type(2) img"

