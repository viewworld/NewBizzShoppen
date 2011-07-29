@m16 @requested @agent_deals @_deals @$_call_centre @$_agent
Feature: Deals from Call Centre/Agent perspective

  Background:
    Then user "translator_call_centre@nbs.com" has deal maker role enabled
    Then user "translator_call_centre_agent@nbs.com" has deal maker role enabled
    Given I am on the homepage

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
    Then I fill in "buyer_email" with "buyer@nbs.com"
    Then I follow translated "call_centre.deals.new.view.check_buyer_email"
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
    Then I follow translated logout link for translator_call_centre@nbs.com
    # call centre agent
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.call_centre_agent.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill in "buyer_email" with "buyer@nbs.com"
    Then I follow translated "call_centre_agent.deals.new.view.check_buyer_email"
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

  #the admin/call center/agent can create the deal and "certify it" in the same way a lead is certified.
  @selenium @_done @_tested
  Scenario: I can create new deal and certify (enter future sales manager's email)
    # call centre
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
    # admin
    And I sign in as admin@nbs.com with password secret
    Then I follow translated "layout.main_menu.admin.deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I follow translated "administration.deals.new.view.certify"
    Then I certify deal with translation "administration.deals.new.view.create_button"
    Then I follow translated logout link for admin@nbs.com
    # certification by buyer
    Then I have user with email ned@stark.com and role customer
    Then user "ned@stark.com" is confirmed
    Then I sign in as ned@stark.com with password secret
    Then I follow translated "layout.main_menu.lead_buyer.deals_to_certify"
    Then I follow translated "buyer.deal_certification_requests.index.view.certify"
    Then I press translated "buyer.deal_certification_requests.edit.view.certify"
    Then I should see translated "buyer.deal_certification_requests.update.flash.certify_success"
    Then I follow translated "buyer.deal_certification_requests.index.view.certify"
    Then I press translated "buyer.deal_certification_requests.edit.view.certify"
    Then I should see translated "buyer.deal_certification_requests.update.flash.certify_success"
    Then I follow translated "buyer.deal_certification_requests.index.view.certify"
    Then I press translated "buyer.deal_certification_requests.edit.view.reject"
    Then I should see translated "buyer.deal_certification_requests.update.flash.reject_success"
    Then I should not see translated "layout.main_menu.lead_buyer.deals_to_certify"

  #(but the deal must sign up sales manager, and will not have the option not to sign up)
  Scenario: The recipient of the certification request email must register as new sales manager

  @_done @_tested_elsewhere
  Scenario: Call centre / agent is set to be the deal admin
    
  @_done @_tested_elsewhere
  Scenario: Lead category can be selected when deal is generated by admin/call centre/agent