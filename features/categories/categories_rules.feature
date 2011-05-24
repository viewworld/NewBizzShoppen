@requested @m11 @category_rules @tgn
Feature: Categories rules

  Background:
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as bob@person.com with password supersecret

  Scenario: I can't publish leads in category that have subcategories

  Scenario: When first subcategory is created for root, all leads from root are moved to this new category

  @_done @not_testable @tgn
  Scenario: I can move lead to other category and duplicate templates

  @_done @not_testable @tgn
  Scenario: I can move lead to other category and delete template information

  Scenario: I can't edit interests from my profile page