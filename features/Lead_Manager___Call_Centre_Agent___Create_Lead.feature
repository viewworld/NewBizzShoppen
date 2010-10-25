@lead_manager @$_call_centre_agent @m3
Feature: Lead Manager - Call Centre Agent - Create Lead

In order to create and manage leads I sell
As an Agent
I can use my agent panel

Background:
I log into the system as an Agent
And I go to Agent Panel

#(full example of a user story including steps made by programmers during the development)
Scenario: I can create a new lead and close
  Given I click “Create Lead”
  Then I should see “CREATE LEAD”
  And I fill in “header” with “This lead wants to buy 100 printers this month”
  And I fill in “purchase_desc” with “Lorem ipsum”
  And I fill in “hidden_desc” with “Lorem ipsum hidden”
  And I fill in “purchase_value” with “10000”
  And I fill in “lead_price” with “100”
  And I fill in “unikness” with “3”
  And I fill in “area” with “global”
  And I select “Poland” from “country”
  And I select “English” from “language”
  And I fill in “company_name” with “Printing company”
  And I fill in “lead_name” with “Marek Kowalski”
  And I fill in “telephone” with “123456789”
  And I fill in “email” with “my@email.com”
  And I fill in “address” with “ul.Kaminskiego 19”
  And I submit with “Create &amp;amp;amp; Close”
  And I should see “LEAD LIST”

Scenario: I can create a new lead and continue (create another one)

Scenario: I can add an extra language while creating lead. This will include lead title, purchase desc, hidden desc