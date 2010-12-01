@system @m0
Feature: SEO urls

Background:
  Given I make sure current locale is English
  And I am on the homepage

@m3 @ao
Scenario: Article show

@m3 @tgn @_wip1
Scenario: Lead listing - category name
  Given Category named "Computers" already exists
  Given I go to browse leads
  And I follow "Computers"


@m3 @ao
Scenario: Agent news show

@m3 @ao
Scenario: Buyer news show