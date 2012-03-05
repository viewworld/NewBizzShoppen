@lead_templates @$_admin @m5 @tgn  @_requested
Feature: Category lead templates management

Background: Set English locale and login
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  And I am on the homepage
  And I make sure current locale is "en"
  Given there are no categories
  Then I sign in as bob@person.com with password supersecret
  And I go to administration categories

@added @selenium @_tested @_done @tc_file_mgmt
Scenario: I can create a category and add new lead templates to it which I can mark as mandatory or optional
  When I follow translated "administration.categories.index.view.new_category"
  And I fill in "category_name" with "Test category"
  And I fill in "category_description" with "Description"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I select "EUR" from "category_currency_id"
  Then I press translated "administration.categories.new.view.button_create"
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  Then I press translated "administration.categories.index.view.search.search_button"
  When I click hidden link by url regex "/administration\/categories\/\d+\/edit/"
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

@added @selenium @_tested @_done
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

@added @_tested @_done
Scenario: I can mark templates as mandatory or optional for given category even if they were created by agents
  Given template named "Computer details" for category "Computers" is created by user "agent.jim@person.com" with role "agent"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.edit_template"
  And I should see translated "shared.lead_templates.form.new_lead_template_field"
  And I check "lead_template_is_mandatory"
  And I press translated "administration.lead_templates.edit.view.button_update"
  Then I follow translated "administration.categories.edit.view.edit_template"
  And the "lead_template_is_mandatory" checkbox should be checked

@added @selenium @_tested @_done
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

@added @_tested @_done
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

@added @_done @_tested_elsewhere
Scenario: During template creation/edition I can mark fields as hidden or public

@added @_done @_tested_elsewhere
Scenario: During template creation/editon I can mark fields as mandatory or optional

@added @_tested @_done
Scenario: I can promote any lead template to global template
  Given template named "Computer details" for category "Computers" is created by user "agent.jim@person.com" with role "agent"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  And I check "lead_template_is_global"
  Then I press translated "administration.lead_templates.edit.view.button_update"

@m6 @tgn @non_testable @_done
Scenario: When I edit translated fields, try displaying country flag after the field instead of displaying "dk" in front of that particular field

@m6 @tgn @selenium @_tested @_done
Scenario: Add new template field type : Note (multiline text) [The lead template type should allow for long text. Basicly a large input filed for 200 words- like the description type]
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
  And I select translated "models.lead_template_field.field_type.type3" from "lead_template_lead_template_fields_attributes_0_field_type"
  Then I press translated "administration.lead_templates.new.view.button_create"

@m6 @tgn @_tested @_done
Scenario: Make it possible to duplicate lead templates (from lead templates listings)
  Given template named "Computer details" for category "Computers" is created by user "bob@person.com" with role "admin"
  And template named "Computer details" is mandatory
  And template named "Computer details" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"
  And I go to browse leads
  When I uncheck "search_with_unique"
  And I uncheck "search_with_public"
  And I fill in "search_with_keyword" with "computers"
  Then I press translated "administration.categories.index.view.search.search_button"
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.duplicate_template"
  Then the "lead_template_name" field should contain "Computer details"
  And checkbox named "lead_template_is_mandatory" should be checked
  And the "lead_template_lead_template_fields_attributes_0_name" field should contain "field #1"
  And the "lead_template_lead_template_fields_attributes_1_name" field should contain "field #2"
  And the "lead_template_lead_template_fields_attributes_2_name" field should contain "field #3"
  And checkbox named "lead_template_lead_template_fields_attributes_0_is_hidden" should be checked
  And checkbox named "lead_template_lead_template_fields_attributes_1_is_hidden" should be checked
  And checkbox named "lead_template_lead_template_fields_attributes_2_is_hidden" should not be checked
  And checkbox named "lead_template_lead_template_fields_attributes_0_is_mandatory" should be checked
  And checkbox named "lead_template_lead_template_fields_attributes_1_is_mandatory" should not be checked
  And checkbox named "lead_template_lead_template_fields_attributes_2_is_mandatory" should not be checked

# When creating new lead template - display in header for which category it is being created
@ao @_requested @m7 @_done @_tested
Scenario: I can see a category name for which lead temlpate is being created
  Given Category named "Vehicles" already exists
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I follow translated "administration.categories.edit.view.new_template"
  Then I should see "New lead template in category Vehicles"

@tgn @_requested @m10 @tgn @selenium @_tested @_done
Scenario: I can edit any kind of template even created by other users
  Given template named "Computer details" for category "Computers" is created by user "call_centrebiz@person.com" with role "call_centre"
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  And I should see translated "shared.lead_templates.form.new_lead_template_field"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
  And I follow translated "shared.lead_templates.form.new_lead_template_field"
  And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
  And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
  And I uncheck "lead_template_is_active"
  Then I press translated "administration.lead_templates.edit.view.button_update"
  And I click hidden link by url regex "/administration\/lead_templates\/\d+\/edit/"
  Then the "lead_template_lead_template_fields_attributes_0_name" field should contain "example attr 1"
  Then the "lead_template_lead_template_fields_attributes_1_name" field should contain "example attr 2"
