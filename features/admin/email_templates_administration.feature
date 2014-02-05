@email_templates @$_admin @m3 @tgn
Feature: Email Templates administration

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret
  And I go to administration email templates

@_done @_tested
Scenario: I can list all available email templates and see following columns -  name, subject, actions
  Then I should see "confirmation_instructions"
  And I should see "Confirmation instructions"
  And I should see translated "administration.email_templates.index.view.edit"

@_done @_tested
Scenario: I can paginate email templates list
  Then pagination per page size in model EmailTemplate is set to 2
  And I go to administration email templates
  And I follow "2"
  And I follow "1"

@_done @_tested @selenium
Scenario: I can edit and update following email template fields: name, subject, body
  Then I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
  And I fill in "email_template_subject" with "Confirmation message corrected"
  And I fill in "email_template_body_editor" ckeditor with "Confirmation message corrected body"
  Then I press translated "administration.email_templates.edit.view.button_update"
  And I should see translated "flash.email_templates.update.notice"

@_done @_tested @selenium
Scenario: I can edit and update email template fields for different language when I switch interface language
  Given email "confirmation_instructions" has translation for lang "da" with attributes "subject:Bekraeftelse instruktioner"
  Then I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
  And the "email_template_subject" field should contain "Confirmation instructions"
  Then I click hidden link by url regex "/locales\/da/"
  And I go to administration email templates
  Then I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
  And the "email_template_subject" field should contain "Bekraeftelse instruktioner"
  And I fill in "email_template_subject" with "Confirmation message corrected"
  And I fill in "email_template_body_editor" ckeditor with "Confirmation message corrected body"
  Then I press translated "administration.email_templates.edit.view.button_update"


@m4 @tgn @_done @non_testable
Scenario: I should be able to edit email templates using WYSIWYG editor and applying basic styling

#5931
#new template in seed as default send material email template should be created
@m12 @$_admin @ao @_done @_tested
Scenario: I can edit email template for send material result type
  Then I should see "Additional materials"
  And I should see "result_send_material"

@m13 @_requested @auto_buy @is @_done @_tested
Scenario: I can edit global email template to be sent when lead is bought
  Then I should see "Bought lead notification"

# @m13 @_requested @auto_buy @is @_done @_tested @_deprecated2014
# Scenario: I can edit category specific email template to be sent when lead is bought
#   Then I follow translated "layout.main_menu.shared.browse_leads"
#   When I uncheck "search_with_unique"
#   And I uncheck "search_with_public"
#   And I fill in "search_with_keyword" with "electronics"
#   Then I press translated "administration.categories.index.view.search.search_button"
#   Then category "Electronics" has email template - "No"
#   Then I follow translated "administration.categories.index.view.edit_link"
#   Then I should see "Electronics"
#   And I follow translated "administration.categories.edit.view.edit_email_template"
#   Then I press translated "administration.email_templates.edit.view.button_update"
#   Then I should see translated "administration.category_email_templates.update.controller.successful_update_notice"
#   Then category "Electronics" has email template - "Yes"

@m17 @_requested @email_signature @is @_done @_tested @selenium
Scenario: For each country I can specify email signature
  Then I click hidden link by url regex "/administration\/countries/"
  And display all hidden actions
  Then I follow translated "administration.countries.index.view.edit" within "#country_actions_td_United_Kingdom"
  And I wait 3 second
  And I fill in "country_email_template_signature_attributes_body" ckeditor with "some signature no 3928"
  Then I press translated "administration.countries.edit.view.button_update_country"
  Then I send email using email template "certification_request" for email address "john@rambo.pl"
  Then last email sent should have content "some signature no 3928"
  Then I follow edit for email template named "certification_request"
  And I check "email_template_enable_custom_signature"
  And I wait 3 second
  And I fill in "email_template_email_template_signature_attributes_body" ckeditor with "some signature that is custom 323"
  And I press translated "administration.email_templates.edit.view.button_update"
  Then I send email using email template "certification_request" for email address "john@rambo.pl"
  Then last email sent should have content "some signature that is custom 323"

@m17 @_requested @email_signature @is @_done @tested_elsewhere
Scenario: The email signature should include Fairleads logo

#8823
@m25 @_requested @_done @is @_tested_elsewhere
Scenario: Every email should have a list of all variables that can used within its body

#8823
@m25 @_requested @_done @tgn @_non_testable
Scenario: I choose available variables from the ckeditor popup

@m30 @_requested @_done @_tested_elsewhere @tgn
Scenario: I can customize signature for each email template

@m30 @_requested @_done @_tested_elsewhere @tgn
Scenario: Customized email template signature has priority over country signature
