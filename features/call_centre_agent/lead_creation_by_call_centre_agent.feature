@lead_manager @$_call_centre_agent @m5 @tgn @faircalls
Feature: Lead creation by call centre agent

Background:  Sign in user and set locale
  Given I am on the homepage
  And I visit domain http://faircalls.eu
  And I make sure current locale is "en"
  And I have user with email call_centre@person.com and role call_centre
  And I am signed up and confirmed as user with email call_centre_agent@person.com and password supersecret and role call_centre_agent
  And an user with role call_centre_agent and email call_centre_agent@person.com belongs to call centre call_centre@person.com
  Then I sign in as call_centre_agent@person.com with password supersecret

@_tested @selenium @_done
Scenario: I can create a new lead and close
  Given Category Test category 1 is created
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Test category 1" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "call_centre_agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"

@_tested @selenium @_done
Scenario: I can create a new lead and continue (create another one)
  Given Category Test category 1 is created
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Test category 1" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "call_centre_agent.leads.new.view.button_create_and_continue"
  And I should see translated "flash.leads.create.notice"
  And I should see translated "call_centre_agent.leads.new.view.title"

# @_tested @selenium @_done @_deprecated2014
# Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc, hidden desc
#   Given Category Test category 1 is created
#   And Country Denmark is created
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   And I select "Test category 1" from "category_id"
#   Given I follow translated "call_centre_agent.leads.index.view.new_lead"
#   And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
#   And I fill in "lead_description" with "Lorem ipsum"
#   And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
#   And I fill in "lead_purchase_value" with "10000"
#   And I fill in "lead_price" with "100"
#   And I select "3" from "lead_sale_limit"
#   And I select "Denmark" from "lead_country_id"
#   And I fill in "lead_company_name" with "Printing company"
#   And I fill in "lead_contact_name" with "Marek Kowalski"
#   And I fill in "lead_phone_number" with "123456789"
#   And I fill in "lead_email_address" with "my@email.com"
#   And I fill in "lead_address_line_1" with "Kaminskiego 19"
#   And I fill in "lead_address_line_3" with "Bielsko-Biała"
#   And I fill in "lead_zip_code" with "23-2911"
#   And I fill in "datepicker" with date that is "5" days from now
#   And I select translated "models.locale.da" from "locale_picker"
#   And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
#   And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
#   And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
#   And I press translated "call_centre_agent.leads.new.view.button_create"
#   And I should see translated "flash.leads.create.notice"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And I should see "DK description"
#   And I should see "DK hidden description"

# @m5 @added @lead_templates @tgn @selenium @_tested @_done @_deprecated2014
# Scenario: I have to fill out the templates which are mandatory
#   Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
#   And template named "Computers details" is mandatory
#   And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   And I select "Computers" from "category_id"
#   And I follow translated "call_centre_agent.leads.index.view.new_lead"
#   And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
#   And I fill in "lead_description" with "Lorem ipsum"
#   And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
#   And I fill in "lead_purchase_value" with "10000"
#   And I fill in "lead_price" with "100"
#   And I select "3" from "lead_sale_limit"
#   And I select "Denmark" from "lead_country_id"
#   And I fill in "lead_contact_name" with "Marek Kowalski"
#   And I fill in "lead_phone_number" with "123456789"
#   And I fill in "lead_company_name" with "Printing company"
#   And I fill in "lead_address_line_1" with "Kaminskiego 19"
#   And I fill in "lead_address_line_3" with "Bielsko-Biała"
#   And I fill in "lead_zip_code" with "23-2911"
#   And I fill in "datepicker" with date that is "5" days from now
#   And I fill in "lead_lead_template_values_attributes_0_value" with "123"
#   And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
#   And I press translated "call_centre_agent.leads.new.view.button_create"
#   And I should see translated "flash.leads.create.notice"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "123"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

# @m5 @added @lead_templates @tgn @selenium @_tested @_done @_deprecated2014
# Scenario: I can select additional templates that are optional
#   Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
#   And template named "Computers details" is mandatory
#   And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
#   Given template named "Fax details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
#   And template named "Fax details" is not mandatory
#   And template named "Fax details" has following fields "fax software version:false:false, date of purchase:false:false"
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   And I select "Computers" from "category_id"
#   And I follow translated "call_centre_agent.leads.index.view.new_lead"
#   And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
#   And I fill in "lead_description" with "Lorem ipsum"
#   And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
#   And I fill in "lead_purchase_value" with "10000"
#   And I fill in "lead_price" with "100"
#   And I select "3" from "lead_sale_limit"
#   And I select "Denmark" from "lead_country_id"
#   And I fill in "lead_contact_name" with "Marek Kowalski"
#   And I fill in "lead_phone_number" with "123456789"
#   And I fill in "lead_company_name" with "Printing company"
#   And I fill in "lead_address_line_1" with "Kaminskiego 19"
#   And I fill in "lead_address_line_3" with "Bielsko-Biała"
#   And I fill in "lead_zip_code" with "23-2911"
#   And I fill in "datepicker" with date that is "5" days from now
#   And I fill in "lead_lead_template_values_attributes_0_value" with "123"
#   And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
#   Then I select "Fax details" from "optional_templates_picker"
#   And I fill in "lead_lead_template_values_attributes_2_value" with "FaxFree v3"
#   And I fill in "lead_lead_template_values_attributes_3_value" with "21-01-2010"
#   And I press translated "call_centre_agent.leads.new.view.button_create"
#   And I should see translated "flash.leads.create.notice"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "123"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
#   And the "lead_lead_template_values_attributes_2_value" field should contain "FaxFree v3"
#   And the "lead_lead_template_values_attributes_3_value" field should contain "21-01-2010"

@m5 @added @lead_templates @selenium @tgn @_tested @_done
Scenario: Lead templates for given category consist of my templates, my call centre's, admin's and global
  Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  And template named "Computers details" is mandatory
  Given template named "Modems details" for category "Computers" is created by user "other_agent@person.com" with role "agent"
  And template named "Modems details" is mandatory
  Given template named "Fax details" for category "Computers" is created by user "other_agent2@person.com" with role "agent"
  And template named "Fax details" is mandatory
  And template named "Fax details" is global
  Given template named "Monitors details" for category "Computers" is created by user "call_centre@person.com" with role "call_centre"
  And template named "Monitors details" is mandatory
  Given template named "Phones details" for category "Computers" is created by user "admin111@person.com" with role "admin"
  And template named "Phones details" is mandatory
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Computers" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  Then I should see "Computers details"
  And I should see "Phones details"
  And I should see "Monitors details"
  And I should see "Fax details"
  And I should not see "Modems details"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: I can use lead templates that were created by other agents that belongs to my call centre
  Given I have user with email other_call_centre@person.com and role call_centre
  Given template named "Computers details" for category "Computers" is created by user "other_call_centre_agent1@person.com" with role "call_centre_agent"
  And an user with role call_centre_agent and email other_call_centre_agent1@person.com belongs to call centre call_centre@person.com
  Given template named "Fax details" for category "Computers" is created by user "other_call_centre_agent2@person.com" with role "call_centre_agent"
  And an user with role call_centre_agent and email other_call_centre_agent2@person.com belongs to call centre call_centre@person.com
  Given template named "Modems details" for category "Computers" is created by user "other_call_centre_agent3@person.com" with role "call_centre_agent"
  And an user with role call_centre_agent and email other_call_centre_agent3@person.com belongs to call centre other_call_centre@person.com
  Given template named "TV details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  Then I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Computers" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  Then "optional_templates_picker" dropdown should have values "Computers details,Fax details,TV details"
  And "optional_templates_picker" dropdown should not have values "Modems details"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: I do not see lead templates created by my call centre that are marked as inactive
  Given template named "TV details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  And template named "TV details" is mandatory
  Given template named "Fax details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  And template named "Fax details" is mandatory
  And template named "Fax details" is not active
  Then I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Computers" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  And I should see "TV details"
  And I should not see "Fax details"

# @m5 @added @lead_templates @tgn @selenium @_tested @_done @_deprecated2014
# Scenario: When new translation to lead is added I can also write translation for the templates
#   Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
#   And template named "Computers details" is mandatory
#   And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   And I select "Computers" from "category_id"
#   And I follow translated "call_centre_agent.leads.index.view.new_lead"
#   And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
#   And I fill in "lead_description" with "Lorem ipsum"
#   And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
#   And I fill in "lead_purchase_value" with "10000"
#   And I fill in "lead_price" with "100"
#   And I select "3" from "lead_sale_limit"
#   And I select "Denmark" from "lead_country_id"
#   And I fill in "lead_contact_name" with "Marek Kowalski"
#   And I fill in "lead_phone_number" with "123456789"
#   And I fill in "lead_company_name" with "Printing company"
#   And I fill in "lead_address_line_1" with "Kaminskiego 19"
#   And I fill in "lead_address_line_3" with "Bielsko-Biała"
#   And I fill in "lead_zip_code" with "23-2911"
#   And I fill in "datepicker" with date that is "5" days from now
#   And I fill in "lead_lead_template_values_attributes_0_value" with "123"
#   And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
#   And I select translated "models.locale.da" from "locale_picker"
#   And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
#   And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
#   And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
#   And I fill in "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" with "123 translated"
#   And I fill in "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" with "Ms Windows Vista translated"
#   And I press translated "call_centre_agent.leads.new.view.button_create"
#   And I should see translated "flash.leads.create.notice"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "123"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
#   And the "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" field should contain "123 translated"
#   And the "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" field should contain "Ms Windows Vista translated"

# @m5 @added @lead_templates @tgn @selenium @_tested @_done @_deprecated2014
# Scenario: I have to fill out the fields that are mandatory in mandatory or optional template
#   Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
#   And template named "Computers details" is mandatory
#   And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true, purchase date:false:false"
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   And I select "Computers" from "category_id"
#   And I follow translated "call_centre_agent.leads.index.view.new_lead"
#   And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
#   And I fill in "lead_description" with "Lorem ipsum"
#   And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
#   And I fill in "lead_purchase_value" with "10000"
#   And I fill in "lead_price" with "100"
#   And I select "3" from "lead_sale_limit"
#   And I select "Denmark" from "lead_country_id"
#   And I fill in "lead_contact_name" with "Marek Kowalski"
#   And I fill in "lead_phone_number" with "123456789"
#   And I fill in "lead_company_name" with "Printing company"
#   And I fill in "lead_address_line_1" with "Kaminskiego 19"
#   And I fill in "lead_address_line_3" with "Bielsko-Biała"
#   And I fill in "lead_zip_code" with "23-2911"
#   And I fill in "datepicker" with date that is "5" days from now
#   And I fill in "lead_lead_template_values_attributes_0_value" with "123"
#   And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
#   And I press translated "call_centre_agent.leads.new.view.button_create"
#   And I should see translated "flash.leads.create.notice"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "123"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: When there is only one template present for a lead and it is optional then it should be displayed by default
  Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true, purchase date:false:false"
  And template named "Computers details" is not mandatory
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Computers" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "United Kingdom" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I press translated "call_centre_agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"

# @m5 @added @tgn @non_testable @_done @_deprecated2014-blank
# Scenario: Lead data should be entered in given sequence

# @m5 @unique_categories @added @_tested @_done @_deprecated2014
# Scenario: I can't publish a lead in unique category if I'm not assigned to it
#   Given there are no categories
#   And Category Test category 1 is created
#   And Category Agent Unique Category is created
#   And category "Agent Unique Category" is unique for user with email "call_centre_agent@person.com" role "call_centre_agent"
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   Then "category_id" dropdown should have values "Test category 1,Agent Unique Category"

# @m5 @unique_categories @added @_tested @_done @_deprecated2014
# Scenario: I can publish leads only in unique categories if I'm assigned at least to one
#   Given there are no categories
#   And Category Test category 1 is created
#   And Category Agent Unique Category is created
#   And category "Agent Unique Category" is unique for user with email "call_centre_agent@person.com" role "call_centre_agent"
#   Given I have user with email other_call_centre_agent@nbs.com and role call_centre_agent
#   And Category Other Agent Unique Category is created
#   And category "Other Agent Unique Category" is unique for user with email "other_call_centre_agent@nbs.com" role "call_centre_agent"
#   And I follow translated "layout.main_menu.call_centre_agent.leads"
#   Then "category_id" dropdown should have values "Test category 1,Agent Unique Category"
#   And "category_id" dropdown should not have values "Other Agent Unique Category"

@m6 @tgn @_tested @added @lead_templates @selenium @_done
Scenario: When the template's field is of the note type then I should see textarea instead of textbox
  Given template named "Computers details" for category "Computers" is created by user "call_centre_agent@person.com" with role "call_centre_agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true:3, purchase date:false:false"
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Computers" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  Then field "lead_lead_template_values_attributes_1_value" is of textarea type

@m6 @tgn @selenium @_tested @_done
Scenario: I should see hint for every field when creating a lead
  Given Category Test category 1 is created
  And article hint for model "Lead" and method "company_name" has attributes "published:true, content:Tooltip for company name"
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I should see CSS path "p[class*='inline-hints']"

@m6 @tgn @_tested @selenium @_done
Scenario: I have already filled in international dialling codes for telephone numbers (+xx) (xxxxxxxxxxxxxxxxxxxxxx)
  Given Category Test category 1 is created
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I select "Denmark" from "lead_country_id"
  Then the "lead_direct_phone_number" field should contain "\+45"
  And the "lead_phone_number" field should contain "\+45"
  And I press translated "agent.leads.new.view.button_create"
  Then the "lead_direct_phone_number" field should contain "\+45"
  And the "lead_phone_number" field should contain "\+45"

@m6 @tgn @selenium @_tested @_done
Scenario: I can choose region during creation of a lead
  Given country "Denmark" has regions "Region #1, Region #2, Region #3"
  And Category Test category 1 is created
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Test category 1" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  And I select "Denmark" from "lead_country_id"
  And I select "Region #2" from "lead_region_id"

# @tgn @_requested @m10 @tgn @lead_templates @selenium @_tested @_done @_deprecated2014
# Scenario: I can change the lead's category even if the templates are filled out (templates should be preserved but hidden)
#   Given Category named "Cat template#1" already exists
#   And Category named "Cat template#1.1" already exists within category named "Cat template#1"
#   And Category named "Cat template#2" already exists within category named "Cat template#1.1"
#   And Category named "Cat template#3" already exists within category named "Cat template#2"
#   Given template named "Cat template#1 details" for category "Cat template#1" is created by user "call_centre@person.com" with role "call_centre"
#   And template named "Cat template#2 details" for category "Cat template#2" is created by user "call_centre@person.com" with role "call_centre"
#   And template named "Cat template#3 details" for category "Cat template#3" is created by user "call_centre@person.com" with role "call_centre"
#   And template named "Cat template#1 details" is mandatory
#   And template named "Cat template#1 details" has following fields "f1:true:true, f2:true:true"
#   And template named "Cat template#2 details" is mandatory
#   And template named "Cat template#2 details" has following fields "f3:true:true, f4:true:true"
#   And template named "Cat template#3 details" is mandatory
#   And template named "Cat template#3 details" has following fields "f5:true:true, f6:true:true"
#   When I follow translated "layout.main_menu.call_centre_agent.leads"
#   And I select "Cat template#1.1" from "category_id"
#   And I follow translated "agent.leads.index.view.new_lead"
#   And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
#   And I fill in "lead_description" with "Lorem ipsum"
#   And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
#   And I fill in "lead_purchase_value" with "10000"
#   And I fill in "lead_price" with "100"
#   And I select "3" from "lead_sale_limit"
#   And I select "United Kingdom" from "lead_country_id"
#   And I fill in "lead_contact_name" with "Marek Kowalski"
#   And I fill in "lead_phone_number" with "123456789"
#   And I fill in "lead_company_name" with "Printing company"
#   And I fill in "lead_address_line_1" with "Kaminskiego 19"
#   And I fill in "lead_address_line_3" with "Bielsko-Biała"
#   And I fill in "lead_zip_code" with "23-2911"
#   And I fill in "datepicker" with date that is "5" days from now
#   And I fill in "lead_lead_template_values_attributes_0_value" with "111"
#   And I fill in "lead_lead_template_values_attributes_1_value" with "222"
#   And I press translated "call_centre_agent.leads.new.view.button_create"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And I select "Cat template#3" from "lead_category_id"
#   And I wait 2 second
#   And the "lead_lead_template_values_attributes_0_value" field should contain "111"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "222"
#   And I fill in "lead_lead_template_values_attributes_2_value" with "333"
#   And I fill in "lead_lead_template_values_attributes_3_value" with "444"
#   And I fill in "lead_lead_template_values_attributes_4_value" with "555"
#   And I fill in "lead_lead_template_values_attributes_5_value" with "666"
#   And I press translated "call_centre_agent.leads.edit.view.button_update"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "111"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "222"
#   And the "lead_lead_template_values_attributes_2_value" field should contain "333"
#   And the "lead_lead_template_values_attributes_3_value" field should contain "444"
#   And the "lead_lead_template_values_attributes_4_value" field should contain "555"
#   And the "lead_lead_template_values_attributes_5_value" field should contain "666"
#   And I select "Cat template#2" from "lead_category_id"
#   And I press translated "call_centre_agent.leads.edit.view.button_update"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "111"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "222"
#   And the "lead_lead_template_values_attributes_2_value" field should contain "333"
#   And the "lead_lead_template_values_attributes_3_value" field should contain "444"
#   And I should not see "Cat template#3 details"
#   And I press translated "call_centre_agent.leads.edit.view.button_update"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And I select "Cat template#3" from "lead_category_id"
#   And I press translated "call_centre_agent.leads.edit.view.button_update"
#   Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
#   And the "lead_lead_template_values_attributes_0_value" field should contain "111"
#   And the "lead_lead_template_values_attributes_1_value" field should contain "222"
#   And the "lead_lead_template_values_attributes_2_value" field should contain "333"
#   And the "lead_lead_template_values_attributes_3_value" field should contain "444"
#   And the "lead_lead_template_values_attributes_4_value" field should contain "555"
#   And the "lead_lead_template_values_attributes_5_value" field should contain "666"
