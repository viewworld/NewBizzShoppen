@newsletter @_requested @$_admin @m31
Feature: Newsletter campaign for admin

  Background:
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/\/newsletters\/newsletter_campaigns/"

  @_done @_tested @selenium
  Scenario: I can create new newsletter campaign
    Given newsletter list named "My contacts 2000" is owned by "blazejek@gmail.com"
    And newsletter list named "Business contacts" is owned by "blazejek@gmail.com"
    And I follow translated "newsletters.newsletter_campaigns.index.view.new_newsletter_campaign"
    And I fill in "newsletter_campaign_owner_email" with "blazejek@gmail.com"
    And I follow translated "newsletters.newsletter_campaigns.form.fetch_lists"
    And I fill in "newsletter_campaign_cm_username" with "fairletters"
    And I fill in "newsletter_campaign_cm_password" with "secret"
    And I select "My contacts 2000" from "all_lists"
    And I follow translated "newsletters.newsletter_campaigns.form.move_right"
    And I should see translated "newsletters.newsletter_campaigns.form.new_list"
    And I fill in "newsletter_campaign_subject" with "Awesome campaign subject"
    And I fill in "newsletter_campaign_body_editor" ckeditor with "My new awesome template for campaign!"
    And I press translated "newsletters.newsletter_campaigns.edit.view.button_update"
    Then display all hidden actions
    And I wait 1 second
    And I follow translated "newsletters.newsletter_campaigns.index.view.archive"
    Then I should see translated "newsletters.newsletter_campaigns.archive.flash.notice_archived"
    And I select "Yes" from "search_with_archived"
    And I press translated "newsletters.newsletter_campaigns.index.view.search.search_button"
    Then display all hidden actions
    And I wait 1 second
    And I follow translated "newsletters.newsletter_campaigns.index.view.retrieve"
    Then I should see translated "newsletters.newsletter_campaigns.archive.flash.notice_retrieved"
    Given I sign out
    And I view newsletter template preview for last campaign
    Then I should see "My new awesome template for campaign!"

  @_done @_tested_elsewhere
  Scenario: I enter the owner email and validate it

  @_done @_tested_elsewhere
  Scenario: I can select multiple lists from the selected owner

  @_done @_tested_elsewhere
  Scenario: I can click Open list manager to go to create new list

  @_done @_tested_elsewhere
  Scenario: I can enter username and password

  @_done @_non_testable
  Scenario: I should be able to test access to CM using entered credentials

  @_done @_tested_elsewhere
  Scenario: I can set the current content in rich text editor

  @_done @_non_testable
  Scenario: I can click Add Deals links

  @_done @_non_testable
  Scenario: I can search the deals by text

  @_done @_non_testable
  Scenario: I can see selected deals

  @_done @_non_testable
  Scenario: I can see all deals

  @_done @_tested_elsewhere
  Scenario: I can save as a draft

  @_done @_tested_elsewhere @_rspec
  Scenario: I can send it to Campaign Monitor

  @_done @_tested_elsewhere
  Scenario: When content is sent to Campaign Monitor then new template is added "FDNL current_date"

  @_done @_non_testable
  Scenario: When content is sent to Campaign Monitor then new draft campaign is created

  @_done @_non_testable
  Scenario: When content is sent to Campaign Monitor then new draft campaign is sent

  @_done @_tested_elsewhere
  Scenario: The template for the newsletter campaign should be publicly available under random hash name

  @_done @_tested_elsewhere
  Scenario: I should see all newsletter campaigns on a listing with headers: Name, List names, Owner, Status (Draft/Sent)

  @_done @_tested_elsewhere
  Scenario: I should be able to sign in to Campaign Monitor/Edit/Archive created newletter campaign

  @_done @_tested_elsewhere
  Scenario: I should be able to see Archived button beside the New campaign to show only archived

  @_done @_tested_elsewhere @_rspec
  Scenario: When campaign is created in Campaign Monitor then CampaignID is stored locally