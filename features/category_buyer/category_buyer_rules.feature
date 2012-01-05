@m5 @category_home_pages @ao
Feature: Category buyer rules

  @_done
  Scenario: I can't access category home pages other than the one I registered from
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I visit URL "/worst-leads"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can't see categories other than the one I registered from
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I visit URL "/categories"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can add lead users when registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.supplier.subaccounts"
    Then I follow translated "supplier.subaccounts.index.view.new_lead_user"
    And I fill in "user_lead_user_first_name" with "Mark"
    And I fill in "user_lead_user_last_name" with "Driscoll"
    And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_user_screen_name" with "ML Driscoll"
    And I fill in "user_lead_user_password" with "secret"
    And I fill in "user_lead_user_password_confirmation" with "secret"
    And I press translated "supplier.subaccounts.new.view.button_create"
    Then I should see translated "supplier.subaccounts.create.flash.subaccount_creation_successful"
    And user "driscoll@person.noserver.com" should have role "category_supplier"

  @_done
  Scenario: I can add lead buyers when registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.supplier.subaccounts"
    Then I follow translated "supplier.subaccounts.index.view.new_lead_supplier"
    And I fill in "user_lead_supplier_first_name" with "Mark"
    And I fill in "user_lead_supplier_last_name" with "Driscoll"
    And I fill in "user_lead_supplier_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_supplier_screen_name" with "ML Driscoll"
    And I fill in "user_lead_supplier_password" with "secret"
    And I fill in "user_lead_supplier_password_confirmation" with "secret"
    And I press translated "supplier.subaccounts.new.view.button_create"
    Then I should see translated "supplier.subaccounts.create.flash.subaccount_creation_successful"
    And user "driscoll@person.noserver.com" should have role "category_supplier"

  @_done
  Scenario: Subaccounts should have access only to parents category
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.supplier.subaccounts"
    Then I follow translated "supplier.subaccounts.index.view.new_lead_supplier"
    And I fill in "user_lead_supplier_first_name" with "Mark"
    And I fill in "user_lead_supplier_last_name" with "Driscoll"
    And I fill in "user_lead_supplier_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_supplier_screen_name" with "ML Driscoll"
    And I fill in "user_lead_supplier_password" with "secret"
    And I fill in "user_lead_supplier_password_confirmation" with "secret"
    And I press translated "supplier.subaccounts.new.view.button_create"
    And I sign out
    And user "driscoll@person.noserver.com" is confirmed
    And I sign in as driscoll@person.noserver.com with password secret
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.browse_leads"
    Then I should be on category home leads page for Best Leads
    When I visit URL "/categories"
    Then I should be on category home page for Best Leads
    When I visit URL "/leads"
    Then I should be on category home page for Best Leads

  @m6 @_done @_tested  @requested
  Scenario: Category buyers should not have to configure their interest page, but have country selected to the country from which the category was design for.
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.my_profile_link"
    Then I should not see translated "my_profile.edit.view.interests_settings"
    When I am on supplier interests
    Then I should see "You are not authorized"

  @m6 @selenium @_done @_tested  @requested
  Scenario: If category buyer has more than one category assigned, when browsing leads he should see "Category dropdown" which will redirect him to correct category scope when filtering
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And user "jon@lajoie.ca" is assigned to category "Worst Leads" as category buyer
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.browse_leads"
    Then "category" dropdown should have values "Best Leads,Worst Leads"
    And I select "Worst Leads" from "category"
    Then I should be on category leads page for Worst Leads

  @m6 @added @_done @_tested
  Scenario: If category buyer has more than one category he can access all of them
    When Category named "Basic Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Basic Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And user "jon@lajoie.ca" is assigned to category "Worst Leads" as category buyer
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    Then I should be on category leads page for Basic Leads
    And I am on the category home page for Worst Leads
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    Then I should be on category leads page for Worst Leads

  @m6 @added @_done @_tested
  Scenario: Category buyer can't access categories he's not assigned to
    When Category named "Basic Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Basic Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I am on category home page for Worst Leads
    Then I should be on category home page for Basic Leads

  @m6 @added @_done @_tested
  Scenario: Subaccounts should have access to all parents category
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And user "jon@lajoie.ca" is assigned to category "Worst Leads" as category buyer
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.supplier.subaccounts"
    Then I follow translated "supplier.subaccounts.index.view.new_lead_supplier"
    And I fill in "user_lead_supplier_first_name" with "Mark"
    And I fill in "user_lead_supplier_last_name" with "Driscoll"
    And I fill in "user_lead_supplier_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_supplier_screen_name" with "ML Driscoll"
    And I fill in "user_lead_supplier_password" with "secret"
    And I fill in "user_lead_supplier_password_confirmation" with "secret"
    And I press translated "supplier.subaccounts.new.view.button_create"
    And I sign out
    And user "driscoll@person.noserver.com" is confirmed
    When I sign in as driscoll@person.noserver.com with password secret
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.browse_leads"
    Then I should be on category home leads page for Best Leads
    When I am on the category home page for Worst Leads
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    Then I should be on category leads page for Worst Leads

  @m6 @added @_done @_tested
  Scenario: Subaccounts for Category buyer can't access categories parent is not assigned to
    When Category named "Basic Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Basic Leads" with attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And an user with role lead_supplier and email stiw@lajoie.ca exists as subaccount for customer jon@lajoie.ca
    And I am on the home page
    And I sign in as stiw@lajoie.ca with password secret
    And I am on category home page for Worst Leads
    Then I should be on category home page for Basic Leads

  @m6 @added @_done @_tested @requested
  Scenario: I can't login when I have no categories assigned
    When Category named "SampleCat" already exists
    When I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "SampleCat"
    And user "jon@lajoie.ca" has no buying categories
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should see translated "common.no_categories_for_category_supplier"

  @m6 @added @ao @_done @_tested
  Scenario: I can edit lead buyer that belongs to my account
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads"
    And user "jon@lajoie.ca" with role "category_supplier" has attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And an user with role lead_supplier and email lead_buyer@nbs.com exists as subaccount for customer jon@lajoie.ca
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And go to suppliers subaccounts
    Then I follow translated "supplier.subaccounts.index.view.edit"
    And I fill in "user_category_supplier_first_name" with "Justin"
    And I fill in "user_category_supplier_last_name" with "Bieber"
    And I press translated "supplier.subaccounts.edit.view.button_update"
    Then I should see translated "supplier.subaccounts.update.flash.subaccount_update_successful"
    And I should see "Justin"
    And I should see "Bieber"

  @m6 @added @ao @_done @_tested
  Scenario: I can edit lead user that belongs to my account
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Best Leads"
    And user "jon@lajoie.ca" with role "category_supplier" has attributes ""
    And user "jon@lajoie.ca" has team buyers enabled
    And an user with role lead_user and email lead_user@nbs.com exists as subaccount for customer jon@lajoie.ca
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And go to suppliers subaccounts
    Then I follow translated "supplier.subaccounts.index.view.edit"
    And I fill in "user_category_supplier_first_name" with "Justin"
    And I fill in "user_category_supplier_last_name" with "Bieber"
    And I press translated "supplier.subaccounts.edit.view.button_update"
    Then I should see translated "supplier.subaccounts.update.flash.subaccount_update_successful"
    And I should see "Justin"
    And I should see "Bieber"

  @m10 @requested @_done @_tested
  Scenario: I have access to all sub categories of my buying categories
    Given Category named "Computers" already exists within category named "Electronics"
    And lead Hapeki exists within category Computers
    And Category named "Consoles" already exists within category named "Electronics"
    And lead Iksboksy exists within category Consoles
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Electronics"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I am on category home leads page for Electronics
    Then I should see "Consoles" within "table.categories_table"
    And I should see "Computers" within "table.categories_table"
    And I should see "Hapeki"
    And I should see "Iksboksy"
    When I uncheck "Computers"
    And I press translated "leads.index.search.search_button"
    Then I should see "Iksboksy"
    And I should not see "Hapeki"

  @m10 @requested @_done @_tested
  Scenario: I don't have access to subcategories of other root categories
    Given Category named "Computers" already exists within category named "Electronics"
    And lead Hapeki exists within category Computers
    And Category named "Consoles" already exists within category named "Electronics"
    And lead Iksboksy exists within category Consoles
    And Category named "Kradzieze" already exists within category named "Business"
    And lead Kradziez exists within category Kradzieze
    And Category named "Wymuszenia" already exists within category named "Business"
    And lead WymuszeniePierwszenstwa exists within category Wymuszenia
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_supplier" for category "Electronics"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I am on category home leads page for Electronics
    Then I should not see "Kradziez" within "table.categories_table"
    And I should not see "WymuszeniePierwszenstwa" within "table.categories_table"

  #9513
  @m26 @requested
  Scenario: I can see My deals tab only when I have deal maker role or I was marked by admin as Show my deals

  #9513
  @m26 @requested
  Scenario: I can see Browse deals only when I was marked by admin as Show all deals

  #9512
  @m26 @requested
  Scenario: I can be marked by admin as Auto buy enabled and then all my categories become auto buy by default if possible (Then I don't see Browse leads)

