@lead_catalog	@$_admin @m1
Feature: Lead Categories Admin - Lead Categories
  Background: Set English locale and login
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    And I am on the homepage
    And I make sure current locale is English
    Then I sign in as bob@person.com with password supersecret


Scenario: I can see categories tree

Scenario: I can navigate through the categories

@_tested
Scenario: I can create a category
  Given I go to administration categories
  And I follow translated "administration.categories.index.view.new_category"
  And I fill in "category_name" with "Test category"
  And I fill in "category_description" with "Description"
  And I fill in "category_image_attributes_asset" with "/home/rb/Pictures/Nature Mountains photo.jpg"
  Then I press translated "administration.categories.new.view.button_create"
  And I should be on administration categories
  And I should see translated "flash.actions.create.notice"
  And I open page in browser

@_tested
Scenario: I can edit category - name and description
  Given Category named "New test category" already exists
  And I go to administration categories
  Then I follow translated "administration.categories.index.view.edit"
  And I fill in "category_name" with "Test category correction"
  And I fill in "category_description" with "Description correction"
  And I fill in "category_image_attributes_asset" with "/home/rb/Pictures/Nature Mountains photo.jpg"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should be on administration categories
  And I should see translated "flash.actions.update.notice"

Scenario: I can delete a category if its empty

Scenario: I can see statistics for a selected category

Scenario: I can reattach node
@_wip
Scenario: I can upload a category image
  Given Category named "New test category" already exists
  And I go to administration categories
  Then I follow translated "administration.categories.index.view.edit"
  And I fill in "category_image_attributes_asset" with "/home/rb/Pictures/Nature Mountains photo.jpg"
  Then I press translated "administration.categories.edit.view.button_update"
  And I should be on administration categories
  And I should see translated "flash.actions.update.notice"