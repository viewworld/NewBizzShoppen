@customer @ao
Feature: Buyer common

  @m6 @_done @_tested
  Scenario: I should see buyer specific contact us page
    Given I am signed up and confirmed as user with email kastomer@nbs.com and password secret and role customer
    And I am on the home page
    And I sign in as kastomer@nbs.com with password secret
    And I follow translated "layout.contact_us"
    Then I should see "Blurb buyer contact us"
    And I sign out
    When I am signed up and confirmed as user with email ejdzent@nbs.com and password secret and role agent
    And I am on the home page
    And I sign in as ejdzent@nbs.com with password secret
    And I follow translated "layout.contact_us"
    Then I should see "Blurb agent contact us"
