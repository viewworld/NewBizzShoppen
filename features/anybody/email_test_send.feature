@m23 @requested @emails
Feature: Email test send

  Background:
    Given I am on the homepage
    And I make sure current locale is "en"
    Then I sign in as blazejek@gmail.com with password secret
    And I go to administration email templates

  @selenium @_done @_tested @tgn
  Scenario: I can click "Test send email" and enter email address
    When I click hidden link by url regex "/administration\/email_templates\/(\d+)\/edit/"
    And I confirm a js prompt with "some.test@email.com" on the next step
    And I press translated "administration.email_templates.edit.view.test_send_email"
    And I wait 5 second
    Then last email sent should have been sent to recipient "some.test@email.com"

  @selenium @_done @_tested_elsewhere @tgn
  Scenario: I should receive a email preview to the given address