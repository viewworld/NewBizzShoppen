@categories_browsing
Feature: I can browse categories

  Background:
  And I am on the homepage
  And I make sure current locale is "en"

  # Suggest category name: (text box), Describe what would be a good lead: (text box), How many leads would you need a month? (number)
  # Can fairleads contact you to discuss you suggestion?, Phone: (Number), Email: (email)
  # deprecated - agents dont have browse deals
  @m8 @_requested @tgn @_tested @_done @_deprecated
  Scenario: When you are loged in as an agent, you should be able to request a category, this should be done via a form mail. to admin@fairleads.com the form should contain the following fields
#    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
#    Then I sign in as bob@person.com with password supersecret
#    And I go to browse leads
#    And I follow translated "layout.main_menu.shared.category_request"
#    And the "email_template_preview_email_from" field should contain "bob@person.com"
#    Then I fill in "email_template_preview_email_from" with "agent@nbs.com"
#    And I fill in "email_template_preview_phone_number" with "+41 321443934303934"
#    And I fill in "email_template_preview_category_name" with "Computers"
#    And I fill in "email_template_preview_lead_description" with "This leads would be about computer devices"
#    And I fill in "email_template_preview_leads_count_per_month" with "21"
#    And I check "email_template_preview_can_be_contacted"
#    And I press translated "contact_us.new.view.send_email_button"
#    And last email sent should have been sent to recipient "admin@fairleads.com"
#    And I should be on agent home

  @m8b @_requested @tgn @_tested @_done
  Scenario: When you are loged in as a buyer, you should be able to request a category, this should be done via a form mail. to admin@fairleads.com the form should contain the following fields
    Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
    Then I sign in as bob@person.com with password supersecret
    And I go to browse leads
    And I follow translated "layout.main_menu.shared.category_request"
    And the "email_template_preview_email_from" field should contain "bob@person.com"
    Then I fill in "email_template_preview_email_from" with "agent@nbs.com"
    And I fill in "email_template_preview_phone_number" with "+41 321443934303934"
    And I fill in "email_template_preview_category_name" with "Computers"
    And I fill in "email_template_preview_lead_description" with "This leads would be about computer devices"
    And I fill in "email_template_preview_leads_count_per_month" with "21"
    And I check "email_template_preview_can_be_contacted"
    And I press translated "contact_us.new.view.send_email_button"
    And last email sent should have been sent to recipient "admin@fairleads.com"
    And I should be on supplier home

  @m10 @_requested @_done @_tested @tested_elsewhere
  Scenario: I will return to agent/buyer home page after category request is sent