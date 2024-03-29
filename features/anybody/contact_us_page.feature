@contact_us @m3 @tgn
Feature: Contact Us page

Background:
  Given I make sure current locale is "en"
  And I am on the homepage

@_tested @_done
Scenario: I can display contact us page
  Given I go to contact us
  Then I should see translated "contact_us.new.view.header"

@_tested @_done
Scenario: I can choose enquiry type
  Given I go to contact us
  Then I choose "email_template_preview_subject_agent_inquiry"

@_tested @_done
Scenario: I have to fill in my email address
  Given I go to contact us
  Then I choose "email_template_preview_subject_agent_inquiry"
  And I fill in "email_template_preview_email_from" with ""
  And I fill in "email_template_preview_body" with "My question pertains to the manner in which orders are invoiced..."
  And I press translated "contact_us.new.view.send_email_button"
  Then I should see translated "activerecord.errors.messages.blank"

@_tested @_done
Scenario: If I am logged in, my email address is alredy filled in
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role supplier
  Then I sign in as bob@person.com with password supersecret
  Given I go to contact us
  Then the "email_template_preview_email_from" field should contain "bob@person.com"

@_tested @_done
Scenario: I can fill in message content and send message to NBS
  Given I go to contact us
  Then I choose "email_template_preview_subject_agent_inquiry"
  And I fill in "email_template_preview_email_from" with "thomas.norden@person.com"
  And I fill in "email_template_preview_body" with "My question pertains to the manner in which orders are invoiced..."
  And I press translated "contact_us.new.view.send_email_button"
  Then I should see translated "contact_us.create.flash.email_sent_successfully"