@lead_certification @requested @m10
Feature: Lead certification for guest

Scenario: I can get access to a lead by hashed link without logging in

Scenario: I can edit lead information such as company information, contact information and public description

Scenario: I can confirm certification or cancel

#modal window with invitation
Scenario: When lead is certified by me I am given a choice to create a fairleads account

Scenario: When lead is certified by me I can login through google account and then confirm terms & conditions

Scenario: When lead is certified by me I can login through linkedin account and then confirm terms & conditions

Scenario: When lead is certified by me I can login through facebook account and then confirm terms & conditions

Scenario: When I decide to create new fairleads account I should be redirected to signup where I can specify basic information (email and name are given) and I am created as procurement manager (purchase manager)

Scenario: After signup I can login instantly and do not have to confirm it by email (since it is the same email)

Scenario: I can specify in settings how often send reminder emails to leads

Scenario: I can edit contents of emails that will be sent to lead

Scenario: When lead does not answer to any email then agent should see "Approval time out" information

Scenario: Other users should not see that certification approval timed out

#periodical rake task
@non_testable
Scenario: When certain period of time passes and the link with lead's confirmation is not visited then another email is sent to lead's contact

@non_testable
Scenario: I check perdiodically for confirmations that have not been visited

Scenario: Last visit date is recorded when link is accessed but lead is not confirmed

Scenario: Once I have confirmed the lead then the link expires and I cannot get access to that lead again