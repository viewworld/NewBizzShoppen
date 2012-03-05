@lead_manager @$_big_buyer @m5 @ao
Feature: Ordered leads filter for big buyer

  @_done
  Scenario: I can browse not paginated list of lead ordered and not invoiced
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And User jon@lajoie.ca with role supplier is big buyer
    And lead Printers ultimate deal exists within category Computers
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to leads
    And I follow category "Computers"
    And I follow translated "leads.index.buy_lead"
    And I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.pending_leads"
    Then I should see "1" rows in a table with headers within "#not_invoiced_leads"

  @m8b @_requested @_done @_tested
  Scenario: Big buyer should have Invoices tab with options: 'Pending leads' - current Not invoiced leads, 'Due invoices' - unpaid invoices, 'Paid' paid invoices
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role supplier
    And User jon@lajoie.ca with role supplier is big buyer
    And a lead Monitors ultimate deal exists within category Computers and is bought by user jon@lajoie.ca with role supplier
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should not see translated "layout.main_menu.supplier.not_invoiced"
    When I follow translated "layout.main_menu.supplier.invoices"
    And I follow translated "supplier.invoices.index.view.pending_leads"
    Then I should see "Monitors ultimate deal"
    When I follow translated "supplier.invoices.index.view.due_invoices"
    Then I should not see "Monitors ultimate deal"
    When user with email "jon@lajoie.ca" and role "supplier" has invoice generated for all unpaid leads
    And I follow translated "supplier.invoices.index.view.paid_invoices"
    And I follow translated "supplier.invoices.index.view.show_invoice"
    Then I should see "Monitors ultimate deal"
