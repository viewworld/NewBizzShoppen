@m34 @_requested
Feature: Vouchers purchase

  @_done @_tested @selenium
  Scenario: When voucher is enabled for deal then 'get deal' and user chooses Dankort then user is redirected to Quickpay
    Given I am on the homepage
    And I visit domain http://fairdeals.eu
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "published:1|header:software components|description:short desc about software|hidden_description:super|start_date:2011-01-01|end_date:2016-12-12|company_name:Xeper|deal_code:CODE4D3AL|voucher_enabled:true|voucher_until_type:1|deal_price:2|discounted_price:1|voucher_max_number:3|voucher_how_to_redeem:you can redeem it by calling me"
    And deal "software components" has currency "DKK"
    Then voucher number with index "0" for deal "software components" has number "000000001" and state "new"
    And I am signed up and confirmed as user with email translator_purchase_manager@nbs.com and password supersecret and role member
    When subscription plan exists with attributes "name:Premium member,assigned_roles:member,subscription_period:10,billing_cycle:10"
    And user with email "translator_purchase_manager@nbs.com" upgrades to subscription named "Premium member"
    And I sign in as translator_purchase_manager@nbs.com with password secret
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Business deals"
    Then I should see "software components"
    Then I follow translated "deals.index.view.view_deal"
    Then I follow translated "deals.index.view.contact_me"
    And I wait 2 second
    And I choose "payment_type_2"
    #check paypal response
    Then quickpay voucher payment succeeded for deal "software components" and user with email "translator_purchase_manager@nbs.com" and role "member"
    Then last email sent should have been sent to recipient "translator_purchase_manager@nbs.com"
    Then last email sent should have subject "You have new voucher"
    #check displaying
    And I visit domain http://fairdeals.eu
    Then I follow translated "layout.fairdeals.main_menu.member.my_requests"
    And I click hidden link by url regex "/\/deals\/\d+/"
    And I should see "you can redeem it by calling me"
    Then I should see translated "member.leads.edit.view.voucher_label"
    Then I follow translated "member.leads.edit.view.voucher_link"

  @_done @_tested_elsewhere @_rspec
  Scenario: When payment notification comes then the invoice is generated and sent to user

  @_done @_tested_elsewhere @_rspec
  Scenario: Invoice is generated with appropriate transaction

