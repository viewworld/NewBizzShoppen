@system
Feature: SEO urls

Background:
  Given I make sure current locale is "en"
  And I am on the homepage

@m0 @ao
Scenario: Article show

@m3 @tgn @_tested
Scenario: Lead listing - category name
  Given Category named "Computers" already exists
  Given I go to browse leads
  And I follow category "Computers"

@m0 @ao
Scenario: Agent news show

@m0 @ao
Scenario: Buyer news show