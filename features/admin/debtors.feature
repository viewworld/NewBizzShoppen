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
    And a lead TestLead1 exists within category Computers and is bought by user kastomer@nbs.fake with role supplier
    And a lead TestLead2 exists within category Computers and is bought by user kastomer2@nbs.fake with role supplier

  @m6 @ao @_done @nontestable
  Scenario: When I click on row on debtors listing then an invoice should be created

  @m21 @requested @subscriptions
  Scenario: I can filter debtors by type (ad hoc / subscribers)

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

  @m21 @requested @subscriptions
  Scenario: When lead is bought the user is added ad-hoc flag

  @m21 @requested @subscriptions
  Scenario: At subscription billing date user is added a subscriber flag

  @m21 @requested @subscriptions
  Scenario: If user has ad-hoc flag then at subscription date items are added to subscription invoice and flag is changed to subscriber

  @m21 @requested @tgn @_done @tested_elsewhere
  Scenario: I can select multiple debtors (checkboxes)

  @m21 @requested @tgn @_done @tested_elsewhere
  Scenario: I can click "Invoice selected" to generate invoices for selected users

  @m21 @requested @selenium @tgn @_tested @_done
  Scenario: When multiple debtors are selected for invoicing then seller company is assigned to each of them based on their country
    Given there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123" for country "Denmark"
    And there is a seller with attributes "company_name:UKDannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:456" for country "United Kingdom"
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I check "mark_all"
    And I follow translated "administration.upcoming_invoices.index.view.invoice_selected"
    Then first invoice for user "kastomer@nbs.fake" with role "supplier" has seller for country "Denmark"
    And first invoice for user "kastomer2@nbs.fake" with role "supplier" has seller for country "United Kingdom"

  @m21 @requested @tgn @_done @_tested
  Scenario: I should see total amount of money that should be paid by debtors in the bottom of the table
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    Then I should see "240"

  @m21 @requested @tgn @non_testable @_done
  Scenario: Debtors list should NOT be paginated
  
  @m21 @requested @subscriptions
  Scenario: I can see members in the debtors list and invoice them as suppliers

 @m21 @requested @selenium @_done @_tested @tgn
  Scenario: When multiple debtors are selected for invoicing then if there is no seller than default one is applied
    Given Country Sweden is created
    Given there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123" for country "Denmark"
    Given there is a seller with attributes "company_name:DannyTheSeller,first_name:Danny,last_name:DeVito,vat_no:123,default:1" for country "Sweden"
    When I click hidden link by url regex "/administration\/invoicing\/upcoming_invoices/"
    And I check "mark_all"
    And I follow translated "administration.upcoming_invoices.index.view.invoice_selected"
    Then first invoice for user "kastomer@nbs.fake" with role "supplier" has seller for country "Denmark"
    And first invoice for user "kastomer2@nbs.fake" with role "supplier" has seller for country "Sweden"
    
  @m21 @requested @subscriptions
  Scenario: Not invoiced items should be added to the subscription invoice at billing time