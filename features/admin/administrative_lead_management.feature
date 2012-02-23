@lead_manager @$_admin @m5 @ao
Feature: Administrative lead management

Background:
  Given I am on the homepage
  And I make sure current locale is "en"
  Given I am signed up and confirmed as user with email admin2@person.com and password supersecret and role admin
  Then I sign in as admin2@person.com with password supersecret

# https://redmine.selleo.com/issues/3494
@_done @_deprecated
Scenario: I can edit lead if the lead is not sold yet

# https://redmine.selleo.com/issues/3494
@_done @_deprecated
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
  And I have user with email bigbuyer1@person.com and role supplier
  And User bigbuyer1@person.com with role supplier is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role supplier
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
  And I have user with email bigbuyer1@person.com and role supplier
  And User bigbuyer1@person.com with role supplier is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role supplier
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "administration.leads.index.view.edit"
  And I select translated "models.locale.da" from "locale_picker"
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
  And I have user with email bigbuyer1@person.com and role supplier
  And User bigbuyer1@person.com with role supplier is big buyer
  And a lead Monitors ultimate deal exists within category Computers and is bought by user bigbuyer1@person.com with role supplier
  And I follow translated "layout.main_menu.admin.leads"
  And I follow translated "administration.leads.index.view.edit"
  And I select translated "models.locale.da" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "dk Header"
  And I fill in "lead_lead_translations_attributes_0_description" with "dk Description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "dk Hidden description"
  And I press translated "administration.leads.edit.view.button_update"
  And I follow translated "administration.leads.index.view.edit"
  And I follow translated "agent.leads.new.view.remove_language"
  And I press translated "administration.leads.edit.view.button_update"
  And I follow translated "administration.leads.index.view.edit"
  Then I should not see translated "agent.leads.new.view.remove_language"

@m4 @tgn @added @agent_certification @_tested @selenium @_done
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

@m5 @tgn @_tested @_done
Scenario: I can edit leads from any page where they are presented
  Given lead New lead exists within category Computers
  When I go to browse leads
  And I follow category "Computers"
  Then I click hidden link by url regex "/administration\/leads\/\d+\/edit/"
  And I should see translated "agent.leads.edit.view.title" with options "name:New lead"
  When I go to agent home
  Then I click hidden link by url regex "/administration\/leads\/\d+\/edit/"
  And I should see translated "agent.leads.edit.view.title" with options "name:Big deal on printers"

@m5 @added @selenium @_done @_tested
Scenario: I can clear the filter when browsing leads
  When there are no leads
  And lead Monitors ultimate deal exists within category Computers
  And lead Keyboards ultimate deal exists within category Computers
  And I go to browse leads
  And I follow category "Computers"
  And I fill in "search_with_keyword" with "Monitors"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "Monitors"
  And I should not see "Keyboards"
  When I follow translated "common.clear_filter"
  Then I should see "Monitors"
  And I should see "Keyboards"

@m6 @selenium @_tested @tgn @_done
Scenario: When I change the category then I am not redirected back to the listing view
#  Given there are no leads
#  And a lead Super ultra lead #1 exists within category Computers and is bought by user tim@nbs.com with role supplier
#  When I follow translated "layout.main_menu.admin.leads"
#  And I follow translated "leads.listing.edit_label"
#  Then I select "Electronics" from "lead_category_id"
#  And I should see "Editing lead: Super ultra lead #1"

@m6 @_tested @tgn @_done
Scenario: I can change creator of lead to any other agent
  Given there are no leads
  And I have user with email agent_999@nbs.com and role agent
  And I have user with email agent_777@nbs.com and role call_centre_agent
  And lead Super ultra lead #1 is created by user agent_999@nbs.com with role agent
  When I follow translated "layout.main_menu.admin.leads"
  And I follow translated "leads.listing.edit_label"
  Then I select "agent_777@nbs.com" from "lead_tmp_creator_id"
  And I press translated "administration.leads.edit.view.button_update"
  Then I should be on administration leads page
  And I follow translated "leads.listing.edit_label"
  And "lead_tmp_creator_id" should be selected for value "agent_777@nbs.com"

#10277
@m29 @requested
Scenario: I should not see Klik,Antal visninger,Hvor hot,Nyhed,Hvor unik,Lead pris,Solgt,Værdi,Udbetalt,Dårlig rating,Status

#10277
@m29 @requested
Scenario: I should see date (creation date), category (lead category), lead price

#10277
@m29 @requested
Scenario: I should see source (deal or agent name)

#10277
@m29 @requested
Scenario: I should see whether lead has been sold

#10277
@m29 @requested
Scenario: I can sort leads by all of the new columns

