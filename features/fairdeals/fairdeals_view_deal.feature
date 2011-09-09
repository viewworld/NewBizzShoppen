@m18 @fairdeals_view_deal
Feature: Fairdeals view deal
  Background:
    When there are no deals
    Given I am signed up and confirmed as user with email procurment@nbs.com and password secret and role purchase_manager
    And user buyer@nbs.com with role customer exists with attributes "company_name:Azazel"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super descr|fine_print:super fine print|hidden_description:super detailed|company_description:super company desc|start_date:2011-01-01|company_name:Azazel|published:1|deal_admin_email:agent@nbs.com|contact_name:Ed Yudkovsky|phone_number:+49887755|company_website:www.azazelinc.com"
    Given template named "Computer details1" for category "Azazel" is created by user "agent@person.com" with role "agent"
    And template named "Computer details1" is mandatory
    And template named "Computer details1" is global
    And template named "Computer details1" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"
    Given template named "Computer details2" for category "Azazel" is created by user "buyer@nbs.com" with role "customer"
    And template named "Computer details2" is mandatory
    And template named "Computer details2" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"

  @_tested @_done @tgn
  Scenario: I should see Short description, Detailed description, Fine Print, Images, Company logo, Company name, Company description
    Given I visit domain http://fairdeals.dk
    Then I sign in as procurment@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow "Business deals"
    And I follow "super"
    And I should see "super descr"
    And I should see "super detailed"
    And I should see "super fine print"
    And I should see "Azazel"
    And I should see "super company desc"

  @_done @non_testable @tgn
  Scenario: I can see a popup with translated message and OK,Cancel buttons when I slick Get deal

  @_done @_tested @tgn
  Scenario: I should see Company contact name, Company contact e-mail, Company weblink, Company contact telephone number when I click OK
    Given I visit domain http://fairdeals.dk
    Then I sign in as procurment@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow "Business deals"
    And I follow "super"
    And I follow translated "deals.index.view.contact_me"
    And I should see "Azazel"
    And I should see "Ed Yudkovsky"
    And I should see "buyer@nbs.com"
    And I should see "+49887755"
    And I should see "www.azazelinc.com"

  @_done @non_testable @tgn
  Scenario: Lead is generated using only the existing information about the procurement manager

  @_done @_tested @tgn
  Scenario: As PM I can fill in additional field for lead "Please tell us about your needs"
    Given I visit domain http://fairdeals.dk
    Then I sign in as procurment@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow "Business deals"
    And I follow "super"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "my specific needs are following etc"
    And I fill in "lead_lead_template_values_attributes_0_value" with "some value1"
    And I fill in "lead_lead_template_values_attributes_1_value" with "some value2"
    And I fill in "lead_lead_template_values_attributes_2_value" with "some value3"
    And I press translated "purchase_manager.leads.edit.view.button_update"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"

  @_done @tested_elsewhere @tgn
  Scenario: I can fill in template fields

  @_done @tested_elsewhere @tgn
  Scenario: I should see all fields on one page