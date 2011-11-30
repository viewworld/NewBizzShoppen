@invoices  @requested
Feature: Debtors

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin

    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role supplier with attributes "first_name:Janko,last_name:Muzykant,company_name:Cello Ltd"
    And User kastomer@nbs.fake with role supplier is from country Denmark
    And User kastomer@nbs.fake with role supplier is big buyer
    And someone is signed up and confirmed as user with email kastomer2@nbs.fake and password secret and role supplier with attributes "first_name:Steve,last_name:Vai,company_name:Vaicom"
    And User kastomer2@nbs.fake with role supplier is from country United Kingdom
    And User kastomer2@nbs.fake with role supplier is big buyer
    Then I sign in as jon@lajoie.ca with password secret
    And lead TestLead1 exists with attributes "price:120"
    And lead TestLead2 exists with attributes "price:120"
    And currency "DKK" exists with attributes "exchange_rate:1"
    And lead TestLead1 exists with currency "DKK"
    And lead TestLead2 exists with currency "DKK"
    And a lead TestLead1 exists within category Computers and is bought by user kastomer@nbs.fake with role supplier
    And a lead TestLead2 exists within category Computers and is bought by user kastomer2@nbs.fake with role supplier

  @m6 @ao @_done @nontestable
  Scenario: When I click on row on debtors listing then an invoice should be created

  @m21 @requested @subscriptions @tgn @_tested @_done
  Scenario: I can filter debtors by type (ad hoc / subscribers)
    When I follow translated "layout.main_menu.admin.upcoming_invoices"
    And I select "Ad-hoc" from "search_with_subscriber_type"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    Then I should see "Muzykant"
    Then I should see "Vai"

  @m21 @requested @tgn @_done @_tested
  Scenario: I can filter debtors by role
    When I follow translated "layout.main_menu.admin.upcoming_invoices"
    Then I should see translated "administration.upcoming_invoices.index.view.search.with_role"
    When I select translated "administration.upcoming_invoices.index.view.search.role_supplier" from "search_with_role"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    And I should see "Janko Muzykant"
    When I select translated "administration.upcoming_invoices.index.view.search.role_member" from "search_with_role"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    And I should not see "Janko Muzykant"

  @m21 @requested @subscriptions @_done @tgn @tested_elsewhere
  Scenario: When lead is bought the user is added ad-hoc flag

  @m21 @requested @subscriptions @_done @_tested @tgn
  Scenario: At subscription billing date user is added a subscriber flag (rake task)
    Given subscription plan exists with attributes "name:Premium supplier, billing_cycle:2, billing_period:0"
    And subscription plan has currency named "DKK"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
      | subscr premium line2 |     3 |
    Given user with email "kastomer2@nbs.fake" upgrades to subscription named "Premium supplier"
    And user "kastomer2@nbs.fake" with role "supplier" should have attributes "subscriber_type:'ad-hoc'"
    And user subscriptions are reviewed by rake task
    And user "kastomer2@nbs.fake" with role "supplier" should have attributes "subscriber_type:'subscriber'"

  @m21 @requested @subscriptions @selenium @tgn @_done @_tested
  Scenario: If user has ad-hoc flag then at subscription date items are added to subscription invoice and flag is changed to subscriber
    Given subscription plan exists with attributes "name:Premium supplier, billing_cycle:12"
    And subscription plan has currency named "DKK"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
      | subscr premium line2 |     3 |
    Given user with email "kastomer2@nbs.fake" upgrades to subscription named "Premium supplier"
    And user with email "kastomer2@nbs.fake" has billing date today for active subscription
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I fill in "search_with_keyword" with "TestLead2"
    And I press translated "administration.upcoming_invoices.index.view.search_button"
    And I check "mark_all"
    And I follow translated "administration.upcoming_invoices.index.view.invoice_selected"
    Then I should not see "Vai"
    And user "kastomer2@nbs.fake" with role "supplier" should have attributes "subscriber_type:'subscriber'"
    And first invoice exists for user "kastomer2@nbs.fake" with the following invoice lines
      | name                 | netto_price |
      | TestLead2            |         120 |
      | subscr premium line1 |          99 |
      | subscr premium line2 |           3 |

  @m21 @requested @tgn @_done @tested_elsewhere
  Scenario: I can select multiple debtors (checkboxes)

  @m21 @requested @tgn @_done @tested_elsewhere
  Scenario: I can click "Invoice selected" to generate invoices for selected users

  @m21 @requested @selenium @tgn @_tested @_done @tgn
  Scenario: When multiple debtors are selected for invoicing then seller company is assigned to each of them based on their subscription's seller
    Given there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123" for country "Denmark"
    Given subscription plan exists with attributes "name:Premium supplier, billing_cycle:12"
    And subscription plan has currency named "DKK"
    And subscription plan has seller "DannyTheSeller"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
      | subscr premium line2 |     3 |
    Given user with email "kastomer@nbs.fake" upgrades to subscription named "Premium supplier"
    And user with email "kastomer@nbs.fake" has billing date today for active subscription
    Given user with email "kastomer2@nbs.fake" upgrades to subscription named "Premium supplier"
    And user with email "kastomer2@nbs.fake" has billing date today for active subscription

    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I check "mark_all"
    And I follow translated "administration.upcoming_invoices.index.view.invoice_selected"
    Then first invoice for user "kastomer@nbs.fake" with role "supplier" has seller with company name "DannyTheSeller"
    And first invoice for user "kastomer2@nbs.fake" with role "supplier" has seller with company name "DannyTheSeller"

  @m21 @requested @tgn @_done @_tested
  Scenario: I should see total amount of money that should be paid by debtors in the bottom of the table
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    Then I should see "240"

  @m21 @requested @tgn @non_testable @_done
  Scenario: Debtors list should NOT be paginated
  
  @m21 @requested @subscriptions @tgn @_done @_tested
  Scenario: I can see members in the debtors list and invoice them as suppliers
    Given I have user with email member7@rt.tv and role member
    And user "member7@rt.tv" with role "member" has attributes "first_name:Hank, last_name:Fox"
    Given subscription plan exists with attributes "name:Premium supplier, billing_cycle:12, assigned_roles:member"
    And subscription plan has currency named "DKK"
    And subscription plan has following lines
      | name                 | price |
      | subscr premium line1 |    99 |
      | subscr premium line2 |     3 |
    Given user with email "member7@rt.tv" upgrades to subscription named "Premium supplier"
    And user with email "member7@rt.tv" has billing date today for active subscription
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I should see "Fox"

 @m21 @requested @selenium @_done @tested_elsewhere @tgn
 Scenario: When multiple debtors are selected for invoicing then if there is no seller than default one is applied
    
 @m21 @requested @subscriptions @tgn @_done @tested_elsewhere
 Scenario: Not invoiced items should be added to the subscription invoice at billing time

 #8337
 @m22 @requested @tgn @_done @_tested
 Scenario: When I issue an invoice for subscriber then I should not see the screen to select user/seller
   Given there is a seller with attributes "name:TestSeller88, first_name:John, last_name:Koval, company_name:Trust"
   And subscription plan exists with attributes "name:TestSubPlan, billing_cycle:4"
   And subscription plan has seller "TestSeller88"
   And subscription plan has following lines
   | name                 | price |
   | subscr premium line1 |    99 |
   | subscr premium line2 |     3 |
   Given user with email "kastomer@nbs.fake" upgrades to subscription named "TestSubPlan"
   When I follow translated "layout.main_menu.admin.upcoming_invoices"
   Then I follow translated "administration.upcoming_invoices.index.view.create_invoice"
   And "invoice_seller_id" should be selected for value "TestSeller88"

 #8332
 @m22 @requested @_done @_tested @ao
 Scenario: I should see total value
   When I follow translated "layout.main_menu.admin.upcoming_invoices"
   Then I should see translated "administration.upcoming_invoices.index.view.total_in_euro"


