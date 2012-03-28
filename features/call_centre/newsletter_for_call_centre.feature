@newsletter @_requested @$_call_centre @m31
Feature: Newsletter for call centre

  Background:
    Given I am on the homepage
    And I visit domain http://faircalls.eu
    And I sign in as translator_call_centre@nbs.com with password secret
    And I click hidden link by url regex "/\/newsletters\/newsletter_lists/"

  @_done @_tested_elsewhere
  Scenario: I should see two positions under Campaigns menu tab: TM-Campaigns, Lists

  @_done @_tested @selenium
  Scenario: I can create new list
    And I follow translated "newsletters.newsletter_lists.index.view.new_newsletter_list"
    And I fill in "newsletter_list_name" with "Test newsletter"
    And I fill in "newsletter_list_owner_email" with "blazejek@gmail.com"
    And I press translated "newsletters.newsletter_lists.new.view.button_create"
    And I should see "Test newsletter"

  Scenario: I can add selected contacts from my campaigns to the selected list that are created by me (if the whole campaign is not already a source)