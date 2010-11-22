@lead_manager @$_freelance_agent @m1
Feature: Lead editing by agent

Background:
    Given I am on the homepage
    And I make sure current locale is English
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And lead New lead is created by user bob@person.com with role agent
    And a lead New lead exists within category Computers and is bought by user john.buyer@person.com with role customer
    Then I sign in as bob@person.com with password supersecret
    And I go to agents leads

@_tested
Scenario: I can edit lead
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And I fill in "lead_header" with "New lead updated"
  And I press translated "agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.actions.update.notice"

@_tested @selenium
Scenario: I can add a language - title, purchase, hidden, language
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.actions.update.notice"

@_tested @selenium
Scenario: I can delete a language
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And I select "dk" from "locale_picker"
  Then I follow translated "agent.leads.new.view.remove_language"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  Then I press translated "agent.leads.edit.view.button_update"
  And  I follow translated "agent.leads.index.view.edit"
  And I follow translated "agent.leads.new.view.remove_language"
  Then I press translated "agent.leads.edit.view.button_update"
  And I follow translated "agent.leads.index.view.edit"
  And I should not see "DK hidden description"

@_tested
Scenario: When the lead is bought and I want to edit it then "Notify the lead buyers" checkbox is present
  Given I go to agents leads
  And I follow translated "agent.leads.index.view.edit"
  Then I should see translated "activerecord.attributes.lead.notify_buyers_after_update"


@m0
Scenario: When the lead is bought and I update it and check "Notify the lead buyers" then email is sent to all buyers
# Generic mail edited by the administrator.

@_tested
Scenario: Datepicker - after selecting form the select box it should automatically fill in the date
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And  I fill in "datepicker" with "2010-01-01"

