@m18 @fairdeals_view_deal
Feature: Fairdeals view deal
  Background:
    When there are no deals
    Given I am signed up and confirmed as user with email procurment@nbs.com and password secret and role member
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Azazel"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super descr|fine_print:super fine print|hidden_description:super detailed|company_description:super company desc|start_date:2011-01-01|company_name:Azazel|published:1|deal_admin_email:agent@nbs.com|contact_name:Ed Yudkovsky|phone_number:+49887755|company_website:www.azazelinc.com"
    Given template named "Computer details1" for category "Azazel" is created by user "agent@person.com" with role "agent"
    And template named "Computer details1" is mandatory
    And template named "Computer details1" is global
    And template named "Computer details1" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"
    Given template named "Computer details2" for category "Azazel" is created by user "buyer@nbs.com" with role "supplier"
    And template named "Computer details2" is mandatory
    And template named "Computer details2" has following fields "field #1:true:true,field #2:true:false,field #3:false:false"

  @_tested @_done @tgn
  Scenario: I should see Short description, Detailed description, Fine Print, Images, Company logo, Company name, Company description
    Given I visit domain http://fairdeals.dk
    Then I sign in as procurment@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
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
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "procurment@nbs.com" upgrades to subscription named "Premium member"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "super"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_lead_template_values_attributes_0_value" with "value1"
    And I press translated "member.leads.new.view.button_create"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "super"
    And I should see "Azazel"
    And I should see "Ed Yudkovsky"
    And I should see "buyer@nbs.com"
    And I should see "+49887755"
    And I should see "http://www.azazelinc.com"

  @_done @non_testable @tgn
  Scenario: Lead is generated using only the existing information about the procurement manager

  @_done @_tested @tgn
  Scenario: As PM I can fill in additional field for lead "Please tell us about your needs"
    Given I visit domain http://fairdeals.dk
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "procurment@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as procurment@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow "super"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "my specific needs are following etc"
    And I fill in "lead_lead_template_values_attributes_0_value" with "some value1"
    And I fill in "lead_lead_template_values_attributes_1_value" with "some value2"
    And I fill in "lead_lead_template_values_attributes_2_value" with "some value3"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"

  @_done @tested_elsewhere @tgn
  Scenario: I can fill in template fields

  @_done @tested_elsewhere @tgn
  Scenario: I should see all fields on one page

  ##7631
  @m19 @requested @_done @tested_elsewhere
  Scenario: I should see www address for company if provided on the deal view

  #7630
  @m19 @requested @_tested @_done @tgn
  Scenario: I can see javascript counter on the group deals details page
    Given a deal named "Abc group deal #1" exists within category "Electronics deals"
    And a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:100,discounted_price:25,social_media_description:quo vadis"
    Given I visit domain http://fairdeals.dk
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow "Abc group deal #1"
    And I should see "1" occurrences of css class "countdown" for tag "div"

  #7651
  @m19 @requested @_tested @_done @tgn
  Scenario: When deal does not have price but has discounted price, its value should be displayed as saving
    Given a deal named "Abc group deal #1" exists within category "Electronics deals"
    And a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:0,discounted_price:25,social_media_description:quo vadis"
    Given I visit domain http://fairdeals.dk
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow "Abc group deal #1"
    Then I should not see translated "deals.listing.price"
    And I should not see translated "deals.listing.discounted_price"
    But I should see "25%"

  #7831
  @m20 @requested @is @non_testable @_done
  Scenario: The styles of text should be inverted for headings like company and company description under deals listing

  #8885
  @m25 @requested @tgn @_tested @_done
  Scenario: When I get the deal then on the deal view page I can see heading "How to get your deal" and rich text for deal confirmation page

  #8885
  @m25 @requested @tgn @_tested @_done
  Scenario: When I get the deal then on the deal view page I can see deal code under deal confirmation page (it should be clickable if deal code resembles valid URL)
    Given a deal named "Abc group deal #1" exists within category "Electronics deals"
    And a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:0,discounted_price:25,social_media_description:quo vadis,deal_code:www.google.com,deal_confirmation_page:to get your deal you need to ..."
    Given I visit domain http://fairdeals.dk
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10"
    And user with email "procurment@nbs.com" upgrades to subscription named "Premium member"
    Then I sign in as procurment@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow "Abc group deal #1"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "my specific needs are following etc"
    And I press translated "member.leads.new.view.button_create"
    And I press translated "member.leads.show.view.ok_confirmation"
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow "Abc group deal #1"
    And I should see link with label "www.google.com"
    And I should see translated "deals.show.view.confirmation_page_label"
    And I should see "to get your deal you need to ..."