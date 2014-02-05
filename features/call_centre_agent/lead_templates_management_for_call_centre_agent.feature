@lead_templates @m5 @$_call_centre_agent @tgn  @_requested @faircalls
Feature: Lead templates managements for call centre agent

  Background:
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I make sure current locale is "en"
    And I have user with email call_centre91@nbs.com and role call_centre
    And I have user with email other_call_centre@nbs.com and role call_centre
    And I am signed up and confirmed as user with email call_centre_agent@person.com and password supersecret and role call_centre_agent
    And an user with role call_centre_agent and email call_centre_agent@person.com belongs to call centre call_centre91@nbs.com
    Then I sign in as call_centre_agent@person.com with password supersecret

  # @added @_tested @_done @_deprecated2014
  # Scenario: I can list all lead templates that were created by me
  #   Given template named "Computer details" for category "Computers" is created by user "other_agent@nbs.com" with role "call_centre_agent"
  #   Given template named "Printers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  #   Given template named "Modems details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  #   And I go to browse leads
  #   And I follow translated "categories.index.view.view_lead_templates"
  #   And I select "" from "search_with_category"
  #   And I press translated "call_centre_agent.lead_templates.index.view.search_button"
  #   Then I should see "Printers details"
  #   Then I should see "Modems details"
  #   Then I should not see "Computer details"

  @added @selenium @_tested @_done
  Scenario: I can create new lead template for given category
    Given I go to browse leads
    Then I follow translated "categories.index.view.view_lead_templates"
    And I follow translated "call_centre_agent.lead_templates.index.view.new_template"
    Then I fill in "lead_template_name" with "Computer details"
    And I check "lead_template_is_mandatory"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
    And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
    And I check "lead_template_lead_template_fields_attributes_1_is_mandatory"
    Then I press translated "call_centre_agent.lead_templates.new.view.button_create"
    And I click hidden link by url regex "/call_centre_agents\/lead_templates\/\d+\/edit/"
    Then the "lead_template_lead_template_fields_attributes_0_name" field should contain "example attr 1"
    And the "lead_template_lead_template_fields_attributes_1_name" field should contain "example attr 2"

  @added @_done @_tested_elsewhere
  Scenario: During template creation/edition I can mark fields as hidden or public

    @added @_done @_tested_elsewhere
  Scenario: During template creation/editon I can mark fields as mandatory or optional

    @added @selenium @_tested @_done
  Scenario: I can edit lead template that was created by me
    Given template named "Printers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
    And I go to browse leads
    And I follow translated "categories.index.view.view_lead_templates"
    And I select "Computers" from "search_with_category"
    And I press translated "call_centre_agent.lead_templates.index.view.search_button"
    And I click hidden link by url regex "/call_centre_agents\/lead_templates\/\d+\/edit/"
    And I should see translated "shared.lead_templates.form.new_lead_template_field"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
    And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
    And I check "lead_template_lead_template_fields_attributes_1_is_mandatory"
    Then I press translated "call_centre_agent.lead_templates.edit.view.button_update"
    And I click hidden link by url regex "/call_centre_agents\/lead_templates\/\d+\/edit/"
    Then the "lead_template_lead_template_fields_attributes_0_name" field should contain "example attr 1"
    Then the "lead_template_lead_template_fields_attributes_1_name" field should contain "example attr 2"

  # @added @_tested @_done @_deprecated2014
  # Scenario: I can delete lead template that was created by me and was not filled out by anyone
  #   Given template named "Printers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  #   And I go to browse leads
  #   And I follow translated "categories.index.view.view_lead_templates"
  #   And I select "Computers" from "search_with_category"
  #   And I press translated "call_centre_agent.lead_templates.index.view.search_button"
  #   And I follow translated "call_centre_agent.lead_templates.index.view.destroy"
  #   Then I should see translated "call_centre_agent.lead_templates.destroy.flash.deletion_successful"
  #   Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  #   And template named "Computers details" is filled out by someone
  #   And I go to browse leads
  #   And I follow translated "categories.index.view.view_lead_templates"
  #   And I select "Computers" from "search_with_category"
  #   And I press translated "call_centre_agent.lead_templates.index.view.search_button"
  #   And I follow translated "call_centre_agent.lead_templates.index.view.destroy"
  #   Then I should see translated "call_centre_agent.lead_templates.destroy.flash.deletion_failure"

  @added @_tested @selenium @_done
  Scenario: I can add translation for the lead template name and its fields
    Given I click hidden link by url regex "/locales\/da/"
    Given I go to browse leads
    And I follow translated "categories.index.view.view_lead_templates"
    And I follow translated "call_centre_agent.lead_templates.index.view.new_template"
    Then I fill in "lead_template_name" with "Computer details"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
    And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
    Then I press translated "call_centre_agent.lead_templates.new.view.button_create"
    And I click hidden link by url regex "/call_centre_agents\/lead_templates\/\d+\/edit/"
    Then the "lead_template_lead_template_fields_attributes_0_name" field should contain "example attr 1"
    And the "lead_template_lead_template_fields_attributes_1_name" field should contain "example attr 2"

  # @m6 @tgn @_tested @_done @_deprecated2014
  # Scenario: Make it possible to duplicate lead templates (from lead templates listings)
  #   Given template named "Computer details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  #   And template named "Computer details" is mandatory
  #   And template named "Computer details" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"
  #   And I go to browse leads
  #   And I follow translated "categories.index.view.view_lead_templates"
  #   And I select "Computers" from "search_with_category"
  #   And I press translated "call_centre_agent.lead_templates.index.view.search_button"
  #   And I follow translated "call_centre_agent.lead_templates.index.view.duplicate"
  #   Then the "lead_template_name" field should contain "Computer details"
  #   And checkbox named "lead_template_is_mandatory" should be checked
  #   And the "lead_template_lead_template_fields_attributes_0_name" field should contain "field #1"
  #   And the "lead_template_lead_template_fields_attributes_1_name" field should contain "field #2"
  #   And the "lead_template_lead_template_fields_attributes_2_name" field should contain "field #3"
  #   And checkbox named "lead_template_lead_template_fields_attributes_0_is_hidden" should be checked
  #   And checkbox named "lead_template_lead_template_fields_attributes_1_is_hidden" should be checked
  #   And checkbox named "lead_template_lead_template_fields_attributes_2_is_hidden" should not be checked
  #   And checkbox named "lead_template_lead_template_fields_attributes_0_is_mandatory" should be checked
  #   And checkbox named "lead_template_lead_template_fields_attributes_1_is_mandatory" should not be checked
  #   And checkbox named "lead_template_lead_template_fields_attributes_2_is_mandatory" should not be checked
