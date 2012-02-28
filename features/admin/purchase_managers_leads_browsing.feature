@purchase_manager @m3 @ao @noguess
Feature: Purchase Managers leads browsing

Background:
  Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  And someone is signed up and confirmed as user with email pm@nbs.com and password secret and role member
  And I am on the home page
  And I sign in as jon@lajoie.ca with password secret
  And lead PMLeadOne is created by user pm@nbs.com with role member
  And I follow translated "layout.main_menu.admin.leads"

@added @_done
Scenario: I can filter leads by owner type (Purchase Manager) and Status (not published)
  When I select translated "administration.leads.index.view.option_not_published" from "search_with_status"
  And I select "Member" from "search_with_creator_type"
  And I press translated "administration.leads.index.view.search_button"
  Then I should see "PMLeadOne"
  And I should see "1" rows with id like "lead_" in a table within "#leads"

@added @selenium @_done @_deprecated
Scenario: I can publish leads created by Purchase Managers
#  When I select translated "administration.leads.index.view.option_not_published" from "search_with_status"
#  And I select "Member" from "search_with_creator_type"
#  And I press translated "administration.leads.index.view.search_button"
#  And I select translated "administration.leads.index.view.option_published" from "published"
#  When I select translated "administration.leads.index.view.option_published" from "search_with_status"
#  And I press translated "administration.leads.index.view.search_button"
#  Then I should see "PMLeadOne"
