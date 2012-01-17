#To estimate
@$_admin @m4 @tgn @noguess
Feature: Category locking

Background: Sign in user and set English locale
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email bob@person.com and password supersecret and role admin
  Then I sign in as bob@person.com with password supersecret

@_tested @_done @tc_file_mgmt
Scenario: I should be able to lock category
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  Then I check "category_is_locked"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I press translated "administration.categories.edit.view.button_update"
  Then I should see translated "flash.categories.update.notice"

@_tested @_done @tc_file_mgmt
Scenario: I should be able to unlock category
  Given category named "Electronics" is locked
  Then I go to administration categories
  And I follow translated "administration.categories.index.view.edit_link"
  Then I uncheck "category_is_locked"
  And attach the file "sample image" to "category_image_attributes_asset"
  And I press translated "administration.categories.edit.view.button_update"
  Then I should see translated "flash.categories.update.notice"

@_tested @_done
Scenario: When I lock a parent category then all its children are locked as well
  Given Category named "Sample category" already exists
  Given Category named "Another sample category" already exists within category named "Sample category"
  Given Category named "Also another sample category" already exists within category named "Another sample category"
  When category named "Sample category" is locked
  Then category named "Another sample category" should be locked
  Then category named "Also another sample category" should be locked

@_tested @_done
Scenario: No new leads could be added to locked category
  Given I am not sign in
  Given Category named "Sample category" already exists
  And category named "Sample category" is locked
  Given I am signed up and confirmed as user with email agent.jones@person.com and password secret and role agent
  Then I sign in as agent.jones@person.com with password secret
  Then "category_id" dropdown should not have values "Sample category"

@_tested @_done
Scenario: Locked category should not be visible if no active leads are present within it
  Given category named "Electronics" is locked
  Given category named "Business" is locked
  Given I am not sign in
  Given I go to browse leads
  And I should not see "Electronics"
  And I should see "Business"
  And I should see "Leisure"

