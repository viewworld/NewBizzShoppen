@lead_catalog @$_admin @m1
Feature: Lead Categories Admin - Lead Categories
  Background: Set English locale and login
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    And I am on the homepage
    And I make sure current locale is English
    Then I sign in as bob@person.com with password supersecret

@_tested @bk
Scenario: I can see categories tree
  Given Category named "Sample category" already exists
  And Category named "Another sample category" already exists within category named "Sample category"
  And I go to administration categories
  Then show me the page
  And I should see category named "Another sample category" within category named "Sample category"

@_tested @bk
Scenario: I can navigate through the categories
  Given Category named "Sample category" already exists
  And I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  Then I should see "Sample category"

@_tested
Scenario: I can create a category
  Given I go to administration categories
  And I follow translated "administration.categories.index.view.new_category"
  And I fill in "category_name" with "Test category"
  And I fill in "category_description" with "Description"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.new.view.button_create"
  And I should be on administration categories
  And I should see translated "flash.categories.actions.create.notice"

@_tested
Scenario: I can edit category - name and description
  Given Category named "New test category" already exists
  And I go to administration categories
  Then I follow translated "administration.categories.index.view.edit_link"
  And I fill in "category_name" with "Test category correction"
  And I fill in "category_description" with "Description correction"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should be on administration categories
  And I should see translated "flash.categories.actions.update.notice"


@_tested @bk
Scenario: I can delete a category if it is empty
  Given Category named "New test category" already exists
  And I go to administration categories
  And I follow translated "administration.categories.index.view.destroy_link" within "New test category" category
  Then I should see translated "flash.categories.actions.destroy.notice"

@_tested @bk
Scenario: I cannot delete a category if it is not empty
  Given Category named "New test category" already exists
  And I go to administration categories
  And Lead named "Super printers" exists within "New test category" category
  And I follow translated "administration.categories.index.view.destroy_link" within "New test category" category
  Then I should see translated "flash.categories.actions.destroy.error"

@question
Scenario: I can see statistics for a selected category

@bk @_todo
Scenario: I can reattach node

@_tested
Scenario: I can upload a category image
  Given Category named "New test category" already exists
  And I go to administration categories
  Then I follow translated "administration.categories.index.view.edit_link"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should be on administration categories
  And I should see translated "flash.categories.actions.update.notice"