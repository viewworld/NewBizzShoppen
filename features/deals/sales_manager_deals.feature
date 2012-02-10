@m16 @requested @sales_manager_deals @_deals @$_sales_manager
Feature: Deals from Sales Manager perspective
  Background:
    Given I am on the homepage
    Then user "buyer@nbs.com" has deal maker role enabled
    And I sign in as buyer@nbs.com with password secret

  @_done @_tested
  Scenario: I can see new tab "My deals" right to the "My leads"
    Then I should see translated "layout.main_menu.lead_supplier.my_deals"

  @_done @_tested
  Scenario: I can see a list of my created deals sorted by creation date when I click "My deals"
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:awesome|description:awesome|hidden_description:awesome|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"
    Then I wait 1 second
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then a deal is created by "translator_customer@nbs.com" for user "translator_customer@nbs.com" and category "Business deals" with attributes "header:hidden|description:hidden|hidden_description:hidden|start_date:2011-01-01|end_date:2011-01-01|company_name:starks"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should not see "hidden"
    Then I should see "super" before "awesome"
    Then I filter and sort deals with my deals translation "layout.main_menu.lead_supplier.my_deals"

  @_done @_tested_elsewhere
  Scenario: I can filter the list by "active" and "inactive" deals

  @_done @_tested
  Scenario: I can see creation date, deal name, expire time, likes, publish/awaiting approval on deal list
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see translated "shared.deals.table.creation_date"
    Then I should see translated "shared.deals.table.name"
    Then I should see translated "shared.deals.table.expires"
    Then I should see translated "shared.deals.table.likes"
    Then I should see translated "shared.deals.table.published"
    Then I should see "super" within "#deals"
    Then I should see "2016-12-12" within "#deals"
    Then I should see "false" within "#deals"

  # when I am Deal Maker
  @_done @_tested_elsewhere
  Scenario: I can publish deals

  # CREATING DEALS
  # --------------
  # There is an orange arrow on the top right “create new deal”
  @selenium @_done @_tested
  Scenario: I can create a new deal
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    Then I should not see "Lead category"
    Then I press translated "supplier.deals.new.view.create_button"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/suppliers\/deals\/\d+\/edit/"
    Then I fill deal edit form and submit with translated button "supplier.deals.edit.view.update_button"

  # "Deal description"
  @_done @_tested_elsewhere
  Scenario: I can select a deal category

  @_done @_tested_elsewhere
  Scenario: I can see creation date (generated automatically)

  @_done @_tested_elsewhere
  Scenario: I can enter deal name

  @_done @_tested_elsewhere
  Scenario: I can enter short description (140 chars) and see how many is left when I enter text

  @_done @_tested_elsewhere
  Scenario: I can enter detailed description

  @_done @_tested_elsewhere
  Scenario: I can enter fine print (note field)

  @_done @_tested @tc_file_mgmt
  Scenario: I can edit Company logo
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove logo for deal as "supplier"

  @_done @_tested @tc_file_mgmt
  Scenario: I can upload material to download
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove document for deal as "supplier"

  #10118
  @m29 @_done @_tested @tgn
  Scenario: I can upload internal document to download  and fill in internal note
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove internal document for deal as "supplier"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I follow translated "supplier.deals.index.view.edit"
    And I should see translated "shared.deals.form.internal_note_label"

  @_done @_tested @tc_file_mgmt
  Scenario: I can attach multiple pictures
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove image for deal as "supplier"

  @_done @_not_testable
  Scenario: I can see thumbnails when I attach pictures

  @_done @_tested_elsewhere
  Scenario: I can specify start and end dates

  @_done @_deprecated
  Scenario: I can select currency

  @_done @_tested
  Scenario: I can click a link to see public deal description (shows the deal as presented to procurement manager)
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I follow translated "supplier.deals.index.view.edit"
    Then I follow translated "supplier.deals.edit.view.preview"
    Then I should see "super"

  # "Contact"
  @_done @_tested_elsewhere
  Scenario: Contact data should be populated from sales manager

  @_done @_tested_elsewhere
  Scenario: I can edit company name / contact person / email / direct number / mobile number

  @_done @_tested_elsewhere
  Scenario: I can edit address

  @_done @_tested_elsewhere
  Scenario: I can edit URL

  @_done @_tested_elsewhere
  Scenario: I can edit Company description (note field)

  # "Additional information"
  @_done @_tested @selenium
  Scenario: I can create a new template for this Deal
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I follow translated "layout.main_menu.shared.browse_leads"
    And I follow translated "categories.index.view.view_lead_templates"

    And I follow translated "supplier.lead_templates.index.view.new_template"
    Then I fill in "lead_template_name" with "Computer details"
    And I check "lead_template_is_mandatory"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_0_name" with "example attr 1"
    And I follow translated "shared.lead_templates.form.new_lead_template_field"
    And I fill in "lead_template_lead_template_fields_attributes_1_name" with "example attr 2"
    And I check "lead_template_lead_template_fields_attributes_1_is_hidden"
    And I check "lead_template_lead_template_fields_attributes_1_is_mandatory"
    Then I press translated "agent.lead_templates.new.view.button_create"

  @_done @_tested @selenium
  Scenario: I can use existing templates for this category
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Given template named "Computer details1" for category "Xeper" is created by user "agent@person.com" with role "agent"
    And template named "Computer details1" is mandatory
    And template named "Computer details1" is global
    And template named "Computer details1" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"
    Given template named "Computer details2" for category "Xeper" is created by user "buyer@nbs.com" with role "supplier"
    And template named "Computer details2" is mandatory
    And template named "Computer details2" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    And I fill in "deal_header" with "Templates deal test"
    And I check "deal_published"
    And I select "Computer details2" from "all_templates"
    And I select "Electronics deals" from "deal_category_id"
    And I follow translated "administration.categories.form.move_users_right"
    Then I press translated "supplier.deals.new.view.create_button"
    And I fill in "search_with_keyword" with "Templates deal test"
    And I press translated "leads.index.search.search_button"
    And I click hidden link by url regex "/suppliers\/deals\/\d+\/edit/"
    And "deal_deal_template_ids_" dropdown should have values "Computer details2"
    Then I am not sign in
    And I visit domain http://fairdeals.eu
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow translated "deals.index.view.view_deal"
    And I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "Some name"
    And I fill in "lead_lead_template_values_attributes_0_value" with "some val1"
    And I fill in "lead_lead_template_values_attributes_3_value" with "some val2"
    Then I should see "Computer details1"
    Then I should see "Computer details2"
    And I press translated "member.leads.new.view.button_create"

  @_done @tested_elsewhere
  Scenario: Mandatory templates for category should be automatically included

  @_done @_tested
  Scenario: When a deal is created a new lead category should be created named the same as sales manager's company name
    And there is no category named "Xeper"
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    And there is a category named "Xeper"
    And category named "Xeper" should be unique for "buyer@nbs.com"

  @_done @tested_elsewhere
  Scenario: The category is company unique to the sales manager

  @_done @tested_elsewhere
  Scenario: Lead category is set by default when deal is generated by sales manager

  @m18 @tgn @_tested @_done @tgn
  Scenario: I can see Create new template button under new/edit deal
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I click hidden link by url regex "/suppliers\/deals\/\d+\/edit/"
    Then I should see translated "supplier.deals.edit.view.new_template"
    And I follow translated "supplier.deals.edit.view.new_template"
    And I should see translated "supplier.lead_templates.new.view.header"

  #8885
  @m25 @requested @selenium @_done @_tested
  Scenario: As a deal maker I can fill out Deal confirmation page rich text field for each deal
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    And I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I click hidden link by url regex "/suppliers\/deals\/\d+\/edit/"
    And I wait 2 second
    And I fill in "deal_deal_confirmation_page_editor" ckeditor with "deal instructions are as follows"
    And I press translated "supplier.deals.edit.view.update_button"