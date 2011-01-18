@lead_manager @$_admin @m5 @ao
Feature: Administrative lead management
  
Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email admin2@person.com and password supersecret and role admin
  Then I sign in as admin2@person.com with password supersecret


Scenario: I can edit lead if the lead is not sold yet

Scenario: I can’t edit lead if the lead was already sold

Scenario: I can add a language

Scenario: I can delete a language

@m4 @tgn @added @agent_certification @_tested @selenium
Scenario: I can publish a lead that is not published
  Given I have user with email agent.notcertified@person.com and role agent
  And user "agent.notcertified@person.com" with role "agent" has certification level set to 0
  And lead Monitors ultimate deal is created by user agent.notcertified@person.com with role agent
  And lead named "Monitors ultimate deal" is not published
  Given I am not sign in
  Then I sign in as admin2@person.com with password supersecret
  And I go to administration leads
  And I select translated "administration.leads.index.view.option_not_published" from "search_with_status"
  And I press translated "administration.leads.index.view.search_button"
  Then I select translated "administration.leads.index.view.option_published" from "published"
  And I go to administration leads
  And I select translated "administration.leads.index.view.option_not_published" from "search_with_status"
  And I press translated "administration.leads.index.view.search_button"
  And I should not see "Monitors ultimate deal"

