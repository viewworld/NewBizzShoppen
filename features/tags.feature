@tags @m31
Feature: Tags

  @_done @_non_testable
  Scenario: As admin/call centre/call centre agent/agent I should be able to see the objects tags

  @_done @_non_testable
  Scenario: As admin/agent/call centre agent I should be able to tag supplier, member, lead, deal, contact

  Scenario: As admin I should be able to edit/delete/merge/duplicate tags

  @_done @_tested_elsewhere
  Scenario: When member/supplier/category supplier/lead was upgraded from contact then is should be auto tagged with contact's tags

  @_done @_tested
  Scenario: Members are auto tagged with deal's tags when they view it
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has deal maker role enabled
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:Asd|published:1|deal_admin_email:agent@nbs.com"
    And deal with header "super" has tags "tag1, tag2"
    Then I am not sign in
    Given I am on the homepage
    And I visit domain http://fairdeals.dk
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    And user with email "purchase_manager101@nbs.com" should have tags "tag1, tag2"