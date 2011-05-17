@lead_certification @agent @requested @m10
Feature: Lead certification for agent

@_done @_tested
Scenario: I can mark a lead as certified
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead BestLead is created by user agent007@nbs.com with role agent
  And I am on the home page
  And I sign in as agent007@nbs.com with password secret
  And I follow translated "layout.main_menu.agent.leads"
  And I really click hidden link by url regex "/agents\/leads\/\d+\/certifications/"
  Then I should see translated "agent.lead_certifications.index.view.sent_successfully"

@_done @_tested
Scenario: When lead is certified then email is sent to lead's contact with confirmation request
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead BestLead is created by user agent007@nbs.com with role agent
  And lead "BestLead" has attributes "email_address:james@bond.co.uk"
  And I am on the home page
  And I sign in as agent007@nbs.com with password secret
  And I follow translated "layout.main_menu.agent.leads"
  And I really click hidden link by url regex "/agents\/leads\/\d+\/certifications/"
  And last email sent should have been sent to recipient "james@bond.co.uk"
  And last email sent should have content "edit?token="

@_done @_tested
Scenario: I can see that the lead I have marked as certified was confirmed by the contact
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead BestLead is created by user agent007@nbs.com with role agent
  And lead "BestLead" has attributes "email_address:james@bond.co.uk"
  And I am on the home page
  And I sign in as agent007@nbs.com with password secret
  And I follow translated "layout.main_menu.agent.leads"
  And I really click hidden link by url regex "/agents\/leads\/\d+\/certifications/"
  Then I should see translated "leads.listing.certification_status"
  And I should see translated "leads.certification.status_0"
  And I sign out
  And I visit certification url for lead "BestLead"
  And I press translated "leads.certification.confirm"
  And I am on the home page
  And I sign in as agent007@nbs.com with password secret
  And I follow translated "layout.main_menu.agent.leads"
  Then I should see translated "leads.listing.certification_status"
  And I should see translated "leads.certification.status_3"