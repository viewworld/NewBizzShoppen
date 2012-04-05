@newsletter @_requested @$_admin @m31 @selenium
Feature: Newsletter for admin

  Background:
    Given I am on the homepage
    And I sign in as blazejek@gmail.com with password secret
    And I click hidden link by url regex "/\/newsletters\/newsletter_lists/"

  @_done @_tested_elsewhere
  Scenario: I should see three positions under Campaigns menu tab: TM-Campaigns, Lists, Newsletter

  @_done @_tested
  Scenario: I can create new list with a unique name
    And I follow translated "newsletters.newsletter_lists.index.view.new_newsletter_list"
    And I fill in "newsletter_list_name" with "Test newsletter"
    And I fill in "newsletter_list_owner_email" with "blazejek@gmail.com"
    And I press translated "newsletters.newsletter_lists.new.view.button_create"
    And I should see "Test newsletter"
    And display all hidden actions
    And I follow translated "newsletters.newsletter_lists.index.view.edit"
    And I fill in "newsletter_list_owner_email" with "translator_call_centre@nbs.com"
    And I press translated "newsletters.newsletter_lists.edit.view.button_update"
    Given I add user role source for role "member" to newsletter list "Test newsletter"
    And display all hidden actions
    And I wait 1 second
    And I follow translated "newsletters.newsletter_lists.index.view.edit"
    And I should see "member (Role)"
    And I should see "translator_purchase_manager@nbs.com"
    And display all hidden actions
    And I follow translated "newsletters.newsletter_lists.edit.view.subscribers.edit"
    And I should be on administration edit user for translator_purchase_manager@nbs.com
    And I click hidden link by url regex "/\/newsletters\/newsletter_lists/"
    And display all hidden actions
    And I wait 1 second
    And I follow translated "newsletters.newsletter_lists.index.view.archive"
    Then I should see translated "newsletters.newsletter_lists.archive.flash.notice_archived"
    And I select "Yes" from "search_with_archived"
    And I press translated "newsletters.newsletter_lists.index.view.search.search_button"
    And display all hidden actions
    And I wait 1 second
    And I follow translated "newsletters.newsletter_lists.index.view.retrieve"
    Then I should see translated "newsletters.newsletter_lists.archive.flash.notice_retrieved"


  @_done @_tested_elsewhere
  Scenario: I can set owner for a list (e-mail address of admin, call centre, supplier/category supplier)

  @_done @_tested_elsewhere
  Scenario: I can choose multiple sources for a list

  @_done @_tested_elsewhere
  Scenario: I can choose specific category or subcategory as a source

  @_done @_tested_elsewhere @_rspec
  Scenario: I can choose Suppliers (all or given subscription type) as a source

  @_done @_tested_elsewhere @_rspec
  Scenario: I can choose Members (all or given subscription type) as a source

  @tags @_done @_tested_elsewhere  @_rspec
  Scenario: I can choose any contact, member, supplier, lead that was tagged by combination of any given tags

  @_done @_tested_elsewhere @_rspec
  Scenario: I can choose all contacts from given TM-Campaign as a source

  @_done @_tested_elsewhere
  Scenario: It should be possible to change owner of a list

  @_done @_tested_elsewhere
  Scenario: It should be possible to change source of a list

  @_done @_tested_elsewhere
  Scenario: I should be able to see list of all created lists with headers: Owner, Name, Number of subscribers, Last sync (date)

  @_done @_tested_elsewhere
  Scenario: I should be able to Edit, Archive, Unsubscribe any list from created lists

  @_done @_tested_elsewhere
  Scenario: When I edit created list I should be able to view all the subscribers and go to edit the selected object connected to it (member, supplier, lead, contact)

  @_done @_tested_elsewhere
  Scenario: I should be able to view archived lists