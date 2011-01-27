@lead_templates @$_call_centre @m5 @tgn
Feature: Lead templates management for call centre

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email call_centre@person.com and password supersecret and role call_centre
  Then I sign in as call_centre@person.com with password supersecret
  And I go to call centre agents

@added
Scenario: I can list all lead templates that were created by me

@added
Scenario: I can create new lead template for given category

@added
Scenario: During template creation/edition I can mark fields as hidden or public

@added
Scenario: I can edit lead template that was created by me

@added
Scenario: I can delete lead template that was created by me and was not filled out by anyone

@added
Scenario: I can mark any of my lead templates as active/inactive