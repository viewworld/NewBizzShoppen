@m5 @ao
Feature: Home pages

  @_done
  Scenario: On the role homepage we could change the name for the "Home" tab to front page and give the users a simpler way to get to the front page
    Given I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role customer
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should be on buyer home page
    When I follow translated "layout.main_menu.shared.site_home"
    Then I should be on the home page

  @added @_done
  Scenario: On the category homepage we could change the name for the "Home" tab to front page and give the users a simpler way to get to the front page
    Given Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.site_home"
    Then I should be on the home page

  @_done
  Scenario: On category home page it should be possible to login
    Given Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    Then I should see CSS path "#user_email"
    And I should see CSS path "#user_password"
    And I should see CSS path "#user_submit"

  @_done
  Scenario: On category home page it should be possible to recover password
    Given Category named "Best Leads" already exists
    And I am on category home page for Best Leads
    Then I should see translated "category_home.show.view.forgotten_password_link"

  @_done
  Scenario: On category home page it should be possible to logout
    Given Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I am on category home page for Best Leads
    Then I should see translated "category_home.show.view.sign_out"

  @_done
  Scenario: On role home page it should be possible to login
    Given I am on agent home page
    Then I should see CSS path "#user_email"
    And I should see CSS path "#user_password"
    And I should see CSS path "#user_submit"
    When I am on buyer home page
    Then I should see CSS path "#user_email"
    And I should see CSS path "#user_password"
    And I should see CSS path "#user_submit"
    When I am on purchase manager home page
    Then I should see CSS path "#user_email"
    And I should see CSS path "#user_password"
    And I should see CSS path "#user_submit"

  @_done
  Scenario: On role home page it should be possible to recover password
    Given I am on agent home page
    Then I should see translated "category_home.show.view.forgotten_password_link"
    When I am on buyer home page
    Then I should see translated "category_home.show.view.forgotten_password_link"
    When I am on purchase manager home page
    Then I should see translated "category_home.show.view.forgotten_password_link"

  @_done
  Scenario: On role home page it should be possible to logout
    Given I am signed up and confirmed as user with email agent_tomek@nbs.com and password secret and role agent
    And I am on the home page
    And I sign in as agent_tomek@nbs.com with password secret
    And I am on agent home page
    Then I should see translated "category_home.show.view.sign_out"
    When I sign out
    Given I am signed up and confirmed as user with email mysterious_customer@nbs.com and password secret and role customer
    And I am on the home page
    And I sign in as mysterious_customer@nbs.com with password secret
    And I am on buyer home page
    Then I should see translated "category_home.show.view.sign_out"
    When I sign out
    Given I am signed up and confirmed as user with email pm@nbs.com and password secret and role purchase_manager
    And I am on the home page
    And I sign in as pm@nbs.com with password secret
    And I am on purchase manager home page
    Then I should see translated "category_home.show.view.sign_out"

  @category_home_pages @_done
  Scenario: I should see a list of category home pages on main home page
    When Category named "Best Leads" already exists
    And I am on the home page
    Then I should see "Best Leads"

  @category_home_pages @_done
  Scenario: I can go to category home page from main home page
    When Category named "Best Leads" already exists
    And I am on the home page
    And I follow "Best Leads"
    Then I should be on category home page for Best Leads

  @category_home_pages @_done
  Scenario: I can access category home page with direct link /category_name
    When Category named "Best Leads" already exists
    And I visit URL "/best-leads"
    Then I should be on category home page for Best Leads
    And I should see translated "category_home.show.view.header_welcome"

  @category_home_pages @_done
  Scenario: I should be redirected to home page when I try to access non-existant category home page
    When I visit URL "/best-leads"
    Then I should be on the home page

