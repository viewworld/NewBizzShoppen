@lead_manager @$_freelance_agent  @m1 @ao @faircalls
Feature: Lead creation by freelance agent

In order to create and manage leads I sell
As an Agent
I can use my agent panel

Background:
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And I am on the homepage
    And I visit domain http://faircalls.eu
    And I make sure current locale is "en"
    Then I sign in as bob@person.com with password supersecret
    And I go to agents leads

@_tested @selenium @_done
Scenario: I can create a new lead and close
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.create.notice"

@_tested @noguess @selenium @_done
Scenario: I can create a new lead and continue (create another one)
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "agent.leads.new.view.button_create_and_continue"
  And I should see translated "flash.leads.create.notice"
  And I should see translated "agent.leads.new.view.title"

@_tested @selenium @noguess @_done
Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc, hidden desc
  Given Category Test category 1 is created
  And Country Denmark is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  Given I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I select translated "models.locale.da" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.create.notice"
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I should see "DK description"
  And I should see "DK hidden description"

@tgn @added @_tested @selenium @m1 @_done
Scenario: Published checkbox should be selected by default
  Given I am not sign in
  And Category Test category 1 is created
  And user bob@person.com with role agent exists with attributes "certification_level:1"
  Then I sign in as bob@person.com with password supersecret
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  Then I follow translated "agent.leads.index.view.new_lead"
  And the "lead_published" checkbox should be checked

@tgn @_tested @selenium @m1 @_done
Scenario: All fields for new lead have to be filled in beside email address
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with ""
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.create.notice"

@m3 @ao @_done @selenium
Scenario: I should be able to specify currency in which Lead will be sold (from dropdown)
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  When I follow translated "agent.leads.index.view.new_lead"
  Then I select "EUR" from "lead_currency_id"

@m3 @tgn @_done @non_testable
Scenario: When lead is published then the published_at time is recorded

@m4 @_tested @tgn @selenium @_done
Scenario: I can add linkedin and facebook links to lead's contact information
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
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
  And I fill in "lead_facebook_url" with "http://www.facebook.com/myfakefacebookprofile"
  And I fill in "lead_linkedin_url" with "http://www.linkedin.com/myfakelinkedinprofile"
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.create.notice"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: I have to fill out the templates which are mandatory
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I press translated "agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: I can select additional templates that are optional
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
  Given template named "Fax details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Fax details" is not mandatory
  And template named "Fax details" has following fields "fax software version:false:false, date of purchase:false:false"
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  Then I select "Fax details" from "optional_templates_picker"
  And I fill in "lead_lead_template_values_attributes_2_value" with "FaxFree v3"
  And I fill in "lead_lead_template_values_attributes_3_value" with "21-01-2010"
  And I press translated "agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
  And the "lead_lead_template_values_attributes_2_value" field should contain "FaxFree v3"
  And the "lead_lead_template_values_attributes_3_value" field should contain "21-01-2010"

@m5 @added @lead_templates @selenium @tgn @_tested @_done
Scenario: Lead templates for given category consist of my templates, my call centre's, admin's and global
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
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
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  Then I should see "Computers details"
  And I should see "Phones details"
  And I should see "Fax details"
  And I should not see "Modems details"
  And I should not see "Monitors details"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: Lead templates for given category consists of templates from that category parents
  Given Category Computers is created
  And Category named "Modems" already exists within category named "Computers"
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  Given template named "Modems details" for category "Modems" is created by user "bob@person.com" with role "agent"
  And template named "Modems details" is mandatory
  And I go to agents leads
  And I select "Modems" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  Then I should see "Computers details"
  And I should see "Modems details"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: When new translation to lead is added I can also write translation for the templates
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:false, operating systems:false:false"
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I select translated "models.locale.da" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I fill in "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" with "123 translated"
  And I fill in "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" with "Ms Windows Vista translated"
  And I press translated "agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"
  And the "lead_lead_template_values_attributes_0_lead_template_value_translations_attributes_0_value" field should contain "123 translated"
  And the "lead_lead_template_values_attributes_1_lead_template_value_translations_attributes_0_value" field should contain "Ms Windows Vista translated"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: I have to fill out the fields that are mandatory in mandatory or optional template
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true, purchase date:false:false"
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_lead_template_values_attributes_0_value" with "123"
  And I fill in "lead_lead_template_values_attributes_1_value" with "Ms Windows Vista"
  And I press translated "agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And the "lead_lead_template_values_attributes_0_value" field should contain "123"
  And the "lead_lead_template_values_attributes_1_value" field should contain "Ms Windows Vista"

@m5 @added @lead_templates @tgn @selenium @_tested @_done
Scenario: When there is only one template present for a lead and it is optional then it should be displayed by default
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true, purchase date:false:false"
  And template named "Computers details" is not mandatory
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
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
  And I press translated "agent.leads.new.view.button_create"
  And I should see translated "flash.leads.create.notice"

@m4 @added @tgn @agent_certification @_tested @selenium @_done
Scenario: I cannot publish leads if my certification level is Not Certified or Locked
  Given Category Test category 1 is created
  And user "bob@person.com" with role "agent" has attributes "certification_level:0"
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  Then I should not see "Published"

@m5 @added @tgn @non_testable @_done
Scenario: Lead data should be entered in given sequence

@m5 @added @tgn @_tested @selenium @_done
Scenario: I can add contact direct phone number, company phone number, company ean number, contact direct phone number, country is international, company website
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  When I follow translated "agent.leads.index.view.new_lead"
  Then I fill in "lead_company_phone_number" with "34234234234234"
  Then I fill in "lead_company_website" with "http://falsecompanyurl.com"
  Then I fill in "lead_company_ean_number" with "ERH342342342342"
  Then I fill in "lead_direct_phone_number" with "424234324234"
  Then I select translated "shared.leads.form.country_international" from "lead_is_international"

@m5 @added @tgn @_tested @selenium @_done
Scenario: I can create a new lead and duplicate company\contact info to another new lead
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_direct_phone_number" with "2039282882"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I fill in "lead_company_phone_number" with "34234234234234"
  And I fill in "lead_company_website" with "http://falsecompanyurl.com"
  And I fill in "lead_linkedin_url" with "http://linkedin.com/pekdkdkd"
  And I fill in "lead_facebook_url" with "http://facebook.com/fkdjdjd-fjehjhd"
  And I press translated "agent.leads.new.view.button_create_and_duplicate"
  Then the "lead_company_name" field should contain "Printing company"
  And the "lead_address_line_1" field should contain "Kaminskiego 19"
  And the "lead_zip_code" field should contain "23-2911"
  And the "lead_company_phone_number" field should contain "34234234234234"
  And the "lead_company_website" field should contain "http://falsecompanyurl.com"
  And the "lead_contact_name" field should contain "Marek Kowalski"
  And the "lead_direct_phone_number" field should contain "2039282882"
  And the "lead_phone_number" field should contain "123456789"
  And the "lead_linkedin_url" field should contain "http://linkedin.com/pekdkdkd"
  And the "lead_facebook_url" field should contain "http://facebook.com/fkdjdjd-fjehjhd"

# new feature introduced in M5
@duplicated
Scenario: I can pick region for a country from dropdown

# new feature introduced in M5
@duplicated
Scenario: I can see international phone dialing prefix filled accordlingly to selected language/locale

@m5 @unique_categories @added @_tested @tgn @_done
Scenario: I can't publish a lead in unique category if I'm not assigned to it
  Given there are no categories
  And Category Test category 1 is created
  And Category Agent Unique Category is created
  And category "Agent Unique Category" is unique for user with email "bob@person.com" role "agent"
  And I go to agents leads
  Then "category_id" dropdown should have values "Test category 1,Agent Unique Category"

@m5 @unique_categories @added @_tested @tgn@_done
Scenario: I can publish leads only in unique categories if I'm assigned at least to one
  Given there are no categories
  And Category Test category 1 is created
  And Category Agent Unique Category is created
  And category "Agent Unique Category" is unique for user with email "bob@person.com" role "agent"
  Given I have user with email other_agent@nbs.com and role agent
  And Category Other Agent Unique Category is created
  And category "Other Agent Unique Category" is unique for user with email "other_agent@nbs.com" role "agent"
  And I go to agents leads
  Then "category_id" dropdown should have values "Test category 1,Agent Unique Category"
  And "category_id" dropdown should not have values "Other Agent Unique Category"

@m6 @tgn @_tested @added @lead_templates @selenium @_done
Scenario: When the template's field is of the note type then I should see textarea instead of textbox
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "computers count:false:true, operating systems:false:true:3, purchase date:false:false"
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  Then field "lead_lead_template_values_attributes_1_value" is of textarea type

@m6 @tgn @selenium @_tested @_done
Scenario: I should see hint for every field when creating a lead
  Given Category Test category 1 is created
  And article hint for model "Lead" and method "company_name" has attributes "published:true, content:Tooltip for company name"
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I should see CSS path "p[class*='inline-hints']"
  
@m6 @tgn @selenium @_tested @_done
Scenario: I can choose region during creation of a lead
  Given country "Denmark" has regions "Region #1, Region #2, Region #3"
  And Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I select "Denmark" from "lead_country_id"
  And I select "Region #2" from "lead_region_id"

@m6 @tgn @selenium @_tested @requested @_done
Scenario: I have already filled in international dialling codes for telephone numbers (+xx) (xxxxxxxxxxxxxxxxxxxxxx)
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I select "Denmark" from "lead_country_id"
  Then the "lead_direct_phone_number" field should contain "\+45"
  And the "lead_phone_number" field should contain "\+45"
  And I press translated "agent.leads.new.view.button_create"
  Then the "lead_direct_phone_number" field should contain "\+45"
  And the "lead_phone_number" field should contain "\+45"

# Do not display raw locale name - display language or country name where appropriate (mostly applicable to interfaces dealing with translations, like “new lead”)
@requested @m7 @tgn @selenium @_tested @_done
Scenario: I can see language or country name when adding translation
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I select translated "models.locale.da" from "locale_picker"
  And I should see translated "models.locale.da" within "#lead_translation_form_lead_lead_translations_attributes_0"

#9706
@m27 @requested @selenium @tgn @_done @_tested
Scenario: I should see datepicker when template field is of date type
  Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  And template named "Computers details" is mandatory
  And template named "Computers details" has following fields "production date:false:true:2"
  And I go to agents leads
  And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And element "input" with id "lead_lead_template_values_attributes_0_value" has class "datepicker"

