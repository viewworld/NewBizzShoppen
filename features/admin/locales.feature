@m18 @languages
Feature: Locales

  Background:
    Given I am on the homepage
    And I sign in as admin@nbs.com with password secret

  @_done @_tested
  Scenario: I can view list of (predefined) languages
    When I follow translated "layout.main_menu.admin.languages"
    Then I should see CSS path "table#locales_table"
    And I should see "English" within "table#locales_table"

  # @_done @_tested @_deprecated2014
  # Scenario: I can enable language
  #   When I follow translated "layout.main_menu.admin.languages"
  #   Then I should not see "PL" within "#langs_list"
  #   When I follow translated "administration.languages.index.view.enable" within "#locale_14"
  #   Then I should see "PL" within "#langs_list"

  # @_done @_tested @_deprecated2014
  # Scenario: I can disable language
  #   When I follow translated "layout.main_menu.admin.languages"
  #   Then I should see "DK" within "#langs_list"
  #   When I follow translated "administration.languages.index.view.disable" within "#locale_15"
  #   Then I should not see "DK" within "#langs_list"
