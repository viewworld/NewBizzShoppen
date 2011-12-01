@m18 @fairdeals_my_requests_listing
Feature: My requests listing

  Background:
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|published:1|deal_admin_email:agent@nbs.com|company_name:Xeper|address_line_1:adr1|address_line_2:adr2|address_line_3:adr3"
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,billing_cycle:10"
    And user with email "purchase_manager101@nbs.com" upgrades to subscription named "Premium member"
    And I visit domain http://fairdeals.eu
    And I am on the homepage
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "member.leads.new.view.button_create"
    And I should see translated "member.leads.show.view.confirmation_message"
    And I press translated "member.leads.show.view.ok_confirmation"
    And I follow translated "layout.fairdeals.main_menu.member.my_requests"

  @_done @non_testable @tgn
  Scenario: I should not see statistics, price for leads

  @_done @_tested @tgn
  Scenario: I should see date, company name, contact information of the company and company logo
    Then I follow translated "member.leads.index.view.edit"
    And I should see "Xeper"
    And I should see "adr1"
    And I should see "adr2"
    And I should see "adr3"



