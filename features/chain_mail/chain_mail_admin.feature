#10199
@m30 @ao @chain_mail @_requested
Feature: Chain mail administration

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    And I am signed up and confirmed as user with email jon@lajoie.ca and password secret and role admin
    Then I sign in as jon@lajoie.ca with password secret

  @_done @_tested
  Scenario: I should be able to access Chain mail as admin under Content/Chain mail
    When I follow translated "layout.main_menu.admin.chain_mail"
    Then I should see translated "chain_mail_types.index.header"

  @_done @_tested
  Scenario: It should be possible to list/edit/archive/active/Inactive all chain mail types
    Given there are "2" chain mail types
    When I follow translated "layout.main_menu.admin.chain_mail"
    Then I should see "2" rows in a table within "table.chain_mail_types tbody"

  @_done @_tested @selenium
  Scenario: I can create new Chain mail
    When campaign named "Testing One" exists with attributes "crm_campaigns:2,crm_option:0"
    And I click hidden link by url regex "/\/callers\/campaigns$/"
    And I fill in "search_with_keyword" with "Testing one"
    Then I press translated "campaigns.filter.search_button"
    And display all hidden actions
    And I follow translated "campaigns.index.edit"
    And I follow translated "campaigns.edit.chain_mail_types"
    Then I should not see CSS path "table.chain_mail_types tbody"
    When I follow translated "chain_mail_types.index.new"
    And I fill in "chain_mail_type_name" with "First chain mail type"
    And I check "chain_mail_type_active"
    And I select "0" from "chain_mail_type_first_execution_delay"
    And I select "1" from "chain_mail_type_cycle_time"
    And I select "10" from "chain_mail_type_execution_time_4i"
    And I select "00" from "chain_mail_type_execution_time_5i"
    And I follow translated "chain_mail_types.form.add_another_email"
    And I fill in "chain_mail_type_chain_mail_items_attributes_0_subject" with "subject 1"
    And I fill in "chain_mail_type_chain_mail_items_attributes_0_body" ckeditor with "body 1"
    And I press translated "views.button_update"
    When I click hidden link by url regex "/callers\/chain_mail_types$/"
    Then I should see "1" rows in a table within "table.chain_mail_types tbody"

  @_done @_tested_elsewhere
  Scenario: I can enter Chain mail name

  # (when result is created, a specific date, number of days since result is created)
  @_done @_tested_elsewhere
  Scenario: I can enter First execution delay

  # (In days between the mails)
  @_done @_tested_elsewhere
  Scenario: I can enter Cycle time

  # (What time on the day should each mail be send)
  @_done @_tested_elsewhere
  Scenario: I can enter Execution time

  @_done @_tested_elsewhere
  Scenario: I can select Condition for next mail: (un der what condition should the next mail be send)

  @_done @_tested_elsewhere
  Scenario: I can select -- condition email id has not logged in since last mail AND/OR

  @_done @_tested_elsewhere
  Scenario: I can select -- No link in privies mail has been clicked

  @_done @_tested_elsewhere
  Scenario: I can add new email to the chain

  @_done @_tested_elsewhere
  Scenario: I can edit each email in the chain

  @_done @_tested_elsewhere
  Scenario: I can upload attachments to chain mail repository

  @_done @_tested_elsewhere
  Scenario: I can attach multiple attachments to each email
