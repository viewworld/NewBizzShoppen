Feature: Bank Accounts

  Background:
    Given I am on the homepage
    And I make sure current locale is English
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    And someone is signed up and confirmed as user with email kastomer@nbs.fake and password secret and role customer with attributes "first_name:Janko,last_name:Muzykant"
    Then I sign in as jon@lajoie.ca with password secret

  @added @m4b @_done
  Scenario: I can see a list of bank accounts in settings tab
    Given I follow translated "layout.main_menu.admin.settings"
    Then I should see "2" rows in a table within "#bank_accounts"

  @added @m4b @_done
  Scenario: I can add many bank accounts to one country
    Given there is a bank account for country "Denmark"
    And there is a bank account for country "Denmark"
    And I follow translated "layout.main_menu.admin.settings"
    Then I should see "4" rows in a table within "#bank_accounts"

  @added @m4b @_done
  Scenario: Only one bank account for each country can be a default bank account
    Given there is a bank account for country "Denmark"
    And I follow translated "layout.main_menu.admin.settings"
    And I follow translated "administration.bank_accounts.index.view.id"
    Then checkbox with name like "country_default" should be checked in the "1" row of table "#bank_accounts"
    When there is a bank account for country "Denmark" with attributes "country_default:1"
    And I follow translated "layout.main_menu.admin.settings"
    And I follow translated "administration.bank_accounts.index.view.id"
    Then checkbox with name like "country_default" should be checked in the "3" row of table "#bank_accounts"
    And checkbox with name like "country_default" should not be checked in the "1" row of table "#bank_accounts"
    And checkbox with name like "country_default" should not be checked in the "2" row of table "#bank_accounts"

  @added @m4b @_done
  Scenario: Different countries should have different country default bank accounts
    Given there is a bank account for country "United Kingdom" with attributes "country_default:1"
    And I follow translated "layout.main_menu.admin.settings"
    And I follow translated "administration.bank_accounts.index.view.id"
    Then checkbox with name like "country_default" should be checked in the "1" row of table "#bank_accounts"
    And checkbox with name like "country_default" should be checked in the "2" row of table "#bank_accounts"

  @added @m4b @wip
  Scenario: Only one bank account can be a global default
    Given there is a bank account for country "Denmark" with attributes "global_default:1"
    And there is a bank account for country "United Kingdom" with attributes "global_default:1"
    And I follow translated "layout.main_menu.admin.settings"
    And I follow translated "administration.bank_accounts.index.view.id"
  And I open page in browser
    Then checkbox with name like "global_default" should be checked in the "3" row of table "#bank_accounts"
    And checkbox with name like "global_default" should not be checked in the "2" row of table "#bank_accounts"
    And checkbox with name like "global_default" should not be checked in the "1" row of table "#bank_accounts"

