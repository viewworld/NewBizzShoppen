@email_templates @m3
Feature: Rendering dynamic fields in email templates

Background:
  Given I am on the homepage
  And I make sure current locale is "en"

@tgn @_done @_tested
Scenario: Email template should properly render dynamic fields
  Given setting for "email_verification_for_sales_managers" is set to "1"
  Given I have user with email new_buyer@person.com and role customer
  Then last email sent should have content "new_buyer@person.com"