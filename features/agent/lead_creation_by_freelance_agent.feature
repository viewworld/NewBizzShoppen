@lead_manager @$_freelance_agent  @m1
Feature: Lead creation by freelance agent

In order to create and manage leads I sell
As an Agent
I can use my agent panel

Background:
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
    And I am on the homepage
    And I make sure current locale is English
    Then I sign in as bob@person.com with password supersecret
    And I go to agents leads

@_tested
Scenario: I can create a new lead and close
  Given Category Test category 1 is created
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Test category 1" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with "2011-02-20"
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.actions.create.notice"

@_tested @noguess
Scenario: I can create a new lead and continue (create another one)
  Given Category Test category 1 is created
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Test category 1" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with "2011-02-20"
  And I press translated "agent.leads.new.view.button_create_and_continue"
  And I should see translated "flash.leads.actions.create.notice"
  And I should see translated "agent.leads.new.view.title"

@_tested  @selenium @noguess
Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc, hidden desc
  Given Category Test category 1 is created
  And Country Denmark is created
  Given I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Test category 1" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with "2011-02-20"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/agents\/leads\/\d+\/edit/"
  And I should see "DK description"
  And I should see "DK hidden description"

@tgn @added @_tested @m1
Scenario: Published checkbox should be selected by default
  Given I am not sign in
  And user bob@person.com with role agent exists with attributes "certification_level:1"
  Then I sign in as bob@person.com with password supersecret
  And I go to agents leads
  Given I follow translated "agent.leads.index.view.new_lead"
  Then the "lead_published" checkbox should be checked

@tgn @_tested @m1
Scenario: All fields for new lead have to be filled in beside email address
  Given Category Test category 1 is created
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Test category 1" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with ""
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with "2011-02-20"
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.actions.create.notice"

@m3 @ao @_done
Scenario: I should be able to specify currency in which Lead will be sold (from dropdown)
  When I follow translated "agent.leads.index.view.new_lead"
  Then I select "Euro" from "lead_currency_id"

@m3 @tgn @_done @non_testable
Scenario: When lead is published then the published_at time is recorded

@m4 @_tested @tgn
Scenario: I can add linkedin and facebook links to lead's contact information
  Given Category Test category 1 is created
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Test category 1" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with "2011-02-20"
  And I fill in "lead_facebook_url" with "http://www.facebook.com/myfakefacebookprofile"
  And I fill in "lead_linkedin_url" with "http://www.linkedin.com/myfakelinkedinprofile"
  And I press translated "agent.leads.new.view.button_create"
  And I should be on agents leads
  And I should see translated "flash.leads.actions.create.notice"

@m5 @added @lead_templates @tgn @_wip
Scenario: I have to fill out the templates which are mandatory
  #Given template named "Computers details" for category "Computers" is created by user "bob@person.com" with role "agent"
  #And template named "Computers details" is mandatory
  #And template named "Computers details" has following fields "computers count:false, operating systems:false"
  And I go to agents leads
  And I open page in browser
  #And I select "Computers" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I open page in browser

@m5 @added @lead_templates @tgn
Scenario: I can select additional templates that are optional

@m5 @added @lead_templates @tgn
Scenario: Lead templates for given category consist of my templates, my call centre's and admin's

@m5 @added @lead_templates @tgn
Scenario: When new translation to lead is added I can also write translation for the templates

@m4 @added @tgn @agent_certification @_tested
Scenario: I cannot publish leads if my certification level is Not Certified or Locked
  Given Category Test category 1 is created
  And I follow translated "agent.leads.index.view.new_lead"
  Then I should not see "Published"

@m5 @added @tgn @non_testable
Scenario: Fields on the form are placed in defined order

@m5 @added @tgn @_tested
Scenario: I can add contact direct phone number, company phone number, company ean number, contact direct phone number, country is international, company website
  When I follow translated "agent.leads.index.view.new_lead"
  Then I fill in "lead_company_phone_number" with "34234234234234"
  Then I fill in "lead_company_website" with "http://falsecompanyurl.com"
  Then I fill in "lead_company_ean_number" with "ERH342342342342"
  Then I fill in "lead_direct_phone_number" with "424234324234"
  Then I select translated "shared.leads.form.country_international" from "lead_is_international"

@m5 @added @tgn @_tested
Scenario: I can create a new lead and duplicate company\contact info to another new lead
  Given Category Test category 1 is created
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  #And I fill in "area" with "global"
  And I select "Test category 1" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_direct_phone_number" with "2039282882"
  And I fill in "lead_email_address" with "my@email.com"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_city" with "Bielsko-Biała"
  And I fill in "lead_county" with "Freesdas"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with "2011-02-20"
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

@m0 @added
Scenario: I can pick region for a country from dropdown