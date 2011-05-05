@lead_certification @added
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

#periodical rake task
@non_testable
Scenario: When certain period of time passes and the link with lead's confirmation is not visited then another email is sent to lead's contact

Scenario: Once I have confirmed the lead then the link expires and I cannot get access to that lead again