@settings @$_admin @m2
Feature: Settings administration

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
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
  And I should be on the homepage

@m4 @tgn @added @agent_certification @_tested
Scenario: When I change the certification levels in settings then agents' levels should be refreshed too (unless their certifications are locked)
  Given I have user with email agent01@person.com and role agent
  And I have user with email agent02@person.com and role agent
  And I have user with email call_centre@person.com and role call_centre
  And user call_centre@person.com with role call_centre exists with attributes "certification_level:2"
  And user agent01@person.com with role agent exists with attributes "certification_level:2"
  And user agent02@person.com with role agent exists with attributes "certification_level:11"
  Then I go to administration settings
  And I fill in "setting_2" with "20"
  And I fill in "setting_3" with "40"
  And I press translated "administration.settings.edit.view.button_update_settings"
  And I should see translated "administration.settings.update.controller.successful_update_notice"
  Then user "call_centre@person.com" with role "call_centre" has certification level 1
  Then user "agent01@person.com" with role "agent" has certification level 1
  And user "agent02@person.com" with role "agent" has certification level 11

@requested @m8 @tgn @_tested
Scenario: Admin should be able to define purchase limit for given big buyer (default in settings). All purchases should be recalculated to Euro and the limit should be set in Euro.
  Then I fill in "setting_0" with "123"
  And I press translated "administration.settings.edit.view.button_update_settings"
  Then I should see translated "administration.settings.update.controller.successful_update_notice"

# 5722
@m11 @requested @youtube @ao @_done @_tested
Scenario: I can specify a youtube video url which is displayed on front page
  Then I fill in "setting_4" with "123"
  And I press translated "administration.settings.edit.view.button_update_settings"
  Then I should see translated "administration.settings.update.controller.successful_update_notice"

#5919
#youtube url put thumbnail and onclick play in modal window
#http://img.youtube.com/vi/<insert-youtube-video-id-here>/0.jpg
@requested @m12
Scenario: I can play youtube video in a modal box

#5919
@requested @m12
Scenario: I can specify youtube url for each locale
