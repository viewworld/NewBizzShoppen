@$_admin @m6 @tgn @added
Feature: Hints administration

Background:
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is "en"
  Then I sign in as bob@person.com with password supersecret
  And I go to administration hints

@_tested
Scenario: I can list all hints
  Then I should see "Lead#region"

@_tested @selenium
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
@requested @m7 @tgn @_tested
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
@requested @m8
Scenario: Option for becoming a certain role and be able to edit blurb/articles/hints
