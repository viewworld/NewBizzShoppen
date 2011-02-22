@lead_manager @$_call_centre_agent @m5 @tgn
Feature: Lead editing by call centre agent

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English
  And I have user with email call_centre@person.com and role call_centre
  And I am signed up and confirmed as user with email call_centre_agent@person.com and password supersecret and role call_centre_agent
  And lead Monitors ultimate deal is created by user call_centre_agent@person.com with role call_centre_agent
  And an user with role call_centre_agent and email call_centre_agent@person.com belongs to call centre call_centre@person.com
  Then I sign in as call_centre_agent@person.com with password supersecret

Scenario: I can edit lead if the lead is not sold yet


Scenario: I can’t edit lead if the lead was already sold

@selenium @_tested
Scenario: I can add a language - title, purchase, hidden, language
  Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "call_centre_agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.actions.update.notice"

@selenium @_tested
Scenario: I can delete a language
  Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
  And I select "dk" from "locale_picker"
  Then I follow translated "agent.leads.new.view.remove_language"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  Then I press translated "call_centre_agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
  And I follow translated "agent.leads.new.view.remove_language"
  Then I press translated "call_centre_agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
  And I should not see "DK hidden description"

Scenario: After a lead that have been bought and I update it. When I click save I should get a popup asking if I want to notify the lead buyer about the changes.

@_tested
Scenario: Datepicker - after selecting form the select box it should automatically fill in the date
  Then I follow translated "call_centre_agent.leads.index.view.edit"
  And  I fill in "datepicker" with "2010-01-01"
