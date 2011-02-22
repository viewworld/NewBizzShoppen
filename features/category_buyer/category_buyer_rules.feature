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

