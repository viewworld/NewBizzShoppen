@purchase_manager @m3 @ao
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

@_done
Scenario: I can create a new lead and close
  Given Category PMCategory is created
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "PMCategory" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with "2012-02-20"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should be on purchase managers leads
  And I should see translated "flash.leads.actions.create.notice"

@_done
Scenario: I can create a new lead and continue (create another one)
  Given Category PMCategory is created
  And I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "PMCategory" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with "2012-02-20"
  And I press translated "purchase_manager.leads.new.view.button_create_and_continue"
  And I should see translated "flash.leads.actions.create.notice"
  And I should see translated "purchase_manager.leads.new.view.title"

@selenium @_done
Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc but no hidden desc
  Given Category PMCategory is created
  And Country Denmark is created
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "PMCategory" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with "2011-02-20"
  And I select "dk" from "locale_picker"
  And I fill in "lead_lead_translations_attributes_0_header" with "DK header"
  And I fill in "lead_lead_translations_attributes_0_description" with "DK description"
  And I fill in "lead_lead_translations_attributes_0_hidden_description" with "DK hidden description"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I should be on purchase managers leads
  And I should see translated "flash.leads.actions.create.notice"
  Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
  And I should see "DK description"
  And I should see "DK hidden description"

@_done
Scenario: Contact information should be prepopulated
  Given I follow translated "agent.leads.index.view.new_lead"
  Then the "lead_email_address" field should contain "jon@lajoie.ca"
  And the "lead_contact_name" field should contain any value
  And the "lead_phone_number" field should contain any value
  And the "lead_address" field should contain any value

@_done
Scenario: Published checkbox should not be visible
  Given I follow translated "agent.leads.index.view.new_lead"
  Then I should not see field "lead_published"

@_done
Scenario: Hidden description should not be visible
  Given I follow translated "agent.leads.index.view.new_lead"
  Then I should not see field "lead_hidden_description"

@_done
Scenario: Created leads should not be published (not listed)
  Given Category PMCategory is created
  And Country Denmark is created
  Given I follow translated "purchase_manager.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I fill in "lead_company_name" with "Llorem Inc"
  And I select "3" from "lead_sale_limit"
  And I select "PMCategory" from "lead_category_id"
  And I select "Denmark" from "lead_country_id"
  And I fill in "datepicker" with "2011-02-20"
  And I press translated "purchase_manager.leads.new.view.button_create"
  And I am on browse leads
  And I follow "PMCategory"
  Then I should see "0" rows with id like "lead_" in a table within ".leads_table"
