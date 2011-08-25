@m18 @postmark_bounce_hook
Feature: Postmark bounce hook

  Background: I'm singed in as admin
    Given I am on the homepage
    And I make sure current locale is "en"
    And I am signed up and confirmed as user with email szef@nbs.com and password secret and role admin
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role agent
    And there is bounced email for "jon@lajoie.ca"
    Then I sign in as szef@nbs.com with password secret

  # instead of putting the bounce email list under the "setting/emails" rename the tab, "Comments" to "Alerts" and create a submenu with "Comments" and "Bounce"
  @_done @_tested
  Scenario: I can view list of bounced emails in Alerts / Bounce
    When I follow translated "layout.main_menu.shared.bounce"
    Then I should see CSS path "table#email_bounces_table"
    And I should see "jon@lajoie.ca" within "table#email_bounces_table"

  @_done @_tested
  Scenario: I can see a red bounce flag on users list if theres any email for that user that bounced
    When I follow translated "layout.main_menu.shared.bounce"
    And I follow translated "layout.main_menu.admin.users"
    Then I fill in "search_with_keyword" with "jon"
    And I press translated "administration.users.index.view.search_button"
    Then I should see CSS path "img[alt='Red_flag']"

  @_done @_tested
  Scenario: I can see the bounced emails when I click the red flag on users list
    When I follow translated "layout.main_menu.shared.bounce"
    And I follow translated "layout.main_menu.admin.users"
    Then I fill in "search_with_keyword" with "jon"
    And I press translated "administration.users.index.view.search_button"
    And I follow "Red_flag"
    Then I should see CSS path "table#email_bounces_table"
    And I should see "jon@lajoie.ca" within "table#email_bounces_table"
