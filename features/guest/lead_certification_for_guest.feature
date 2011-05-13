@lead_certification @requested @m10
Feature: Lead certification for guest

Background:
  Given there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead BestLead is created by user agent007@nbs.com with role agent
  And lead "BestLead" has attributes "email_address:james@bond.co.uk"

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

@_done @_tested
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
Scenario: When lead is certified by me I am given a choice to create a fairleads account

Scenario: When lead is certified by me I can login through google account and then confirm terms & conditions

Scenario: When lead is certified by me I can login through linkedin account and then confirm terms & conditions

Scenario: When lead is certified by me I can login through facebook account and then confirm terms & conditions

@_done @_tested
Scenario: When I decide to create new fairleads account I should be redirected to signup where I can specify basic information (email and name are given) and I am created as procurement manager (purchase manager)
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  Then the "user_purchase_manager_email" field should contain "james@bond.co.uk"

@_done @_tested
Scenario: After signup I can login instantly and do not have to confirm it by email (since it is the same email)
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  And I fill in "user_purchase_manager_address_attributes_address_line_1" with "Downing St"
  And I fill in "user_purchase_manager_address_attributes_zip_code" with "12345"
  And I fill in "user_purchase_manager_screen_name" with "Bond, James Bond"
  And I fill in "user_purchase_manager_password" with "secret"
  And I fill in "user_purchase_manager_password_confirmation" with "secret"
  And I check "user_purchase_manager_agreement_read"
  And I press translated "purchase_manager_accounts.new.view.button_create_account"
  And I am on the home page
  And I sign in as james@bond.co.uk with password secret
  Then I should be signed in

Scenario: I can specify in settings how often send reminder emails to leads

Scenario: I can edit contents of emails that will be sent to lead

Scenario: When lead does not answer to any email then agent should see "Approval time out" information

Scenario: Other users should not see that certification approval timed out

#periodical rake task
@non_testable
Scenario: When certain period of time passes and the link with lead's confirmation is not visited then another email is sent to lead's contact

@non_testable
Scenario: I check perdiodically for confirmations that have not been visited

@wip
Scenario: Last visit date is recorded when link is accessed but lead is not confirmed
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead" on "2000-01-01"
  Then last certification visit should be on "2000-01-01"
  When I visit certification url for lead "BestLead"
  Then last certification visit should be today

@_done @_tested
Scenario: Once I have confirmed the lead then the link expires and I cannot get access to that lead again
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I should be on lead edit page for BestLead
  When lead "BestLead" is certified
  And I visit certification url for lead "BestLead"
  Then I should see translated "leads.certification.invalid_token"

