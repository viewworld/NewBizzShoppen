@purchase_manager @m3 @ao @noguess
Feature: Lead creation by Purchase Manager

In order to create and manage leads I sell
As a Purchase Manager
I can use my purchase manager panel

Background:
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role purchase_manager
    And I am on the homepage
    And I make sure current locale is English
    Then I sign in as jon@lajoie.ca with password secret
    And I go to purchase managers leads

@added @_done @selenium @selenium
Scenario: I can create a new lead and close
  Given Category PMCategory is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with "2012-02-20"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should be on purchase managers leads
  And I should see translated "flash.leads.actions.create.notice"

@added @_done @selenium
Scenario: I can create a new lead and continue (create another one)
  Given Category PMCategory is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with "2012-02-20"
  And I press translated "purchase_manager.leads.new.view.button_create_and_continue"
  And I should see translated "flash.leads.actions.create.notice"
  And I should see translated "purchase_manager.leads.new.view.title"

@added @selenium @_done
Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc but no hidden desc
  Given Category PMCategory is created
  And Country Denmark is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with date that is "5" days from now
  And I select translated "models.locale.dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should be on purchase managers leads
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
  And I should see "DK description"

@added @_done @selenium
Scenario: Contact information should be prepopulated
  Given Category PMCategory is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  Then the "lead_email_address" field should contain "jon@lajoie.ca"
  And the "lead_contact_name" field should contain any value
  And the "lead_phone_number" field should contain any value
  And the "lead_address_line_1" field should contain any value
  And the "lead_city" field should contain any value
  And the "lead_county" field should contain any value
  And the "lead_zip_code" field should contain any value

@added @_done @selenium
Scenario: Published checkbox should not be visible
  Given Category PMCategory is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  Then I should not see field "lead_published"

@added @_done @selenium
Scenario: Hidden description should not be visible
  Given Category PMCategory is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  Then I should not see field "lead_hidden_description"

@added @_done @selenium
Scenario: Created leads should not be published (not listed)
  Given Category PMCategory is created
  And Country Denmark is created
  And I go to purchase managers leads
  And I select "PMCategory" from "category_id"
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I am on browse leads
  And I follow "PMCategory"
  Then I should see translated "common.nothing_to_display"

@m5 @added @lead_templates @tgn @selenium @_tested
Scenario: I have to fill out the templates which are mandatory
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
  And I go to purchase managers leads
  And I select "Computers" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

@m5 @added @lead_templates @tgn @selenium @_tested
Scenario: I can select additional templates that are optional
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
  Given template named "Fax details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Fax details" is not mandatory
  And template named "Fax details" has following fields "fax software version:false:false, date of purchase:false:false"
  And I go to purchase managers leads
  And I select "Computers" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  Then I select "Fax details" from "optional_templates_picker"
  And I fill in "lead_lead_template_values_attributes_2_value" with "FaxFree v3"
  And I fill in "lead_lead_template_values_attributes_3_value" with "21-01-2010"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
  And the "lead_lead_template_values_attributes_2_value" field should contain "FaxFree v3"
  And the "lead_lead_template_values_attributes_3_value" field should contain "21-01-2010"

@m5 @added @lead_templates @selenium @tgn @_tested
Scenario: Lead templates for given category consist of my templates, admin's and global
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" is mandatory
  Given template named "Modems details" for category "Computers" is created by user "other_agent@person.com" with role "agent"
  And template named "Modems details" is mandatory
  Given template named "Fax details" for category "Computers" is created by user "other_agent@person.com" with role "agent"
  And template named "Fax details" is mandatory
  And template named "Fax details" is global
  Given template named "Monitors details" for category "Computers" is created by user "call_centre@person.com" with role "call_centre"
  And template named "Monitors details" is mandatory
  Given template named "Phones details" for category "Computers" is created by user "admin111@person.com" with role "admin"
  And template named "Phones details" is mandatory
  And I go to purchase managers leads
  And I select "Computers" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  Then I should see "Computers details"
  And I should see "Phones details"
  And I should see "Fax details"
  And I should not see "Modems details"
  And I should not see "Monitors details"

@m5 @added @lead_templates @tgn @selenium @_tested
Scenario: Lead templates for given category consists of templates from that category parents
  Given Category Computers is created
  And Category named "Modems" already exists within category named "Computers"
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" is mandatory
  Given template named "Modems details" for category "Modems" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Modems details" is mandatory
  And I go to purchase managers leads
  And I select "Modems" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  Then I should see "Computers details"
  And I should see "Modems details"

@m5 @added @lead_templates @tgn @selenium @_tested
Scenario: When new translation to lead is added I can also write translation for the templates
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
  And I go to purchase managers leads
  And I select "Computers" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I select translated "models.locale.dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" with "123 translated"
  And I fill in "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" with "Ms Windows Vista translated"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
  And the "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" field should contain "123 translated"
  And the "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" field should contain "Ms Windows Vista translated"

@m5 @added @lead_templates @tgn @selenium @_tested
Scenario: I have to fill out the fields that are mandatory in mandatory or optional template
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true, purchase date:false:false"
  And I go to purchase managers leads
  And I select "Computers" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

@m5 @added @lead_templates @tgn @selenium @_tested
Scenario: When there is only one template present for a lead and it is optional then it should be displayed by default
  Given template named "Computers details" for category "Computers" is created by user "jon@lajoie.ca" with role "purchase_manager"
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true, purchase date:false:false"
  And template named "Computers details" is not mandatory
  And I go to purchase managers leads
  And I select "Computers" from "category_id"
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "United Kingdom" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"

@m6
Scenario: I should see hint for every field when creating a lead