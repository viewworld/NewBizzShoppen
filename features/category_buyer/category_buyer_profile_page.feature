@m13 @category_buyer_to_normal_buyer @is @$_category_buyer
Feature: Category buyer profile page
  Background:
    And I am signed up and confirmed as user with email "scorpion@mk2.com" and password "secret" and role "category_supplier" for category "Business"
    And an user with role lead_supplier and email kitana@mk2.com exists as subaccount for customer scorpion@mk2.com
    And I am on the home page

  @$_category_buyer @_done @_tested @_deprecated
  Scenario: I can switch my account to normal buyer account
#    And I sign in as scorpion@mk2.com with password secret
#    Then I follow translated "layout.my_profile_link"
#    Then I should see translated "my_profile.edit.view.remove_category_supplier"
#    Then I follow translated "my_profile.edit.view.remove_category_supplier"
#    Then I should see translated "my_profile.change_to_supplier.controller.success"
#    Then I should not see translated "my_profile.edit.view.remove_category_supplier"
#    Then user "scorpion@mk2.com" is no longer category buyer as all his subaccounts

  @$_category_buyer_subaccount @_done @_tested @_deprecated
  Scenario: I can't switch my account to normal buyer when I'm a team buyer
#    And I sign in as kitana@mk2.com with password secret
#    Then I follow translated "layout.my_profile_link"
#    Then I should not see translated "my_profile.edit.view.remove_category_supplier"