@customer @ao  @requested
Feature: Buyer common

  @m6 @_done @_tested @_done
  Scenario: I should see buyer specific contact us page
    Given I am signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
    And I am on the home page
    And I sign in as kastomer@nbs.com with password secret
    And I follow translated "layout.contact_us"
    Then I should see "Blurb buyer contact us"