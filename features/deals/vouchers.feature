@m24 @vouchers @is
Feature: Vouchers

  Background:
  Given I am on the homepage

  @_done @_tested
  Scenario: When voucher is enabled for deal then 'get deal' request redirect to deal information request page, after click on "ok" user is redirected to paypal for payment
    And I visit domain http://fairdeals.eu
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:3"
    Then voucher number with index "0" for deal "software components" has number "000000001" and state "new"
    And I am signed up and confirmed as user with email translator_purchase_manager@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,billing_cycle:10"
    And user with email "translator_purchase_manager@nbs.com" upgrades to subscription named "Premium member"
    And I sign in as translator_purchase_manager@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should see "software components"
    Then I follow translated "deals.index.view.view_deal"
    Then I follow translated "deals.index.view.contact_me"
    And I press translated "member.leads.new.view.button_create"
    Then I press translated "member.leads.show.view.ok_confirmation"
    Then I should see "redirecting to paypal, please wait..."
    #check paypal response
    Then paypal voucher payment for deal "software components" and user with email "translator_purchase_manager@nbs.com" and role "member"
    Then last email sent should have been sent to recipient "translator_purchase_manager@nbs.com"
    Then last email sent should have subject "You have new voucher"
    #check displaying
    And I visit domain http://fairdeals.eu
    Then I follow translated "layout.fairdeals.main_menu.member.my_requests"
    And I click hidden link by url regex "/members\/requests\/\d+\/edit/"
    Then I should see translated "member.leads.edit.view.voucher_label"
    Then I follow translated "member.leads.edit.view.voucher_link"


  @_done @_tested
  Scenario: Deal is not displayed when max number of vouchers has been bought
    And I visit domain http://fairdeals.eu
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:1"
    And I am signed up and confirmed as user with email translator_purchase_manager@nbs.com and password supersecret and role member
    Then voucher number with index "0" for deal "software components" has number "000000001" and state "active"
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,billing_cycle:10"
    And user with email "translator_purchase_manager@nbs.com" upgrades to subscription named "Premium member"
    And I sign in as translator_purchase_manager@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should not see "software components"

  @_done @tested_elsewhere
  Scenario: If member (purchase manager) have paid subscription he can buy voucher

  @_done @tested_elsewhere
  Scenario: Voucher can by bought through paypal

  @_done @tested_elsewhere
  Scenario: When voucher is bought an invoice is generated and set to paid

  @_done @tested_elsewhere
  Scenario: When voucher is bought an invoice is send to user

  @_done @tested_elsewhere
  Scenario: When voucher is bought lead is created as normal, and pdf voucher is generated

  @_done @tested_elsewhere
  Scenario: When voucher is bought pdf voucher is send to user in confirmation mail

  @_done @deprecated
  Scenario: When voucher is bought then unique 9 digit/capital_letters code is generated

  @_done @tested_elsewhere
  Scenario: When voucher is bought user can display it on get deal page: fairdeals logo, company logo, deal name, heading picture voucher value (deal price) price paid (discounted deal price) valid until, detailed description, fine print, how to redeem, voucher number (?)

  @selenium @_done @_tested
  Scenario: Admin can enable voucher for deal
    And I sign in as admin@nbs.com with password secret
    Then a deal is created by "admin@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I enable voucher with role "administration"

  @selenium @_done @_tested
  Scenario: Agent with deal maker role can enable voucher for deal
    And I visit domain http://faircalls.eu
    And I sign in as agent@nbs.com with password secret
    Then a deal is created by "agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I am on the agent deal edit page for super
    Then I should not see "Voucher enabled"
    Then user "agent@nbs.com" has deal maker role enabled
    Then I enable voucher with role "agent"

  @selenium @_done @_tested
  Scenario: Call center with deal maker role can enable voucher for deal
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    Then a deal is created by "translator_call_centre@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I am on the call_centre deal edit page for super
    Then I should not see "Voucher enabled"
    Then user "translator_call_centre@nbs.com" has deal maker role enabled
    Then I enable voucher with role "call_centre"

  @selenium @_done @_tested
  Scenario: Call center agent with deal maker role can enable voucher for deal
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then a deal is created by "translator_call_centre_agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I am on the call_centre_agent deal edit page for super
    Then I should not see "Voucher enabled"
    Then user "translator_call_centre_agent@nbs.com" has deal maker role enabled
    Then I enable voucher with role "call_centre_agent"

  @_done @_tested_elsewhere
  Scenario: When deal has enabled voucher then admin/agent can edit how_to_redeem and valid_until (fix date or number of weeks from procurement date) and number of vouchers

  @_done @_tested
  Scenario: When deal has enabled voucher then admin/agent can edit heading picture
    Then I add picture for voucher with role "admin"
    Then I add picture for voucher with role "agent"
    Then I add picture for voucher with role "call_centre"
    Then I add picture for voucher with role "call_centre_agent"

  @_done @_tested
  Scenario: Supplier can see voucher information but can not edit it
    And I sign in as buyer@nbs.com with password secret
    Then there are no object for model "Deal"
    Then a deal is created by "translator_call_centre_agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks"
    Then I am on the supplier deal edit page for super
    Then I should see "Voucher enabled"
    Then I should not see "Deal id"
    Then I should not see "How to redeem"
    Then I should not see "Voucher number of weeks"
    Then I should not see "Voucher end date"
    Then I should not see "Voucher max number"
    Then there are no object for model "Deal"
    Then a deal is created by "agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks|voucher_enabled:true|voucher_until_type:0|deal_price:2|discounted_price:1|voucher_max_number:3|voucher_end_date:2012-12-12"
    Then I am on the supplier deal edit page for super
    Then there are no object for model "Deal"
    Then I should see "Voucher enabled"
    Then I should see "Deal id"
    Then I should see "How to redeem"
    Then I should not see "Voucher number of weeks"
    Then I should see "Voucher end date"
    Then I should see "Voucher max number"
    Then a deal is created by "agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:3"
    Then voucher number with index "0" for deal "super" has number "000000001" and state "new"
    Then voucher number with index "2" for deal "super" has number "000000002" and state "used"
    Then voucher number with index "1" for deal "super" has number "000000003" and state "active"
    Then I am on the supplier deal edit page for super
    Then I should see "Voucher enabled"
    Then I should see "Deal id"
    Then I should see "How to redeem"
    Then I should see "Voucher number of weeks"
    Then I should not see "Voucher end date"
    Then I should see "Voucher max number"
    Then I should see "000000001 (New)"
    Then I should see "000000002 (Used)"
    Then I should see "000000003 (Active)"

  @_done @_tested
  Scenario: user (without being log in) can validate voucher on home page with button "validate voucher"
    Then I press translated "supplier_home.show.view.validate_voucher_button"
    Then a deal is created by "agent@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:starks|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:3|"
    Then voucher number with index "0" for deal "super" has number "000000001" and state "new"
    Then voucher number with index "2" for deal "super" has number "000000002" and state "used"
    Then voucher number with index "1" for deal "super" has number "000000003" and state "active"
    Then I validate voucher with deal header "super" and number "000000001" then I should see message "models.voucher_number.validate_voucher_result.invalid"
    Then I validate voucher with deal header "super" and number "000000002" then I should see message "models.voucher_number.validate_voucher_result.already_used"
    Then I validate voucher with deal header "error" and number "000000003" then I should see message "models.voucher_number.validate_voucher_result.invalid"
    Then I validate voucher with deal header "super" and number "000000003" then I should see message "use_voucher.show.text"
    Then I follow translated "use_voucher.show.back_link"
    Then I validate voucher with deal header "super" and number "000000003" then I should see message "use_voucher.show.text"
    Then voucher number with number "000000003" for deal "super" should have state "active"
    Then I press translated "use_voucher.show.activate_button"
    Then I should see translated "models.voucher_number.use_voucher_result.used"
    Then voucher number with number "000000003" for deal "super" should have state "used"

  @_done @_tested_elsewhere
  Scenario: user can provide unique code and validate it after he click "validate voucher"

  @_done @_tested_elsewhere
  Scenario: user receive proper message after voucher validation

  @_done @_tested_elsewhere
  Scenario: user can use voucher after successful validation