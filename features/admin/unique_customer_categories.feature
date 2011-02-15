@$_admin @m5 @tgn
Feature: Unique customer categories

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is English
  Given there are no categories
  And Category Computers is created
  Then I sign in as bob@person.com with password supersecret
  And I go to administration categories

@m5 @unique_categories @_tested
Scenario: I can mark category as customer unique
  When I follow translated "administration.categories.index.view.edit_link"
  And I check "category_is_customer_unique"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should see translated "flash.categories.actions.update.notice"

@m5 @unique_categories
Scenario: I can assign one or more sales managers to category marked as customer unique