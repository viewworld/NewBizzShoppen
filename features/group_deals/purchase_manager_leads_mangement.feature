@m17 @procurement_leads_management @is
Feature: Purchase manager leads management
  Background:
    Given I am on the homepage

  @selenium @_done @_tested
  Scenario: I should be able to create new lead as purchase manager
    Given I am signed up and confirmed as user with email procurment@nbs.com and password secret and role purchase_manager
    Then I sign in as procurment@nbs.com with password secret
    Then category "Business" has attributes "default_price:44.44"
    Then I follow translated "layout.main_menu.purchase_manager.tenders"
    Then I follow translated "purchase_manager.tenders.index.view.new_tender"
    Then I should see translated "shared.leads.form.purchase_manager.lead_information"
    Then I should see translated "shared.leads.form.purchase_manager.header_label"
    Then I should see translated "shared.leads.form.purchase_manager.description_label"
    Then I should see translated "shared.leads.form.purchase_manager.sales_information"
    Then I should see translated "shared.leads.form.purchase_manager.sale_limit_label"
    Then I select "Business" from "lead_category_id"
    Then I fill in "lead_company_name" with "super"
    Then I fill in "lead_company_phone_number" with "super"
    Then I fill in "lead_company_website" with "super"
    Then I fill in "lead_address_line_1" with "super"
    Then I fill in "lead_address_line_2" with "super"
    Then I fill in "lead_address_line_3" with "super"
    Then I fill in "lead_zip_code" with "super"
    Then I fill in "lead_company_vat_no" with "super"
    Then I fill in "lead_company_ean_number" with "super"
    Then I fill in "lead_contact_name" with "super"
    Then I fill in "lead_direct_phone_number" with "super"
    Then I fill in "lead_phone_number" with "super"
    Then I fill in "lead_email_address" with "super"
    Then I fill in "lead_linkedin_url" with "super"
    Then I fill in "lead_facebook_url" with "super"
    Then I fill in "lead_header" with "super_super"
    Then I fill in "lead_description" with "super"
    Then I fill in "lead_purchase_decision_date" with "2016-12-12"
    Then I press translated "purchase_manager.tenders.new.view.button_create"
    Then I fill in "lead_email_address" with "super@super.com"
    Then I press translated "purchase_manager.tenders.new.view.button_create"
    Then price for lead "super_super" is set to "44.44"
    Then I click hidden link by url regex "/purchase_managers\/leads\/\d+\/edit/"
    Then I press translated "purchase_manager.tenders.edit.view.button_update"
    Then I execute js for display action block for "leads"
    Then I follow translated "purchase_manager.tenders.index.view.certify"
    Then I should see translated "agent.lead_certifications.index.view.sent_successfully"
    Then I execute js for display action block for "leads"
    Then I confirm a js popup on the next step
    Then I follow translated "purchase_manager.tenders.index.view.destroy"
    Then I should see translated "purchase_manager.tenders.destroy.flash.tender_deletion_successful"


  #lead info, category, header, description, tender information, sales limit, purchase decision date (min 5 business days)
  @_done @_tested_elsewhere
  Scenario: During lead creation I need to supply certain fields

  @_done @_tested_elsewhere
  Scenario: I should not see country (set to local), price, purchase value, currency

  @_done @_tested_elsewhere
  Scenario: Price should be set to category default price

  @_tested @_done
  Scenario: As admin I can set the default price for each deal category
    And I am signed up and confirmed as user with email bob@person.com and password secret and role admin
    Then I sign in as bob@person.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_deals"
    Then I follow translated "administration.deals.index.view.edit"
    Then I should not see "Default price"
    Then I press translated "administration.categories.edit.view.button_update"
    Then I follow translated "administration.categories.index.view.new_deal_category"
    Then I should not see "Default price"
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow translated "administration.leads.index.view.edit"
    Then I should see "Default price"
    Then I fill in "category_default_price" with "error"
    Then I press translated "administration.categories.edit.view.button_update"
    Then I fill in "category_default_price" with "-10"
    Then I press translated "administration.categories.edit.view.button_update"
    Then I fill in "category_default_price" with "200.22"
    Then I press translated "administration.categories.edit.view.button_update"
    Then I follow translated "administration.categories.index.view.new_category"
    Then I should see "Default price"