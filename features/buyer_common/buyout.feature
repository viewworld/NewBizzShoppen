@customer @ao
Feature: Buy out

  @m6 @wip
  Scenario: I can buy-out the lead if it's not bought by other buyer and category allows buyouts
    Given there are no leads
    And Category named "Computers" already exists
    And category "Computers" has attributes "buyout_enabled:1"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
    And lead Printers exists within category Computers
    And lead "Printers" has attributes "sale_limit:10,price:123"
    And a lead Monitors exists within category Computers and is bought by user monitor.buyer@nbs.com with role customer
    And lead "Monitors" has attributes "sale_limit:10,price:234"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I go to browse leads
    And I follow "Computers"

  @added @m6 @wip
  Scenario: I can't buy-out the lead if category doesn't allow buyouts
