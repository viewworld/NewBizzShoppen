@$_admin @m6 @tgn @added @hints
Feature: Hints administration

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is "en"
  Then I sign in as bob@person.com with password supersecret
  And I go to administration hints

@_tested @_done
Scenario: I can list all hints
  Given there are no hints
  And article hint for model "Lead" and method "region_id" exists
  And article hint for model "Lead" and method "region_id" has attributes "title:Lead#region,content:hint for region"
  And I go to administration hints
  Then I should see "Lead#region"

@_tested @selenium @_done
Scenario: I can edit hint
  Given there are no hints
  And article hint for model "Lead" and method "region_id" exists
  And I go to administration hints
  Then I click hidden link by url regex "/administration\/hints\/\d+\/edit/"
  And I wait 1 second
  And I fill in "article_content_editor" ckeditor with "Hint for region. Here you can select region specific to your country"
  And I press translated "administration.hints.edit.view.button_save"
  Then I should be on the homepage

# Hints - allow admin to go to edit hint pages straight from interface (just as with blurbs etc.)
@requested @m7 @tgn @_tested @_done
Scenario: I can edit a hint directly from the place where it is displayed
  Given there are no hints
  And article hint for model "Lead" and method "region_id" exists
  And article hint for model "Lead" and method "region_id" has attributes "title:Lead#region,content:hint for region"
  And I go to administration leads
  And I follow translated "administration.leads.index.view.edit"
  And I click hidden link by url regex "/administration\/hints\/\d+\/edit/"
  Then I should see "Edit hint Lead#region"

# This will require some extension to admin - we think that when editing and admin account, we can set “Become a <<role>>” option -
#it will allow an admin to become a user with a specific role (only one at a time) - therefore he will be able to access all interfaces within fairleads and perform article/blurb/hint editing.
@requested @m8 @_tested @translations @_done
Scenario: I can login as any role and be able to edit content
  Given I am a translator for role "supplier" with email "translator_1@nbs.com" and password "secret"
  And I am not sign in
  Then I sign in as translator_1@nbs.com with password secret
  And I go to the homepage
  And I click hidden link by url regex "/administration\/articles\/\d+\/edit/"
  And I should see "Editing article"

@m8 @translations @selenium @added @_tested @_done
Scenario: As translator I can edit blurb, change it, save it and then go back to previous page
  Given I am a translator for role "supplier" with email "translator_1@nbs.com" and password "secret"
  And I am not sign in
  Then I sign in as translator_1@nbs.com with password secret
  And I go to the homepage
  And I click hidden link by url regex "/administration\/articles\/\d+\/edit/"
  And I wait 1 second
  And I fill in "article_content_editor" ckeditor with "My test of article editing by translator"
  Then I press translated "administration.articles.edit.view.button_save"
  And I should be on the homepage
  And I should see "My test of article editing by translator"

@m8 @translations @added @selenium @_tested @_done @faircalls
Scenario: As translator I add/edit/remove edit hint, change it, save it and then go back to previous page
  Given I am a translator for role "agent" with email "translator_1@nbs.com" and password "secret"
  And Category Test category 1 is created
  And there are no hints
  And article hint for model "Lead" and method "company_name" has attributes "published:0"
  And I am not sign in
  And I visit domain http://faircalls.eu
  Then I sign in as translator_1@nbs.com with password secret
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I click hidden link by url regex "/administration\/hints\/\d+\/edit\?add=1/"
  And I wait 1 second
  And I fill in "article_content_editor" ckeditor with "My test of hits editing"
  Then I press translated "administration.hints.edit.view.button_save"