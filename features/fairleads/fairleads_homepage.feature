#8644
@m24 @_requested @fairleads_homepage
Feature: Faileads homepage

  Background:
    Given I am on the home page

  @_done @_tested
  Scenario: I should not see browse deals on Fairleads homepage as guest
    Then I should not see translated "layout.main_menu.shared.browse_deals"

  @_done @_tested
  Scenario: I should not see browse deals on Fairleads homepage as supplier and category supplier
    When I am signed up and confirmed as user with email supplier@nbs.fake and password secret and role supplier
    And I sign in as supplier@nbs.fake with password secret
    Then I should not see translated "layout.main_menu.shared.browse_deals"
