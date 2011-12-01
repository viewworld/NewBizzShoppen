@$_anybody @requested @m11 @is @lead_templates @faircalls
Feature: Lead templates for agents

Background:
  Given I visit domain http://faircalls.eu

@_done @_tested @_deprecated
Scenario: User can see created by in Lead Template edit view
#  And I have user with email super@person.com role Agent first_name Irek last_name Skrobis and company_name Selleo
#  Given template named "Special" for category "Electronics" is created by user "super@person.com" with role "agent"
#  Given I am on the homepage
#  Then I sign in as super@person.com with password secret
#  Then I follow translated "layout.main_menu.shared.home"
#  Then I follow translated "categories.index.view.view_lead_templates"
#  Then I should see "Irek Skrobis"
#  Then I should see translated "lead_templates.table.created_by"
#  Then I follow translated "agent.lead_templates.index.view.edit"
#  Then I should see "Irek Skrobis"
#  Then I should see translated "agent.lead_templates.edit.view.created_by"

@_done @_tested_elsewhere
Scenario: User can see created by in Lead Templates listing

@_done @_tested
Scenario: There should not be Lead Templates tab for any user
  Given I am on the homepage
  Then I sign in as agent@nbs.com with password secret
  Then I should not see "Lead templates"
  Given I go to the logout page
  Given I visit domain http://fairleads.eu
  Given I am on the homepage
  Then I sign in as buyer@nbs.com with password secret
  Then I should not see "Lead templates"
  Given I go to the logout page
  Given I visit domain http://faircalls.eu
  Given I am on the homepage
  Then I sign in as translator_call_centre@nbs.com with password secret
  Then I should not see "Lead templates"
  Given I go to the logout page
  Given I visit domain http://fairleads.eu
  Given I am on the homepage
  Then I sign in as translator_customer@nbs.com with password secret
  Then I should not see "Lead templates"
  Given I go to the logout page
  Given I visit domain http://fairdeals.eu
  Given I am on the homepage
  Then I sign in as translator_purchase_manager@nbs.com with password secret
  Then I should not see "Lead templates"
  Given I go to the logout page
  Given I visit domain http://fairleads.eu
  Given I am on the homepage
  Then I sign in as translator_category_buyer@nbs.com with password secret
  Then I should not see "Lead templates"
  Given I go to the logout page
  Given I visit domain http://faircalls.eu
  Given I am on the homepage
  Then I sign in as translator_call_centre_agent@nbs.com with password secret
  Then I should not see "Lead templates"
  
# 5776
@_done @_tested_elsewhere
Scenario: When I access templates listing from browse leads page then I should see template creator
  