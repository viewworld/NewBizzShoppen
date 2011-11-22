@m16 @_added @_deals @is @_accessing_deals @faircalls
Feature: Accessing deals

  Background:
    Then user "agent@nbs.com" has deal maker role enabled
    Then user "translator_agent@nbs.com" has deal maker role enabled
    Then user "translator_call_centre@nbs.com" has deal maker role enabled
    Then user "translator_call_centre_agent@nbs.com" has deal maker role enabled
    Then I have user with email ned@stark.com and role CallCentre
    Then user "ned@stark.com" is confirmed
    Then user "ned@stark.com" has deal maker role enabled
    And I visit domain http://faircalls.eu
    Given I am on the homepage

  @_added @_added @_done @_tested
  Scenario: Creator, user with deal.deal_admin_email and user with deal.email_address can see deal created by admin
  Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
  # buyer OK
    And I visit domain http://fairleads.com
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see "super"
    Then I follow translated "supplier.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for buyer@nbs.com
  # call centre good OK -
    And I visit domain http://faircalls.com
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre@nbs.com
  # call centre wrong -
    And I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for ned@stark.com
  # call centre agent -
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
  # agent (as default deal admin)
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I should see "super"
    Then I follow translated "agent.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for agent@nbs.com
  # admin OK
    And I visit domain http://localhost
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I should see "super"
    Then I follow translated "administration.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for admin@nbs.com

  @_added @_done @_tested
  Scenario: Creator, user with deal.deal_admin_email and user with deal.email_address can see deal created by call center
    Then a deal is created by "translator_call_centre@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
  # buyer OK
    And I visit domain http://fairleads.com
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see "super"
    Then I follow translated "supplier.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for buyer@nbs.com
  # call centre good OK
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should see "super"
    Then I follow translated "call_centre.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for translator_call_centre@nbs.com
  # call centre wrong -
    And I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for ned@stark.com
  # call centre agent -
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
  # agent -
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I should not see "super"
    Then I follow translated logout link for agent@nbs.com
  # admin OK
    And I visit domain http://localhost
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I should see "super"
    Then I follow translated "administration.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for admin@nbs.com

  @_added @_done @_tested
  Scenario: Creator, user with deal.deal_admin_email and user with deal.email_address can see deal created by call center agent
    Then a deal is created by "translator_call_centre_agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
  # buyer OK
    And I visit domain http://fairleads.com
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see "super"
    Then I follow translated "supplier.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for buyer@nbs.com
  # call centre good OK
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should see "super"
    Then I follow translated "call_centre.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for translator_call_centre@nbs.com
  # call centre wrong -
    And I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for ned@stark.com
  # call centre agent OK
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I should see "super"
    Then I follow translated "call_centre.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
  # agent -
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I should not see "super"
    Then I follow translated logout link for agent@nbs.com
  # admin OK
    And I visit domain http://localhost
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I should see "super"
    Then I follow translated "administration.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for admin@nbs.com

  @_added @_done @_tested
  Scenario: Creator, user with deal.deal_admin_email and user with deal.email_address can see deal created by agent
    Then a deal is created by "agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
  # buyer OK
    And I visit domain http://fairleads.com
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see "super"
    Then I follow translated "supplier.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for buyer@nbs.com
  # call centre good -
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre@nbs.com
  # call centre wrong -
    And I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for ned@stark.com
  # call centre agent -
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
  # agent OK
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I should see "super"
    Then I follow translated "agent.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for agent@nbs.com
  # admin OK
    And I visit domain http://localhost
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I should see "super"
    Then I follow translated "administration.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for admin@nbs.com

  @_added @_done @_tested
  Scenario: Creator, user with deal.deal_admin_email and user with deal.email_address can see deal created by buyer
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
  # buyer OK
    And I visit domain http://fairleads.com
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I should see "super"
    Then I follow translated "supplier.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for buyer@nbs.com
  # call centre good OK -
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre@nbs.com
  # call centre wrong -
    And I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I should not see "super"
    Then I follow translated logout link for ned@stark.com
  # call centre agent -
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I should not see "super"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
  # agent (as default deal admin)
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I should see "super"
    Then I follow translated "agent.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for agent@nbs.com
  # admin OK
    And I visit domain http://localhost
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I should see "super"
    Then I follow translated "administration.deals.index.view.edit"
    Then I fill in "deal_header" with "nice"
    Then I follow translated logout link for admin@nbs.com