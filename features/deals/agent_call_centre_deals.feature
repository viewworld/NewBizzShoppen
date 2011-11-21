@m16 @requested @agent_deals @_deals @$_call_centre @$_agent @nontestable @$_remove
Feature: Deals from Call Centre/Agent perspective

  Background:
    Then user "agent@nbs.com" has deal maker role enabled
    Then user "translator_agent@nbs.com" has deal maker role enabled
    Then user "translator_call_centre@nbs.com" has deal maker role enabled
    Then user "translator_call_centre_agent@nbs.com" has deal maker role enabled
    Given I am on the homepage
    And I visit domain http://faircalls.eu

  @_done @_tested
  Scenario: I can see "My Deals" to the right of "My Leads" tab
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I should see translated "layout.main_menu.call_centre.deals"
    Then I follow translated logout link for translator_call_centre@nbs.com
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I should see translated "layout.main_menu.call_centre_agent.deals"

  #A test id function which display the company name and contact name for the email for the sales manger which provides the deal
  @selenium @_done @_tested
  Scenario: I can create new deal by entering sales manager email
    # call centre
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill in "supplier_email" with "buyer@nbs.com"
    Then I follow translated "call_centre.deals.new.view.check_supplier_email"
    And I wait 1 second
    And I follow translated "call_centre_agent.deals.new.view.confirm"
    Then I fill deal creation form
    Then I select "DKK" from "deal_currency_id"
    Then I fill in "deal_price" with "10"
    Then I select "Business" from "deal_lead_category_id"
    Then I press translated "call_centre.deals.new.view.create_button"
    Then I should see translated "flash.deals.create.notice"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/call_centres\/deals\/\d+\/edit/"
    Then I should see translated "call_centre.deals.edit.view.title"
    Then I fill deal edit form and submit with translated button "call_centre.deals.edit.view.update_button"
    # next three lines testing group deal
    Then I click hidden link by url regex "/call_centres\/deals\/\d+\/edit/"
    Then I fill group deal edit form and submit with translated button "call_centre.deals.edit.view.update_button"
    Then I click hidden link by url regex "/call_centres\/deals\/\d+\/edit/"
    Then I follow translated logout link for translator_call_centre@nbs.com
    # call centre agent
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill in "supplier_email" with "buyer@nbs.com"
    Then I follow translated "call_centre_agent.deals.new.view.check_supplier_email"
    And I wait 1 second
    And I follow translated "call_centre_agent.deals.new.view.confirm"
    Then I fill deal creation form
    Then I select "DKK" from "deal_currency_id"
    Then I fill in "deal_price" with "10"
    Then I select "Business" from "deal_lead_category_id"
    Then I press translated "call_centre_agent.deals.new.view.create_button"
    Then I should see translated "flash.deals.create.notice"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/call_centre_agents\/deals\/\d+\/edit/"
    Then I should see translated "call_centre_agent.deals.edit.view.title"
    Then I fill deal edit form and submit with translated button "call_centre_agent.deals.edit.view.update_button"
    # next three lines testing group deal
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I click hidden link by url regex "/call_centre_agents\/deals\/\d+\/edit/"
    Then I fill group deal edit form and submit with translated button "call_centre_agent.deals.edit.view.update_button"
    # agent
    And I am not sign in
    And I am on the homepage
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill in "supplier_email" with "buyer@nbs.com"
    Then I follow translated "agent.deals.new.view.check_supplier_email"
    And I wait 1 second
    And I follow translated "agent.deals.new.view.confirm"
    Then I fill deal creation form
    Then I select "DKK" from "deal_currency_id"
    Then I fill in "deal_price" with "10"
    Then I wait 30 second
    Then I select "Business" from "deal_category_id"
    Then I press translated "agent.deals.new.view.create_button"
    Then I should see translated "flash.deals.create.notice"
    Then I should see translated "deals.common.listing.view.header"
    Then I should see "very important deal"
    Then I click hidden link by url regex "/agents\/deals\/\d+\/edit/"
    Then I should see translated "agent.deals.edit.view.title"
    Then I fill deal edit form and submit with translated button "agent.deals.edit.view.update_button"

  #the admin/call center/agent can create the deal and "certify it" in the same way a lead is certified.
  @selenium @_done @_tested
  Scenario: I can create new deal and certify (enter future sales manager's email)
    # call centre
    Given I am on the homepage
    Given I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "call_centre.deals.new.view.certify"
    Then I certify deal with translation "call_centre.deals.new.view.create_button"
    Then I follow translated logout link for translator_call_centre@nbs.com
    # call centre agent
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "call_centre_agent.deals.new.view.certify"
    Then I certify deal with translation "call_centre_agent.deals.new.view.create_button"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
    # agent
    And I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.agent.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "agent.deals.new.view.certify"
    Then I certify deal with translation "agent.deals.new.view.create_button"
    Then I follow translated logout link for agent@nbs.com
    # admin
    Given I am on the homepage
    Given I visit domain http://localhost
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "administration.deals.new.view.certify"
    Then I certify deal with translation "administration.deals.new.view.create_button"
    Then I follow translated logout link for admin@nbs.com
    # certification by buyer
    Then I have user with email ned@stark.com and role supplier
    Then user "ned@stark.com" is confirmed
    Then I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.deals_to_certify"
    Then I follow translated "supplier.deal_certification_requests.index.view.certify"
    Then I press translated "supplier.deal_certification_requests.edit.view.certify"
    Then I should see translated "supplier.deal_certification_requests.update.flash.certify_success"
    Then I follow translated "supplier.deal_certification_requests.index.view.certify"
    Then I press translated "supplier.deal_certification_requests.edit.view.certify"
    Then I should see translated "supplier.deal_certification_requests.update.flash.certify_success"
    Then I follow translated "supplier.deal_certification_requests.index.view.certify"
    Then I press translated "supplier.deal_certification_requests.edit.view.reject"
    Then I should see translated "supplier.deal_certification_requests.update.flash.reject_success"
    Then I follow translated "supplier.deal_certification_requests.index.view.certify"
    Then I press translated "supplier.deal_certification_requests.edit.view.reject"
    Then I should see translated "supplier.deal_certification_requests.update.flash.reject_success"
    Then I should not see translated "layout.main_menu.lead_supplier.deals_to_certify"

  @added @tgn @_done @_tested @selenium @m17
  Scenario: When certification request is created for non-existing user than I can access that link from the email
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "call_centre.deals.new.view.certify"
    Then I certify deal with translation "call_centre.deals.new.view.create_button"
    Then I follow translated logout link for translator_call_centre@nbs.com
    And I visit certification url for last deal
    And I should see translated "supplier.deal_certification_requests.edit.view.title"
    And I press translated "supplier.deal_certification_requests.edit.view.certify"
    Then the last deal should not be certified
    Then I should see translated "deal_supplier_accounts.new.view.header"
    And I fill in "user_supplier_password" with "s3cr3t"
    And I fill in "user_supplier_password_confirmation" with "s3cr3t"
    And I press translated "deal_supplier_accounts.new.view.button_create_account"
    Then the last deal should be certified
    Then last email sent should have content "Password: s3cr3t"

  @_added @_done @_tested
  Scenario: admin/call center/call center agent/agent can edit Company logo
    # admin
    And I sign in as admin@nbs.com with password secret
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove logo for deal as "administration"
    Then I follow translated logout link for admin@nbs.com
    # call centre
    And I sign in as translator_call_centre@nbs.com with password secret
    Then a deal is created by "translator_call_centre@nbs.com" for user "translator_call_centre@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove logo for deal as "call_centre"
    Then I follow translated logout link for translator_call_centre@nbs.com
    # call centre agent
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then a deal is created by "translator_call_centre_agent@nbs.com" for user "translator_call_centre_agent@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove logo for deal as "call_centre_agent"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
    # agent
    And I sign in as agent@nbs.com with password secret
    Then a deal is created by "agent@nbs.com" for user "agent@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove logo for deal as "agent"
    Then I follow translated logout link for agent@nbs.com

  @_added @_done @_tested
  Scenario: admin/call center/call center agent/agent can upload material to download
    # admin
    And I sign in as admin@nbs.com with password secret
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove document for deal as "administration"
    Then I follow translated logout link for admin@nbs.com
    # call centre
    And I sign in as translator_call_centre@nbs.com with password secret
    Then a deal is created by "translator_call_centre@nbs.com" for user "translator_call_centre@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove document for deal as "call_centre"
    Then I follow translated logout link for translator_call_centre@nbs.com
    # call centre agent
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then a deal is created by "translator_call_centre_agent@nbs.com" for user "translator_call_centre_agent@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove document for deal as "call_centre_agent"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
    # agent
    And I sign in as agent@nbs.com with password secret
    Then a deal is created by "agent@nbs.com" for user "agent@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove document for deal as "agent"
    Then I follow translated logout link for agent@nbs.com

  @_added @_done @_tested
  Scenario: admin/call center/call center agent/agent can attach multiple pictures
    # admin
    And I sign in as admin@nbs.com with password secret
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove image for deal as "administration"
    Then I follow translated logout link for admin@nbs.com
    # call centre
    And I sign in as translator_call_centre@nbs.com with password secret
    Then a deal is created by "translator_call_centre@nbs.com" for user "translator_call_centre@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove image for deal as "call_centre"
    Then I follow translated logout link for translator_call_centre@nbs.com
    # call centre agent
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then a deal is created by "translator_call_centre_agent@nbs.com" for user "translator_call_centre_agent@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove image for deal as "call_centre_agent"
    Then I follow translated logout link for translator_call_centre_agent@nbs.com
    # agent
    And I sign in as agent@nbs.com with password secret
    Then a deal is created by "agent@nbs.com" for user "agent@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I add and remove image for deal as "agent"
    Then I follow translated logout link for agent@nbs.com

  #(but the deal must sign up sales manager, and will not have the option not to sign up)
  @_done @_deprecated
  Scenario: The recipient of the certification request email must register as new sales manager

  @_done @_tested_elsewhere
  Scenario: Call centre / agent is set to be the deal admin
    
  @_done @_tested_elsewhere
  Scenario: Lead category can be selected when deal is generated by admin/call centre/agent

  #7652
  @m20 @requested @tgn @selenium @_tested @_done
  Scenario: When creating new deal checkbox Use company name as category should be checked by default
    Given I sign in as translator_call_centre@nbs.com with password secret
    When I follow translated "layout.main_menu.call_centre.deals"
    And I follow translated "deals.common.listing.view.new_deal"
    And I follow translated "call_centre.deals.new.view.certify"
    And the "deal_use_company_name_as_category" checkbox should be checked
