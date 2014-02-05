@_requested @m11 @category_rules @tgn
Feature: Categories rules

  Background:
    And I am on the homepage
    And I make sure current locale is "en"

  # @_done @_tested @tgn @faircalls @_deprecated2014
  # Scenario: I can't publish leads in category that have subcategories
  #   Given Category Computers is created
  #   And Category named "Laptops" already exists within category named "Computers"
  #   Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
  #   And I visit domain http://faircalls.eu
  #   Then I sign in as bob@person.com with password supersecret
  #   And I go to agents leads
  #   Then select "category_id" should have option "Computers" disabled

  @_done @_tested @tgn @tc_file_mgmt
  Scenario: When first subcategory is created for root, all leads from root are moved to this new category
    Given Category Computers is created
    And lead Laptop Toshiba exists within category Computers
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
    Then I sign in as bob@person.com with password supersecret
    And I go to browse leads
    And I follow translated "administration.categories.index.view.new_category"
    And I fill in "category_name" with "Laptops"
    And I select "Computers" from "category_parent_id"
    And I fill in "category_description" with "Description"
    And attach the file "sample image" to "category_image_attributes_asset"
    And I select "EUR" from "category_currency_id"
    And I press translated "administration.categories.new.view.button_create"
    Then lead "Laptop Toshiba" should be in category "Laptops"

  @_done @non_testable @tgn
  Scenario: I can move lead to other category and duplicate templates

  @_done @non_testable @tgn
  Scenario: I can move lead to other category and delete template information

  #5928
  @_requested @$_agent @m12 @_done @non_testable @tgn
  Scenario: When I move lead to other category then duplicated templates should always be optional

  @_done @tgn @_tested @_done
  Scenario: I can't edit interests from my profile page
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
    Then I sign in as bob@person.com with password supersecret
    And I go to my profile
    Then I should not see translated "my_profile.edit.view.interests_settings"
