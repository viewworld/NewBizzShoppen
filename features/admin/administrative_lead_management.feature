@lead_manager @$_admin @m5 @ao
Feature: Administrative lead management

Background:
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email admin2@person.com and password supersecret and role admin
  Then I sign in as admin2@person.com with password supersecret

# https://redmine.selleo.com/issues/3494
@_deprecated
Scenario: I can edit lead if the lead is not sold yet

# https://redmine.selleo.com/issues/3494
@_deprecated
Scenario: I can’t edit lead if the lead was already sold

@added @_done
Scenario: I can edit lead information if lead has not been sold yet
  When there are no leads
  And lead Monitors ultimate deal exists within category Computers
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "administration.leads.index.view.edit"
  And I fill in "lead_price" with "666"
  And I fill in "lead_header" with "Changed header"
  And I press translated "administration.leads.edit.view.button_update"
  Then I should be on administration leads page
  And I should see /666\.00/
  And I should see "Changed header"

@added @_done
Scenario: I can edit lead information if lead has been sold
  When there are no leads
  And I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "administration.leads.index.view.edit"
  And I fill in "lead_price" with "666"
  And I fill in "lead_header" with "Changed header"
  And I press translated "administration.leads.edit.view.button_update"
  Then I should be on administration leads page
  And I should see /666\.00/
  And I should see "Changed header"

@selenium @_done
Scenario: I can add a language
  When there are no leads
  And I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "administration.leads.index.view.edit"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "dk Header"
  And I fill in "lead_lead_translations_attributes_0_description" with "dk Description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "dk Hidden description"
  And I press translated "administration.leads.edit.view.button_update"
  Then I should be on administration leads page
  And I follow translated "administration.leads.index.view.edit"
  Then the "lead_lead_translations_attributes_0_header" field should contain "dk Header"
  And the "lead_lead_translations_attributes_0_description" field should contain "dk Description"
  And the "lead_lead_translations_attributes_0_hidden_description" field should contain "dk Hidden description"

@selenium @_done
Scenario: I can delete a language
  When there are no leads
  And I have user with email bigbuyer1@person.com and role customer
  And User bigbuyer1@person.com with role customer is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role customer
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "administration.leads.index.view.edit"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "dk Header"
  And I fill in "lead_lead_translations_attributes_0_description" with "dk Description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "dk Hidden description"
  And I press translated "administration.leads.edit.view.button_update"
  And I follow translated "administration.leads.index.view.edit"
  And I follow translated "agent.leads.new.view.remove_language"
  And I press translated "administration.leads.edit.view.button_update"
  And I follow translated "administration.leads.index.view.edit"
  Then I should not see translated "agent.leads.new.view.remove_language"

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

@m5 @tgn @_tested
Scenario: I can edit leads from any page where they are presented
  Given lead New lead exists within category Computers
  When I go to browse leads
  And I follow "Computers"
  Then I follow translated "leads.listing.edit_label"
  And I should see translated "agent.leads.edit.view.title"
  When I go to agent home
  Then I follow translated "leads.listing.edit_label"
  And I should see translated "agent.leads.edit.view.title"
