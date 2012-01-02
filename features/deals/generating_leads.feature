@m16 @generating_leals @required @_deals @$_procurement_manager @tgn
Feature: Generating leads from deals

  Background:
    Given I am on the homepage
    Then user "buyer@nbs.com" has deal maker role enabled
    And I sign in as buyer@nbs.com with password secret

  @_done @tested_elsewhere
  Scenario: A public header should be set to "A company is interested in" + short description

  @_done @tested_elsewhere
  Scenario: A public description should be set to "A company is interested in" + short description

  # The hidden description: is the note field from the “request information” which is field out by the procurement manager
  @_done @tested_elsewhere
  Scenario: A hidden description field should be set to the note field from "request information"

  @_done @tested_elsewhere
  Scenario: Company and contact information should be set to procurement manager information

  @_done @tested_elsewhere
  Scenario: Lead creator is set to "Deal admin" if deal was created by sales manager or admin

  @_done @tested_elsewhere
  Scenario: Lead creator is set to callcentre/agent is deal was created by callcentre/agent

  @_done @tested_elsewhere
  Scenario: Lead price is set to 0 unless specified otherwise in the deal setup by admin, call center or agent

  @_done @tested_elsewhere
  Scenario: Purchase decision date for lead is the expire time for deal + 7 days

  @_done @tested_elsewhere
  Scenario: Sales limit should be set to 1

  # Step one: Please make sure your information is correct. (Validate company and contact information) Including linking to face book and LinkedIn.
  @_done @_tested @selenium
  Scenario: In first step I can confirm the lead information
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
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
    And I fill in "lead_hidden_description" with "some hidden note"
    And I fill in "lead_lead_template_values_attributes_0_value" with "lorem ipsum 1"
    And I fill in "lead_lead_template_values_attributes_1_value" with "lorem ipsum 2"
    And I fill in "lead_lead_template_values_attributes_2_value" with "lorem ipsum 3"
    And I press translated "member.leads.new.view.button_create"
    And I should see translated "member.leads.show.view.confirmation_message"
    And I press translated "member.leads.show.view.ok_confirmation"
    And I should be on show deal Templates deal test

  # If there is any template information associated with the deal the procurement manager is prompted for the information. And the procurement manager can enter some note information (will go into hidden description)
  @_done @tested_elsewhere
  Scenario: In step two I can enter template information and note (will go into hidden description)

  # A confirmation page that we have received the contact request, and that we will be in touch ASAP. When the procurement manager clicks ok he is redirected to the procurement mananger homepage
  @_done @tested_elsewhere
  Scenario: In step three I can see a confirmation page and I am redirected to procuemenrent homepage when I click OK

