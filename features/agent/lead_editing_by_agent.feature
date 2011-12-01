@lead_manager @$_freelance_agent @m1 @faircalls
Feature: Lead editing by agent

Background:
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I make sure current locale is "en"
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And lead New lead is created by user bob@person.com with role agent
    And a lead New lead exists within category Computers and is bought by user john.buyer@person.com with role supplier
    Then I sign in as bob@person.com with password supersecret
    And I go to agents leads

@_tested @_done
Scenario: I can edit lead
  When I follow translated "agent.leads.index.view.edit"
  And I fill in "lead_header" with "New lead updated"
  And I press translated "agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.update.notice"

@_tested @selenium @_done
Scenario: I can add a language - title, purchase, hidden, language
  Given I go to agents leads
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I select translated "models.locale.da" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "agent.leads.edit.view.button_update"
  Then I should see translated "flash.leads.update.notice"

@_tested @selenium @_done
Scenario: I can delete a language
  Given I go to agents leads
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I select translated "models.locale.da" from "locale_picker"
  Then I follow translated "agent.leads.new.view.remove_language"
  And I select translated "models.locale.da" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  Then I press translated "agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I follow translated "agent.leads.new.view.remove_language"
  Then I press translated "agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I should not see "DK hidden description"

@_tested @noguess @_done
Scenario: When the lead is bought and I want to edit it then "Notify the lead buyers" checkbox is present
  Given I go to agents leads
  And I follow translated "agent.leads.index.view.edit"
  Then I should see translated "activerecord.attributes.lead.notify_suppliers_after_update"

@m3 @tgn @_tested @noguess @_done
Scenario: When the lead is bought and I update it and check "Notify the lead buyers" then email is sent to all buyers
  Given I go to agents leads
  And I follow translated "agent.leads.index.view.edit"
  Then I press translated "agent.leads.edit.view.button_update"
  And last email sent should have been sent to recipient "john.buyer@person.com"
  And last email sent should have content "has been updated by agent"

@_tested @_done
Scenario: Datepicker - after selecting form the select box it should automatically fill in the date
  Given I go to agents leads
  Then I follow translated "agent.leads.index.view.edit"
  And I fill in "datepicker" with "2010-01-01"

@m5 @added @lead_templates @selenium @tgn @_tested @_done
Scenario: I have to fill out the templates which are mandatory
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false, operating systems:false"
  And I go to agents leads
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  Then I press translated "agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

@m5 @added @lead_templates @selenium @tgn @_tested @_done
Scenario: I can select additional templates that are optional
  Given template named "Fax details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Fax details" is not mandatory
  And template named "Fax details" has following fields "fax software version:false, date of purchase:false"
  And I go to agents leads
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I fill in "lead_lead_template_values_attributes_0_value" with "FaxFree v3"
  And I fill in "lead_lead_template_values_attributes_1_value" with "21-01-2010"
  And I select "United Kingdom" from "lead_country_id"
  And I fill in "lead_phone_number" with "1234"
  And I select "2" from "lead_sale_limit"
  Then I press translated "agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "FaxFree v3"
  And the "lead_lead_template_values_attributes_1_value" field should contain "21-01-2010"

@m5 @added @lead_templates @selenium @tgn @_tested @_done
Scenario: When new translation to lead is added I can also write translation for the templates
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false, operating systems:false"
  And I go to agents leads
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I select translated "models.locale.da" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I fill in "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" with "123 translated"
  And I fill in "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" with "Ms Windows Vista translated"
  Then I press translated "agent.leads.edit.view.button_update"
  And I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
  And the "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" field should contain "123 translated"
  And the "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" field should contain "Ms Windows Vista translated"
  
@m5 @tgn @_tested @_done
Scenario: I can edit my leads from any page where it's presented
  When I go to browse leads
  And I follow category "Computers"
  Then I follow translated "leads.listing.edit_label"
  And I should see translated "agent.leads.edit.view.title" with options "name:New lead"
  #Deprecated since there are no leads box when agent is signed in
  #When I go to agent home
  #Then I follow translated "leads.listing.edit_label"
  #And I should see translated "agent.leads.edit.view.title" with options "name:New lead"

@m5 @added @tgn @non_testable @_done
Scenario: Lead data should be entered in given sequence