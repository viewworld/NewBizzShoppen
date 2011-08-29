@m18 @category_buyer_deals
Feature: Deals

  @_done @_tested
  Scenario: I can not see deals
    When Category CategoryBuyerCategory is created
    And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_buyer" for category "CategoryBuyerCategory"
    And I am on the home page
    And I sign in as kategory_bajer@nbs.com with password secret
    Then I should not see CSS path "a[tab='browse_deals']"
    Then I should not see CSS path "a[tab='deals']"

  @_deprecated
  Scenario: Admin should be able to check an option in settings to show deals for category buyers