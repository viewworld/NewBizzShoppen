@m18 @general_deals
Feature: General deals

  @_done
  Scenario: Default end date for deal should be set to 1 year from current date
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:starks"
    Then the only deal should have end date set to one year from now

  @_done @_tested @tgn @selenium
  Scenario: Leads created from deals should be marked as certified
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:Asd|published:1|deal_admin_email:agent@nbs.com"
    Then I am not sign in
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    And lead "A company is interested in super" certification status should be "3"

  @_done @_tested @selenium @tgn
  Scenario: I can set a default auto buy max per deal per 4 weeks
    Given setting for "default_max_auto_buy_per_4_weeks" is set to "7"
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    And I am on the homepage
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    And the "1" field with id like "deal_max_auto_buy" should contain "7"
    And I fill in "deal_max_auto_buy" with "5"
    Then I press translated "buyer.deals.new.view.create_button"

  @_done @tested_elsewhere @tgn
  Scenario: Default auto buy max should be taken from settings

  @_done @_tested @selenium @tgn
  Scenario: When auto buy max is 0 than auto buy should be disabled
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:0|header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:Asd|published:1|deal_admin_email:agent@nbs.com"
    Then I am not sign in
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    Then lead generated from deal in category "Asd" by "purchase_manager101@nbs.com" is not bought

   @_done @_tested @selenium @tgn
   Scenario: When auto buy max is larger then 0 but less then currently purchased size then auto buy should be enabled
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:Asd|published:1|deal_admin_email:agent@nbs.com"
    Then I am not sign in
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    Then lead generated from deal in category "Asd" by "purchase_manager101@nbs.com" is bought

  @_done @_tested @selenium @tgn
  Scenario: When auto buy max is larger then 0 but greater or equal to currently purchased size then auto buy should be disabled
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:Asd|published:1|deal_admin_email:agent@nbs.com"
    Then I am not sign in
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    Then lead generated from deal in category "Asd" by "purchase_manager101@nbs.com" is bought
    Then I am not sign in
    And I am signed up and confirmed as user with email purchase_manager202@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager202@nbs.com with password supersecret
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    Then lead generated from deal in category "Asd" by "purchase_manager202@nbs.com" is not bought

  @_done @_tested @tgn
  Scenario: When auto buy is enabled for category with existing leads then they should also be bought
    Given Category TestRemainingLeads is created
    And lead "Test remaining leads #1" is created in category "TestRemainingLeads" by user "agent@nbs.com" with role "agent"
    And lead "Test remaining leads #2" is created in category "TestRemainingLeads" by user "agent@nbs.com" with role "agent"
    And category "TestRemainingLeads" is unique for user with email "buyer@nbs.com" role "supplier"
    And category "TestRemainingLeads" is unique for some customers users and is auto buy
    And lead "Test remaining leads #1" should be bought by user with email "buyer@nbs.com"
    And lead "Test remaining leads #2" should be bought by user with email "buyer@nbs.com"

  @selenium @_done @_tested @tgn
  Scenario: When small buyer creates deal he/she becomes big buyer and the category created is added to his/hers subscriptions
    Given I am signed up and confirmed as user with email small_buyer@nbs.com and password secret and role supplier
    And user small_buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as small_buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    Then I press translated "buyer.deals.new.view.create_button"
    And user "small_buyer@nbs.com" should be big buyer
    And category "Xeper" is in interests of user "small_buyer@nbs.com" "true"
    And category named "Xeper" is auto buy enabled

  #7530
  @m20 @requested @tgn @selenium @_tested @_done
  Scenario: I can enter the deal code when creating new deal
    Given I am signed up and confirmed as user with email small_buyer@nbs.com and password secret and role supplier
    And user small_buyer@nbs.com with role supplier exists with attributes "company_name:Xeper"
    And I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as small_buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    Then I follow translated "deals.common.listing.view.new_deal"
    Then I fill deal creation form
    And I fill in "deal_deal_code" with "XCDGF"
    Then I press translated "buyer.deals.new.view.create_button"

  #7448
  @m20 @requested @selenium @tgn @_tested @_done
  Scenario: Under deal view for any deal maker the leads generated should be listed below (newest on the top)
    When there are no deals
    And user buyer@nbs.com with role supplier exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "max_auto_buy:1|header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:Asd|published:1|deal_admin_email:agent@nbs.com"
    Then I am not sign in
    And I am signed up and confirmed as user with email purchase_manager101@nbs.com and password supersecret and role member
    Then I sign in as purchase_manager101@nbs.com with password supersecret
    And I follow translated "layout.main_menu.shared.browse_deals"
    And I follow category "Business deals"
    And I follow translated "deals.index.view.view_deal"
    Then I confirm a js popup on the next step
    And I follow translated "deals.index.view.contact_me"
    And I fill in "lead_hidden_description" with "some hidden note"
    And I press translated "purchase_manager.leads.new.view.button_create"
    And I press translated "purchase_manager.leads.show.view.ok_confirmation"
    Then I am not sign in
    And I am on the homepage
    And I sign in as buyer@nbs.com with password secret
    Then I follow translated "layout.main_menu.lead_supplier.my_deals"
    And I click hidden link by url regex "/buyers\/deals\/\d+\/edit/"
    And I should see "A company is interested in super"

  #7847
  @m20 @requested @tgn @_done @_tested
  Scenario: When  deal price is NOT empty and deal discounted price is empty then display Saving 100% but do not display price
    Given a deal named "Abc group deal #1" exists within category "Electronics deals"
    And a deal named "Abc group deal #1" exists with attributes "published:1,group_deal:1,price:123,deal_price:120,discounted_price:0,social_media_description:quo vadis"
    Given I visit domain http://fairdeals.dk
    Then I follow translated "layout.fairdeals.main_menu.deals"
    And I follow category "Electronics deals"
    And I follow "Abc group deal #1"
    Then I should not see translated "deals.listing.price"
    And I should not see translated "deals.listing.discounted_price"
    But I should see "100%"
    And I should not see "120"