@is @notifications @m0
Feature: Notifications

  @requested
  Scenario: I will receive an email with new leads from my interests

  @requested
  Scenario: I can subscribe by email to category

  @_done @_tested
  Scenario: I can subscribe by rss to category
    Given I am on the homepage
    Then I sign in as agent@nbs.com with password secret
    Then I follow translated "layout.main_menu.shared.browse_leads"
    Then I follow "Business"
    Then I should see "leads.index.subscribe_to_rss"