@invoices  @requested
Feature: Debtors

  @m6 @ao @_done @nontestable
  Scenario: When I click on row on debtors listing then an invoice should be created

  @m21 @requested @subscriptions
  Scenario: I can filter debtors by type (ad hoc / subscribers)

  @m21 @requested @subscriptions
  Scenario: I can filter debtors by role

  @m21 @requested @subscriptions
  Scenario: When lead is bought the user is added ad-hoc flag

  @m21 @requested @subscriptions
  Scenario: At subscription billing date user is added a subscriber flag

  @m21 @requested @subscriptions
  Scenario: If user has ad-hoc flag then at subscription date items are added to subscription invoice and flag is changed to subscriber

  @m21 @requested
  Scenario: I can select multiple debtors (checkboxes)

  @m21 @requested
  Scenario: I can click "Invoice selected" to generate invoices for selected users

  @m21 @requested
  Scenario: When multiple debtors are selected for invoicing then seller company is assigned to each of them based on their country

  @m21 @requested
  Scenario: When multiple debtors are selected for invoicing then if there is no seller than default one is applied

  @m21 @requested
  Scenario: I should see total amount of money that should be paid by debtors in the bottom of the table

  @m21 @requested
  Scenario: Debtors list should NOT be paginated

  @m21 @requested @subscriptions
  Scenario: I can see members in the debtors list and invoice them as suppliers

  @m21 @requested @subscriptions
  Scenario: Not invoiced items should be added to the subscription invoice at billing time