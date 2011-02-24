@lead_manager @$_big_buyer @m5 @ao
Feature: Ordered leads filter for big buyer

  @_done @wip
  Scenario: I can browse not paginated list of lead ordered and not invoiced
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
    And User jon@lajoie.ca with role customer is big buyer
    And lead Printers ultimate deal exists within category Computers
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to leads
    And I follow "Computers"
    And I follow translated "leads.index.buy_lead"
    And I follow translated "layout.main_menu.customer.not_invoiced"
    Then I should see "1" rows in a table within "#not_invoiced_leads"

