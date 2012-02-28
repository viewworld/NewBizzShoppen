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

@m4 @tgn @added @agent_certification @_tested @_done
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

@requested @m8 @tgn @_tested @_done
Scenario: Admin should be able to define purchase limit for given big buyer (default in settings). All purchases should be recalculated to Euro and the limit should be set in Euro.
  Then I fill in "setting_0" with "123"
  And I press translated "administration.settings.edit.view.button_update_settings"
  Then I should see translated "administration.settings.update.controller.successful_update_notice"

# 5722
@m11 @requested @youtube @ao @_done @_tested @_deprecated
Scenario: I can specify a youtube video url which is displayed on front page

#5919
#http://img.youtube.com/vi/<insert-youtube-video-id-here>/0.jpg
#home page is not used anymore
@requested @$_all @m12 @ao @_done @_tested @_deprecated
Scenario: I can see a jpg thumbnail of a introduction video on home page
#  When I follow translated "administration.introduction_video.view.add_video"
#  And I fill in "youtube_introduction_url" with "http://www.youtube.com/watch?v=SBjQ9tuuTJQ"
#  And I select "en" from "youtube_introduction_locale_code"
#  And I press translated "administration.introduction_video.new.view.button_create"
#  And I make sure current locale is "en"
#  And I am on the home page
#  Then I should see "1" elements within CSS path ".introduction_video"

#home page is not used anymore
@requested @m13 @after_m12_presentation @ao @$_administrator @_done @_tested @_deprecated
Scenario: I can upload custom jpeg image to be displayed on home page for video introduction
#  When I follow translated "administration.introduction_video.view.add_video"
#  And I fill in "youtube_introduction_url" with "http://www.youtube.com/watch?v=SBjQ9tuuTJQ"
#  And I select "en" from "youtube_introduction_locale_code"
#  And attach the file "sample image" to "youtube_introduction_image_attributes_asset"
#  And I press translated "administration.introduction_video.new.view.button_create"
#  And I make sure current locale is "en"
#  And I am on the home page
#  Then I should see CSS path "img[src*='_original']"

#5919
@requested @$_all @m12 @ao @_done @_tested @selenium @_deprecated
Scenario: I can play youtube video in a modal box
#  When I follow translated "administration.introduction_video.view.add_video"
#  And I fill in "youtube_introduction_url" with "http://www.youtube.com/watch?v=SBjQ9tuuTJQ"
#  And I select "en" from "youtube_introduction_locale_code"
#  And I press translated "administration.introduction_video.new.view.button_create"
#  And I make sure current locale is "en"
#  And I am on the home page
#  And I follow "introduction_video_link"
#  And I wait 1 second
#  Then I should see CSS path "#cboxLoadedContent"

#5919
#home page is not used anymore
@requested @$_admin @m12 @ao @_done @_tested @_deprecated
Scenario: I can specify youtube url for each locale
#  When I follow translated "administration.introduction_video.view.add_video"
#  And I fill in "youtube_introduction_url" with "http://www.youtube.com/watch?v=SBjQ9tuuTJQ"
#  And I select "en" from "youtube_introduction_locale_code"
#  And I press translated "administration.introduction_video.new.view.button_create"
#  And I make sure current locale is "en"
#  And I am on the home page
#  Then I should see "1" elements within CSS path ".introduction_video"
#  When I make sure current locale is "da"
#  Then I should not see CSS path ".introduction_video"
#  When I go to administration settings
#  When I follow translated "administration.introduction_video.view.add_video"
#  And I fill in "youtube_introduction_url" with "http://www.youtube.com/watch?v=SBjQ9tuuTJQ"
#  And I select "da" from "youtube_introduction_locale_code"
#  And I press translated "administration.introduction_video.new.view.button_create"
#  And I am on the home page
#  Then I should see "1" elements within CSS path ".introduction_video"

@m18 @auto_buy_max @_done @_tested @tgn
Scenario: I can set default auto buy max for 4 weeks
  And I fill in "setting_5" with "11"

@m18 @settings @_done @_tested
Scenario: I can enable/disable email verification for procurement managers
  And setting for "email_verification_for_members" is set to "0"
  And I sign out
  And I visit domain http://fairdeals.eu
  When I go to member sign up
  And I fill in the following:
    | user_member_first_name            | Jon             |
    | user_member_last_name             | Lajoie          |
    | user_member_company_name          | Lajoie Inc      |
    | user_member_phone                 | 48928217272     |
    | user_member_email                 | jon@lajoie.ca   |
    | user_member_password              | secret          |
    | user_member_password_confirmation | secret          |
    | user_member_address_attributes_address_line_1        | Sunset Blv 32   |
    | user_member_address_attributes_address_line_2        | Montreal        |
    | user_member_address_attributes_zip_code              | 43-270          |
    | user_member_address_attributes_address_line_3        | Quebec          |
  And I select "Denmark" from "user_member_address_attributes_country_id"
  And I check "user_member_agreement_read"
  And I choose "user_member_subscription_plan_id"
  And I press translated "member_accounts.new.view.button_create_account"
  Then I should be signed in
  And I sign out
  And setting for "email_verification_for_members" is set to "1"
  When I go to member sign up
  And I fill in the following:
    | user_member_first_name            | Jon             |
    | user_member_last_name             | Lajoie          |
    | user_member_company_name          | Lajoie Inc      |
    | user_member_phone                 | 48928217272     |
    | user_member_email                 | jon2@lajoie.ca   |
    | user_member_password              | secret          |
    | user_member_password_confirmation | secret          |
    | user_member_address_attributes_address_line_1        | Sunset Blv 32   |
    | user_member_address_attributes_address_line_2        | Montreal        |
    | user_member_address_attributes_zip_code              | 43-270          |
    | user_member_address_attributes_address_line_3        | Quebec          |
  And I select "Denmark" from "user_member_address_attributes_country_id"
  And I check "user_member_agreement_read"
  And I choose "user_member_subscription_plan_id"
  And I press translated "member_accounts.new.view.button_create_account"
  Then I should see translated "flash.member_accounts.create.notice"

@m18 @settings @_done @_tested
Scenario: I can enable/disable email verification for sales managers
  And setting for "email_verification_for_suppliers" is set to "0"
  And I sign out
  When I go to supplier sign up
  And I fill in the following:
      | user_category_supplier_first_name            | Bob             |
      | user_category_supplier_last_name             | Taker           |
      | user_category_supplier_company_name          | LeadsInt Ltd    |
      | user_category_supplier_phone                 | 48928217272     |
      | user_category_supplier_email                 | user@domain.dom |
      | user_category_supplier_password              | secret          |
      | user_category_supplier_password_confirmation | secret          |
      | user_category_supplier_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_category_supplier_address_attributes_address_line_2        | London          |
      | user_category_supplier_address_attributes_zip_code              | 43-270          |
      | user_category_supplier_address_attributes_address_line_3        | Wesley             |
  And I select "Denmark" from "user_category_supplier_address_attributes_country_id"
  And I check "user_category_supplier_agreement_read"
  And I choose "user_category_supplier_subscription_plan_id"
  And I press translated "supplier_accounts.new.view.button_create_account"
  Then I should see translated "devise.sessions.new.controller.successfully_logged_in"
  And I should be signed in
  And I should be on the home page
  And setting for "email_verification_for_suppliers" is set to "1"
  And I sign out
  When I go to supplier sign up
  And I fill in the following:
      | user_category_supplier_first_name            | Bob             |
      | user_category_supplier_last_name             | Taker           |
      | user_category_supplier_company_name          | LeadsInt Ltd    |
      | user_category_supplier_phone                 | 48928217272     |
      | user_category_supplier_email                 | user2@domain.dom |
      | user_category_supplier_password              | secret          |
      | user_category_supplier_password_confirmation | secret          |
      | user_category_supplier_address_attributes_address_line_1        | Sunset Blv 32   |
      | user_category_supplier_address_attributes_address_line_2        | London          |
      | user_category_supplier_address_attributes_zip_code              | 43-270          |
      | user_category_supplier_address_attributes_address_line_3        | Wesley             |
  And I select "Denmark" from "user_category_supplier_address_attributes_country_id"
  And I check "user_category_supplier_agreement_read"
  And I choose "user_category_supplier_subscription_plan_id"
  And I press translated "supplier_accounts.new.view.button_create_account"
  Then I should see translated "flash.supplier_accounts.create.notice"

#7450
@m19 @requested @settings @_done @_tested @tgn
Scenario: I can set contact info for home page like Phone number, Email, Skype
  Given I should see translated "administration.settings.edit.view.contacts_settings_title"
  Then I fill in "settings[6]" with "my_email@fairleads.com"
  And I fill in "settings[7]" with "+44 8888888"
  And I fill in "settings[8]" with "skype_fairleads"
  And I press translated "administration.settings.edit.view.button_update_settings"

#7837
@m20 @requested @is @_done @_tested
Scenario: Contact settings should be renamed to fairdeals contact settings
  Then I should see "Fairdeals contact settings"

#9976
@m28 @requested @tgn @_done @_tested
Scenario: I should be able to set the number of secondary featured deals show on fairdeals home page
  And I fill in "settings[18]" with "4"
  And I press translated "administration.settings.edit.view.button_update_settings"