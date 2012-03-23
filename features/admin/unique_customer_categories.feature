@$_admin @m5 @tgn @unique_categories @added
Feature: Unique customer categories

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is "en"
  Given there are no categories
  And Category Computers is created
  Then I sign in as bob@person.com with password supersecret
  And I go to browse leads

@_tested @_done @tc_file_mgmt
Scenario: I can mark category as customer unique
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_customer_unique"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.update.notice"

@_tested @selenium @_done
Scenario: I can assign one or more sales managers to category marked as customer unique
  Given I have user with email buyer93928biz@nbs.com and role supplier
  And I have user with email lead_buyer3483434biz@nbs.com and role supplier
  And I have user with email nbsbuyer3483434biz@nbs.com and role supplier
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  And I fill in "search_with_keyword" with "computers"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
  And I check "category_is_customer_unique"
  And I select "lead_buyer3483434biz@nbs.com" from "all_customers"
  And I select "buyer93928biz@nbs.com" from "all_customers"
  And I follow "move_right"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.update.notice"
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  And I fill in "search_with_keyword" with "computers"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
  And "selected_customers" should be selected for value "lead_buyer3483434biz@nbs.com"
  And "selected_customers" should be selected for value "buyer93928biz@nbs.com"

@_tested @selenium @_done
Scenario: I can search customers by first name, last name and email
  Given I have user with email buyer93928biz@nbs.com and role supplier
  And I have user with email lead_buyer3483434biz@nbs.com and role supplier
  And I have user with email nbsbuyer3483434biz@nbs.com and role supplier
  And user "nbsbuyer3483434biz@nbs.com" with role "supplier" has attributes "last_name:Aronofsky Jr"
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  And I fill in "search_with_keyword" with "computers"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
  And I check "category_is_customer_unique"
  And I fill in "filer_customers" with "Aronofsky Jr" within "#users_selection_customers_div"
  And I follow translated "administration.categories.form.search" within "#users_selection_customers_div"
  And I select "nbsbuyer3483434biz@nbs.com" from "all_customers"
  And I follow "move_right" within "#users_selection_customers_div"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.update.notice"
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  And I fill in "search_with_keyword" with "computers"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
  And "selected_customers" should be selected for value "nbsbuyer3483434biz@nbs.com"

@_done @non_testable
Scenario: Each category marked as unique for certain customer is added to that customer's interests