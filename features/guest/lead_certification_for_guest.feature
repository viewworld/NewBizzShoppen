@lead_certification @_requested @m10 @faircalls
Feature: Lead certification for guest

Background:
  Given I am on the homepage
  And I visit domain http://faircalls.eu
  Given there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead BestLead is created by user agent007@nbs.com with role agent
  And lead "BestLead" has attributes "email_address:james@bond.co.uk,company_name:JJJ,contact_name:James Bond"

@_done @_tested
Scenario: I can get access to a lead by hashed link without logging in
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I should be on lead edit page for BestLead

@_done @_tested
Scenario: I can edit lead information such as company information, contact information and public description
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I should see CSS path "input#lead_company_name"
  And I should see CSS path "input#lead_contact_name"
  And I should see CSS path "textarea#lead_description"

@_done @_tested @selenium
Scenario: I can confirm certification or cancel
  When lead WorstLead is created by user agent007@nbs.com with role agent
  And lead "WorstLead" has attributes "email_address:james@bond.co.uk"
  And lead "BestLead" certification request is sent
  And lead "WorstLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  Then lead "BestLead" certification status should be "3"
  When I visit certification url for lead "WorstLead"
  And I press translated "leads.certification.reject"
  Then lead "WorstLead" certification status should be "4"

#modal window with invitation
@_tested @tgn @_done
Scenario: When lead is certified by me I am given a choice to create a fairleads account
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  Then I should see translated "certification_accounts.new.view.title"

@_done @non_testable
Scenario: When lead is certified by me I can login through google account and then confirm terms & conditions

@_done @non_testable
Scenario: When lead is certified by me I can login through linkedin account and then confirm terms & conditions

@_done @non_testable
Scenario: When lead is certified by me I can login through facebook account and then confirm terms & conditions

@_done @_tested
Scenario: When I decide to create new fairleads account I should be redirected to signup where I can specify basic information (email and name are given) and I am created as procurement manager (purchase manager)
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  And I should see "E-mail"

@_done @_tested
Scenario: After signup I can login instantly and do not have to confirm it by email (since it is the same email)
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  And I fill in "user_member_password" with "secret"
  And I fill in "user_member_password_confirmation" with "secret"
  And I check "user_member_agreement_read"
  And I press translated "supplier_accounts.new.view.button_create_account"
  And I visit domain http://fairdeals.eu
  And I am on the home page
  And I sign in as james@bond.co.uk with password secret
  Then I should be signed in

@_tested @tgn @_done
Scenario: I can specify in settings how often send reminder emails to leads
  Given I am not sign in
  And I am signed up and confirmed as user with email admin888@nbs.com and password secret and role admin
  And I sign in as admin888@nbs.com with password secret
  And I follow translated "layout.main_menu.admin.global"
  And I fill in "setting_0" with "1500"
  And I fill in "setting_1" with "15"
  And I press translated "administration.settings.edit.view.button_update_settings"

@_done @tested_elsewhere
Scenario: I can edit contents of emails that will be sent to lead

@_tested @tgn @_done
Scenario: When lead does not answer to any email then agent should see "Approval time out" information
  When lead WorstLead is created by user agent007@nbs.com with role agent
  And lead "WorstLead" certification request is sent
  And lead certification request for lead "WorstLead" has expired
  And I go to the homepage
  And I sign in as agent007@nbs.com with password secret
  And I follow translated "layout.main_menu.agent.leads"
  Then I should see translated "leads.certification.status_5"

@_done @non_testable
Scenario: Other users should not see that certification approval timed out

#periodical rake task
@non_testable @_done @tgn
Scenario: When certain period of time passes and the link with lead's confirmation is not visited then another email is sent to lead's contact

@_done @tgn @_tested
Scenario: I check perdiodically for confirmations that have not been approved or rejected
  Given date today is "2011-03-31"
  And class "Settings" method "resend_certification_notification_after_days" returns "4"
  And class "Settings" method "expire_certification_notification_after_days" returns "7"
  When lead WorstLead1 is created by user agent007@nbs.com with role agent
  And lead "WorstLead1" certification request has attributes "created_at:2011-03-27,last_email_sent_at:2011-03-27"
  And lead "WorstLead1" certification status should be "0"
  When lead WorstLead2 is created by user agent007@nbs.com with role agent
  And lead "WorstLead2" certification request has attributes "created_at:2011-03-27,last_email_sent_at:2011-03-27,state:1"
  And lead "WorstLead2" certification status should be "1"
  When lead WorstLead3 is created by user agent007@nbs.com with role agent
  And lead "WorstLead3" certification request has attributes "created_at:2011-03-24,last_email_sent_at:2011-03-24,state:2"
  And lead "WorstLead3" certification status should be "2"
  When lead WorstLead4 is created by user agent007@nbs.com with role agent
  And lead "WorstLead4" certification request has attributes "created_at:2011-03-30,last_email_sent_at:2011-03-30,state:1"
  And lead "WorstLead4" certification status should be "1"
  And lead certification request for lead "WorstLead1" has its state updated
  And last email sent should have subject "Certification request reminder"
  And lead "WorstLead1" certification status should be "1"
  And lead certification request for lead "WorstLead2" has its state updated
  And last email sent should have subject "Certification request reminder"
  And lead "WorstLead2" certification status should be "2"
  And lead certification request for lead "WorstLead3" has its state updated
  And lead "WorstLead3" certification status should be "5"
  And lead certification request for lead "WorstLead4" has its state updated
  And lead "WorstLead4" certification status should be "1"

@_tested @_done
Scenario: Last visit date is recorded when link is accessed but lead is not confirmed
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead" on "2000-01-01"
  Then last certification visit for lead "BestLead" should be on "2000-01-01"
  When I visit certification url for lead "BestLead"
  Then last certification visit for lead "BestLead" should be today

@_done @_tested
Scenario: Once I have confirmed the lead then the link expires and I cannot get access to that lead again
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I should be on lead edit page for BestLead
  When lead "BestLead" is certified
  And I visit certification url for lead "BestLead"
  Then I should see translated "leads.certification.invalid_token"

#5771
# address, first name, last name
@m11 @_requested @tgn @_done @_tested
Scenario: All my account information should be populated from lead
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  And I fill in "user_member_password" with "secret"
  And I fill in "user_member_password_confirmation" with "secret"
  And I check "user_member_agreement_read"
  And I press translated "supplier_accounts.new.view.button_create_account"
  Then user "james@bond.co.uk" has profile copied from lead "BestLead"

#5771
# to make it unique for example "first_name last_name (email_address)"
@m11 @_requested @tgn @tested_elsewhere @_done
Scenario: Screen name should be automatically generated

#5771
# they should be populated from lead
@m11 @_requested @tgn @_tested @_done
Scenario: I should not see fields for address, names etc
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  And I should not see "Address line 1"
  #And I should not see "City"
  And I should not see "Screen name"
  And I should not see "First name"
  And I should not see "Last name"

#5771
@m11 @_requested @is @_done @_non_testable
Scenario: I should see icons for Facebook/Linkedin/Google sign in

#5771
# blurb saying "use google/linkedin/facebook to sign in or specify an unique password to create fairleads account"
@m11 @_requested @tgn @_tested @_done
Scenario: I can see a blurb on the top of the page
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  Then I should see "Blurb certification member signup"
