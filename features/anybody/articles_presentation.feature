@articles @ao
Feature: Articles presentation

@m3 @_done
Scenario: I can see article content by clicking on about us
  Given I make sure current locale is "en"
  And I am on the home page
  When I follow "About us"
  Then I should see "About us" within ".frm_head"
  And I should see "About us" within ".frm_content"

@m3 @_done
Scenario: I can see blurb text on the sign up page
  Given I make sure current locale is "en"
  And I am on the home page
  When I go to agent sign up
  Then I should see "Blurb sign up"
  When I go to buyer sign up
  Then I should see "Blurb sign up"

@m0
Scenario: I can see help text by clicking on question mark icon (...)