@lead_templates @$_admin @m5 @tgn
Feature: Category lead templates management

Background: Set English locale and login
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is English
  Given there are no categories
  Then I sign in as bob@person.com with password supersecret
  And I go to administration categories

@added @selenium @_tested
Scenario: I can create a category and add new lead templates to it which I can mark as mandatory or optional
  When I follow translated "administration.categories.index.view.new_category"
  And I fill in "category_name" with "Test category"
  And I fill in "category_description" with "Description"
  And attach the file "sample image" to "category_image_attributes_asset"
  Then I press translated "administration.categories.new.view.button_create"
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.new_template"
  And I fill in "lead_template_name" with "Example of template"
  And I check "lead_template_is_mandatory"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
  And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
  And I check "lead_template_lead_template_fields_attributes_1_is_mandatory"
  Then I press translated "administration.lead_templates.new.view.button_create"
  And I should see "Editing category: Test category"
  And I should see "Example of template"

@added @selenium @_tested
Scenario: I can edit a category and add new lead templates to it which I can mark as mandatory or optional
  Given Category named "Vehicles" already exists
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.new_template"
  And I fill in "lead_template_name" with "Example of template"
  And I check "lead_template_is_mandatory"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
  And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
  And I check "lead_template_lead_template_fields_attributes_1_is_mandatory"
  Then I press translated "administration.lead_templates.new.view.button_create"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  Then the "lead_template_lead_template_fields_attributes_0_name" field should contain "example attr 1"
  Then the "lead_template_lead_template_fields_attributes_1_name" field should contain "example attr 2"

@added @_tested
Scenario: I can mark templates as mandatory or optional for given category even if they were created by agents
  Given template named "Computer details" for category "Computers" is created by user "agent.jim@person.com" with role "agent"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.edit_template"
  And I should not see translated "shared.lead_templates.form.new_lead_template_field"
  And I check "lead_template_is_mandatory"
  And I press translated "administration.lead_templates.edit.view.button_update"
  Then I follow translated "administration.categories.edit.view.edit_template"
  And the "lead_template_is_mandatory" checkbox should be checked

@added @selenium @_tested
Scenario: I can edit lead templates that were created by me
  Given template named "Computer details" for category "Computers" is created by user "bob@person.com" with role "admin"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  And I should see translated "shared.lead_templates.form.new_lead_template_field"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
  And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
  Then I press translated "administration.lead_templates.edit.view.button_update"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  Then the "lead_template_lead_template_fields_attributes_0_name" field should contain "example attr 1"
  Then the "lead_template_lead_template_fields_attributes_1_name" field should contain "example attr 2"

@added @_tested
Scenario: I can delete lead templates that were created by me and were not filled out by anyone
  Given template named "Computer details" for category "Computers" is created by user "bob@person.com" with role "admin"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.destroy_template"
  Then I should see translated "administration.lead_templates.destroy.flash.deletion_successful"
  Given template named "Computer details" for category "Computers" is created by user "agent.jim@person.com" with role "agent"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.destroy_template"
  Then I should see translated "administration.lead_templates.destroy.flash.deletion_failure"

@added @_done @tested_elsewhere
Scenario: During template creation/edition I can mark fields as hidden or public

@added @_done @tested_elsewhere
Scenario: During template creation/editon I can mark fields as mandatory or optional

@added @_tested
Scenario: I can promote any lead template to global template
  Given template named "Computer details" for category "Computers" is created by user "agent.jim@person.com" with role "agent"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  And I check "lead_template_is_global"
  Then I press translated "administration.lead_templates.edit.view.button_update"

