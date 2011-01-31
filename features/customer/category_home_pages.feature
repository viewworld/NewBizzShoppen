@added @m5 @ao
Feature: Category home pages

  @_done
  Scenario: I should see a list of category home pages on main home page
    When Category named "Best Leads" already exists
    And I am on the home page
    Then I should see "Best Leads"

  @_done
  Scenario: I can go to category home page from main home page
    When Category named "Best Leads" already exists
    And I am on the home page
    And I follow "Best Leads"
    Then I should be on category home page for Best Leads

  @_done
  Scenario: I can access category home page with direct link /category_name
    When Category named "Best Leads" already exists
    And I visit URL "/best-leads"
    Then I should be on category home page for Best Leads
    And I should see translated "category_home.show.view.header_welcome"

  @_done
  Scenario: I should be redirected to home page when I try to access non-existant category home page
    When I visit URL "/best-leads"
    Then I should be on the home page

  Scenario: I can create new Sales Manager account from category home page

  Scenario: Account created from category home page has interests fixed to this category

  Scenario: Interests are non-changeable for account registered from category home page

  Scenario: I can't access categories other than the one I registered from

  Scenario: I can't see categories other than the one I registered from

  Scenario: I can see a list of news on category home page

  Scenario: I can see a list of most recent category leads on category home page

  Scenario: I can't see leads from other categories on recent leads

  Scenario: I can see complete list of category leads

  Scenario: I can buy selected leads from this category

  Scenario: I can see registration panel on category home page when I'm a guest

  Scenario: I can see log in panel on category home page when I'm a guest

  Scenario: I can sign in from category home page

  Scenario: I should be redirected back to category home page after successful sign up


