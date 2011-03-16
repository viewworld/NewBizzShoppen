@m5 @category_home_pages @ao
Feature: Category buyer rules

  @_done
  Scenario: I can't access category home pages other than the one I registered from
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I visit URL "/worst-leads"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can't see categories other than the one I registered from
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I visit URL "/categories"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can add lead users when registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_user"
    And I fill in "user_lead_user_first_name" with "Mark"
    And I fill in "user_lead_user_last_name" with "Driscoll"
    And I fill in "user_lead_user_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_user_screen_name" with "ML Driscoll"
    And I fill in "user_lead_user_password" with "secret"
    And I fill in "user_lead_user_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
    Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"
    And user "driscoll@person.noserver.com" should have role "category_buyer"

  @_done
  Scenario: I can add lead buyers when registered from category home page
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_buyer"
    And I fill in "user_lead_buyer_first_name" with "Mark"
    And I fill in "user_lead_buyer_last_name" with "Driscoll"
    And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
    And I fill in "user_lead_buyer_password" with "secret"
    And I fill in "user_lead_buyer_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
    Then I should see translated "customer.subaccounts.create.flash.subaccount_creation_successful"
    And user "driscoll@person.noserver.com" should have role "category_buyer"

  @_done
  Scenario: Subaccounts should have access only to parents category
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_buyer"
    And I fill in "user_lead_buyer_first_name" with "Mark"
    And I fill in "user_lead_buyer_last_name" with "Driscoll"
    And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
    And I fill in "user_lead_buyer_password" with "secret"
    And I fill in "user_lead_buyer_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
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

  @m6 @_done @_tested
  Scenario: Category buyers should not have to configure their interest page, but have country selected to the country from which the category was design for.
    When Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.my_profile_link"
    Then I should not see translated "my_profile.edit.view.interests_settings"
    When I am on customer interests
    Then I should see "You are not authorized"

  @m6 @selenium @_done @_tested
  Scenario: If category buyer has more than one category assigned, when browsing leads he should see "Category dropdown" which will redirect him to correct category scope when filtering
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
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
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Basic Leads" with attributes "team_buyers:1"
    And user "jon@lajoie.ca" is assigned to category "Worst Leads" as category buyer
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I am on the home page
    And I follow "Basic Leads"
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    Then I should be on category leads page for Basic Leads
    And I am on the home page
    And I follow "Worst Leads"
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    Then I should be on category leads page for Worst Leads

  @m6 @added @_done @_tested
  Scenario: Category buyer can't access categories he's not assigned to
    When Category named "Basic Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Basic Leads" with attributes "team_buyers:1"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I am on category home page for Worst Leads
    Then I should be on category home page for Basic Leads

  @m6 @added @_done @_tested
  Scenario: Subaccounts should have access to all parents category
    When Category named "Best Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads" with attributes "team_buyers:1"
    And user "jon@lajoie.ca" is assigned to category "Worst Leads" as category buyer
    And I am on category home page for Best Leads
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.customer.subaccounts"
    Then I follow translated "customer.subaccounts.index.view.new_lead_buyer"
    And I fill in "user_lead_buyer_first_name" with "Mark"
    And I fill in "user_lead_buyer_last_name" with "Driscoll"
    And I fill in "user_lead_buyer_email" with "driscoll@person.noserver.com"
    And I fill in "user_lead_buyer_screen_name" with "ML Driscoll"
    And I fill in "user_lead_buyer_password" with "secret"
    And I fill in "user_lead_buyer_password_confirmation" with "secret"
    And I press translated "customer.subaccounts.new.view.button_create"
    And I sign out
    And user "driscoll@person.noserver.com" is confirmed
    When I sign in as driscoll@person.noserver.com with password secret
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.browse_leads"
    Then I should be on category home leads page for Best Leads
    When I am on the home page
    And I follow "Worst Leads"
    And I follow translated "category_home.show.view.complete_list_link" within "#latest_leads"
    Then I should be on category leads page for Worst Leads

  @m6 @added @_done @_tested
  Scenario: Subaccounts for Category buyer can't access categories parent is not assigned to
    When Category named "Basic Leads" already exists
    And Category named "Worst Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Basic Leads" with attributes "team_buyers:1"
    And an user with role lead_buyer and email stiw@lajoie.ca exists as subaccount for customer jon@lajoie.ca
    And I am on the home page
    And I sign in as stiw@lajoie.ca with password secret
    And I am on category home page for Worst Leads
    Then I should be on category home page for Basic Leads

  @m6 @added @_done @_tested
  Scenario: I can't login when I have no categories assigned
    When Category named "SampleCat" already exists
    When I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "SampleCat"
    And user "jon@lajoie.ca" has no buying categories
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    Then I should see translated "common.no_categories_for_category_buyer"
