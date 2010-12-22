@email_templates @$_admin @m3 @tgn
Feature: Email Templates administration

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I go to administration email templates

@_tested
Scenario: I can list all available email templates and see following columns -  name, subject, actions
  Then I should see "confirmation_instructions"
  And I should see "Confirmation instructions"
  And I should see translated "administration.email_templates.index.view.edit"

@_tested
Scenario: I can paginate email templates list
  Then pagination per page size in model EmailTemplate is set to 2
  And I go to administration email templates
  And I follow "2"
  And I follow "1"

@_tested @selenium
Scenario: I can edit and update following email template fields: name, subject, body
  Then I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
  And I fill in "email_template_subject" with "Confirmation message corrected"
  And I fill in "email_template_body_editor" ckeditor with "Confirmation message corrected body"
  Then I press translated "administration.email_templates.edit.view.button_update"
  And I should see translated "flash.email_templates.update.notice"

@_tested @selenium
Scenario: I can edit and update email template fields for different language when I switch interface language
  Given email "confirmation_instructions" has translation for lang "dk" with attributes "subject:Bekraeftelse instruktioner"
  Then I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
  And the "email_template_subject" field should contain "Confirmation instructions"
  Then I click hidden link by url regex "/locales\/dk/"
  And I go to administration email templates
  Then I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
  And the "email_template_subject" field should contain "Bekraeftelse instruktioner"
  And I fill in "email_template_subject" with "Confirmation message corrected"
  And I fill in "email_template_body_editor" ckeditor with "Confirmation message corrected body"
  Then I press translated "administration.email_templates.edit.view.button_update"
  
  
@m4 @tgn @_done @non_testable
Scenario: I should be able to edit email templates using WYSIWYG editor and applying basic styling