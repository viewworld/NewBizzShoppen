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

  @_done
  Scenario: On the category homepage we could change the name for the "Home" tab to front page and give the users a simpler way to get to the front page
    Given Category named "Best Leads" already exists
    And I am signed up and confirmed as user with email "jon@lajoie.ca" and password "secret" and role "category_buyer" for category "Best Leads"
    And I am on the home page
    And I sign in as jon@lajoie.ca with password secret
    And I follow translated "layout.main_menu.shared.home"
    Then I should be on category home page for Best Leads
    When I follow translated "layout.main_menu.shared.site_home"
    Then I should be on the home page

  Scenario: It should be possible to login and recover password (and logout if already logged in)

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

