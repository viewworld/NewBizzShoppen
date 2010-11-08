@lead_manager @$_freelance_agent @m1
Feature: Lead Management - freelance agent - Edit Lead

Background:
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And lead New lead is created by user bob@person.com with role agent
    And I am on the homepage
    And I make sure current locale is English
    Then I sign in as bob@person.com with password supersecret
    #And I run ruby "throw User::Agent.find_by_email('bob@person.com').valid_password?('supersecret')"
    And I go to agents leads

@_tested
Scenario: I can edit lead
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And I fill in "lead_header" with "New lead updated"
  And I press translated "agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.actions.update.notice"

@_tested1 @selenium
Scenario: I can add a language - title, purchase, hidden, language
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.actions.update.notice"

Scenario: I can delete a language

Scenario: After a lead that have been bought and I update it. When I click save I should get a popup asking if I want to notify the lead buyer about the changes.
# Generic mail edited by the administrator.

Scenario: Datepicker - after selecting form the select box it should automatically fill in the date
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And  I fill in "datepicker" with "2010-01-01"
  And I wait 15 second

