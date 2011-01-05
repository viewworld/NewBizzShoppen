@settings @$_admin @m2
Feature: Settings administration

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is English
  Given I am signed up and confirmed as user with email lead_user2@person.com and password supersecret and role admin
  Then I sign in as lead_user2@person.com with password supersecret
  Then I go to administration settings

@tgn @_done @_tested
Scenario: I can see edit settings screen
  Given I should see translated "administration.settings.edit.view.title"
  And I should see "Default leads per page"
  And I should see "Default payout delay"

@tgn @_done @_tested
Scenario: I can edit each setting value
  Then I fill in "setting_0" with "123"
  And I fill in "setting_1" with "234"

@tgn @_done @_tested
Scenario: I can click save to save changes made
  Then I fill in "setting_0" with "123"
  And I fill in "setting_1" with "234"
  And I press translated "administration.settings.edit.view.button_update_settings"
  Then I should see translated "administration.settings.update.controller.successful_update_notice"

@tgn @_non_testable
Scenario: Confirmation prompt is being displayed when I try to save changes made
  Then I press translated "administration.settings.edit.view.button_update_settings"

@tgn @_done @_tested @selenium
Scenario: I can click cancel and go back (browser history)
  Then I press translated "administration.settings.edit.view.button_cancel"
  And I should be on administration root

@m4 @tgn @added @agent_certification
Scenario: When I change the certification levels in settings then agents' levels should be refreshed too (unless their certifications are locked)