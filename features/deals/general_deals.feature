@m18 @general_deals
Feature: General deals

  @_done
  Scenario: Default end date for deal should be set to 1 year from current date
    When there are no deals
    And user buyer@nbs.com with role customer exists with attributes "company_name:Asd"
    And user "buyer@nbs.com" has assigned role "deal_maker"
    Then a deal is created by "buyer@nbs.com" for user "buyer@nbs.com" and category "Business deals" with attributes "header:super|description:super|hidden_description:super|start_date:2011-01-01|company_name:starks"
    Then the only deal should have end date set to one year from now

  Scenario: Leads created from deal requests should be certified by default

  Scenario: Leads created from deals should be marked as certified

  Scenario: I can set a default auto buy max per deal per 4 weeks

  Scenario: Default auto buy max should be taken from settings

  Scenario: When auto buy max is 0 than auto buy should be disabled

  Scenario: When auto buy max is larger then 0 but less then currently purchased size then auto buy should be enabled

  Scenario: When auto buy max is larger then 0 but greater or equal to currently purchased size then auto buy should be disabled

  Scenario: When auto buy is enabled for category with existing leads then they should also be bought