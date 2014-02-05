#10278
@m29 @ao @_requested @notifier
Feature: Notifier

  Background:
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret

  @_done @_tested @selenium
  Scenario: Notifier window should show up when given time comes
    Given there is pending notification for user "admin@nbs.com"
    And I am on the homepage
    And I run javascript check_notifications()
    And I wait 1 second
    Then I should see "Notification title" within "span.gritter-title"
    And I should see "Notification text" within "div.gritter-item p"

  @_done @_tested @selenium
  Scenario: I must click to dismiss the notification
    Given there is pending notification for user "admin@nbs.com"
    And I am on the homepage
    And I run javascript check_notifications()
    And I wait 1 second
    And I move mouse over "div#gritter-item-1"
    And I click element by selector "div#gritter-item-1 div.gritter-close"
    And I wait 1 second
    Then last notification for user "admin@nbs.com" should be dismissed

  @_done @_tested @selenium
  Scenario: Notification will not show up again when I dismiss it
    Given there is pending notification for user "admin@nbs.com"
    And I am on the homepage
    And I run javascript check_notifications()
    And I wait 1 second
    And I move mouse over "div#gritter-item-1"
    And I click element by selector "div#gritter-item-1 div.gritter-close"
    And I wait 1 second
    And I run javascript check_notifications()
    And I wait 1 second
    Then I should not see CSS path "div#gritter-item-1"

  @_done @_tested
  Scenario: I can browse old notifications
    Given there is pending notification for user "admin@nbs.com"
    And I am on notifications page
    Then I should see "Notification title" within "table"
    And I should see "Notification text" within "table"

  @_done @_deprecated
  Scenario: I can click on the side of the screen to reopen the notifier

  @_done @_nontestable
  Scenario: Notifier should check every n seconds for new notifications

  # @selenium @_done @_tested @_deprecated2014
  # Scenario: I should be possible to insert links inside notifications
  #   Given there is pending notification with my profile link for user "admin@nbs.com"
  #   And I am on the homepage
  #   And I run javascript check_notifications()
  #   And I wait 1 second
  #   And I click hidden link by url regex "/my_profile/" within "div#gritter-item-1"
  #   Then I should be on my profile page

  @_done @_nontestable
  Scenario: Clicking link dismisses notification
