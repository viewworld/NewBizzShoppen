@$_purchase_manager @comments @m9
Feature: Comments administration as purchase manager

Background:
  Given I am signed up and confirmed as user with email purchase_manager@nbs.com and password secret and role purchase_manager
  And I am on the homepage
  And I make sure current locale is "en"
  Then I sign in as purchase_manager@nbs.com with password secret

@_tested
Scenario: I can't see comments when signed in as purchase manager
  Then I should not see translated "layout.main_menu.shared.comments"
  When I go to comments threads
  Then I should not see "You are not authorized to access this page."