@m18 @category_buyer_deals
Feature: Deals

  @_done @_tested
  Scenario: I can not see deals
    When Category CategoryBuyerCategory is created
    And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_supplier" for category "CategoryBuyerCategory"
    And I am on the home page
    And I sign in as kategory_bajer@nbs.com with password secret
    Then I should not see CSS path "a[tab='browse_deals']"
    Then I should not see CSS path "a[tab='deals']"

  @_done @_tested
  Scenario: Admin should be able to check an option in settings to show deals for category buyers
    When Category CategoryBuyerCategory is created
    And I am signed up and confirmed as user with email "kategory_bajer@nbs.com" and password "secret" and role "category_supplier" for category "CategoryBuyerCategory"
    Given I am not sign in
    And I sign in as blazejek@gmail.com with password secret
    And I follow translated "layout.main_menu.admin.users"
    And I fill in "search_with_keyword" with "kategory_bajer@nbs.com"
    And I press translated "administration.users.index.view.search_button"
    And I follow translated "administration.users.index.view.edit"
    And I check "user_category_supplier_show_deals"
    And I uncheck "user_category_supplier_dont_show_my_deals"
    And I press translated "administration.users.edit.view.button_update_user"
    Given I am not sign in
    And I sign in as kategory_bajer@nbs.com with password secret
    Then I should see CSS path "a[tab='browse_deals']"
