@m18 @general_users
Feature: General users
  Background:
    Given I am on the homepage
    And I have user with email buyer101@nbs.com and role supplier
    And I sign in as blazejek@gmail.com with password secret
    And I follow translated "layout.main_menu.admin.users"

  #  By titel i mean. CEO, CTO, COO, Marketing director etc. For roles i mean Contact, Buyer, Procurment manager
  @_tested @_done @tgn
  Scenario: I can set title for buyers, procurement managers
    And I fill in "search_with_keyword" with "buyer101@nbs.com"
    And I press translated "administration.users.index.view.search_button"
    And I follow translated "administration.users.index.view.edit"
    And I fill in "user_supplier_title" with "CEO Manager"
    And I press translated "administration.users.edit.view.button_update_user"

  @_tested @_done @tgn
  Scenario: I can set title for contacts
    And I follow translated "layout.main_menu.admin.campaigns"
    And I fill in "search_with_keyword" with "Testing One"
    And I press translated "campaigns.filter.search_button"
    When I click hidden link by url regex "/callers\/campaigns\/\d+\/edit/"
    And I follow translated "campaigns.edit.button_create_contact"
    And I fill in "contact_contact_title" with "CEO"

  #7379
  @m20 @_requested @is
  Scenario: User role names should be renamed across the system Procurement manager to Member, Buyer to Supplier, Category Buyer to Category Supplier