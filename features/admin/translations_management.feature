@$_admin @translations @added @m8
Feature: Translations management

Background: I am signed in as admin
  Given I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
  Then I sign in as jon@lajoie.ca with password secret

@_done @_tested
Scenario: I can see list of all translatable strings in the system
  When I follow translated "layout.main_menu.admin.translations"
  Then I should see "layout.main_menu.admin.settings"
  When I fill in "search_with_keyword" with "activerecord.attributes.category.name"
  And I press translated "administration.translations.show.view.search.search_button"
  Then I should see "activerecord.attributes.category.name"
  And I should not see "layout.main_menu.admin.settings"

@non_testable @_done
Scenario: I can change each translation

@m18 @languages @_done @_tested
Scenario: I can translate all languages
  When I follow translated "layout.main_menu.admin.translations"
  Then I should see "English" within "#temp_lang_1"
  And I should see "English" within "#temp_lang_2"
  And I should see "Polish" within "#temp_lang_1"
  And I should see "Polish" within "#temp_lang_2"

@m18 @languages @selenium @_done @_tested
Scenario: I can select which 2 languages to display when translating
  When I click hidden link by url regex "/administration\/translation/"
  And I select "Polish" from "temp_lang_1"
  Then "temp_lang_1" should be selected for value "English"
  Then "temp_lang_2" should be selected for value "Polish"
  And I select "German" from "temp_lang_1"
  Then "temp_lang_1" should be selected for value "German"
  And "temp_lang_2" should be selected for value "Polish"

#7850
@m20 @is @non_testable @_done
Scenario: When empty translation is added it should not be saved
