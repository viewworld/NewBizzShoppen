@lead_manager @$_call_centre_agent @m5 @tgn
Feature: Lead creation by call centre agent

Background:  Sign in user and set locale
  Given I am on the homepage
  And I make sure current locale is English
  And I have user with email call_centre@person.com and role call_centre
  And I am signed up and confirmed as user with email call_centre_agent@person.com and password supersecret and role call_centre_agent
  And an user with role call_centre_agent and email call_centre_agent@person.com belongs to call centre call_centre@person.com
  Then I sign in as call_centre_agent@person.com with password supersecret


@_tested
Scenario: I can create a new lead and close
  Given Category Test category 1 is created
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
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
  And I press translated "call_centre_agent.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"

@_tested
Scenario: I can create a new lead and continue (create another one)
  Given Category Test category 1 is created
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
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
  And I press translated "call_centre_agent.leads.new.view.button_create_and_continue"
  And I should see translated "flash.leads.actions.create.notice"
  And I should see translated "call_centre_agent.leads.new.view.title"

@_tested @selenium
Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc, hidden desc
  Given Category Test category 1 is created
  And Country Denmark is created
  Given I follow translated "call_centre_agent.leads.index.view.new_lead"
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
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "call_centre_agent.leads.new.view.button_create"
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/call_centre_agents\/leads\/\d+\/edit/"
  And I should see "DK description"
  And I should see "DK hidden description"