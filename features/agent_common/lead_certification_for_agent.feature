@lead_certification @agent @requested @m10 @faircalls
Feature: Lead certification for agent

Background:
  Given I am on the homepage
  And I visit domain http://faircalls.eu

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

# 5770
# put this button next to others on new lead form, when clicked a certification request should be sent
@m11 @requested @tgn @selenium @_tested @_done
Scenario: When creating a new lead I can click "Create and certify"
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
  And I am on the homepage
  And I visit domain http://faircalls.eu
  And I make sure current locale is "en"
  Then I sign in as bob@person.com with password supersecret
  And I go to agents leads
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_email_address" with "kowalski@person.com"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "agent.leads.new.view.button_create_and_certify"
  And last email sent should have been sent to recipient "kowalski@person.com"
  Then I am not sign in
  Given I am signed up and confirmed as user with email bob_cca@person.com and password supersecret and role call_centre_agent
  And I have user with email cc001@person.com and role call_centre
  And an user with role call_centre_agent and email bob_cca@person.com belongs to call centre cc001@person.com
  And I go to the homepage
  And I make sure current locale is "en"
  Then I sign in as bob_cca@person.com with password supersecret
  And I follow translated "layout.main_menu.call_centre_agent.leads"
  And I select "Test category 1" from "category_id"
  And I follow translated "call_centre_agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_email_address" with "kowalski1@person.com"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "call_centre_agent.leads.new.view.button_create_and_certify"
  And last email sent should have been sent to recipient "kowalski1@person.com"

 @m11 @added @ao @_done @_tested @selenium
 Scenario: Contact email should be obligatory when I click "Create & certify"
  Given I am signed up and confirmed as user with email bob@person.com and password supersecret and role agent
  And I am on the homepage
  And I make sure current locale is "en"
  Then I sign in as bob@person.com with password supersecret
  And I go to agents leads
  Given Category Test category 1 is created
  And I go to agents leads
  And I select "Test category 1" from "category_id"
  And I follow translated "agent.leads.index.view.new_lead"
  And I fill in "lead_header" with "This lead wants to buy 100 printers this month"
  And I fill in "lead_description" with "Lorem ipsum"
  And I fill in "lead_hidden_description" with "Lorem ipsum hidden"
  And I fill in "lead_purchase_value" with "10000"
  And I fill in "lead_price" with "100"
  And I select "3" from "lead_sale_limit"
  And I select "Denmark" from "lead_country_id"
  And I fill in "lead_company_name" with "Printing company"
  And I fill in "lead_contact_name" with "Marek Kowalski"
  And I fill in "lead_phone_number" with "123456789"
  And I fill in "lead_address_line_1" with "Kaminskiego 19"
  And I fill in "lead_address_line_3" with "Bielsko-Biała"
  And I fill in "lead_zip_code" with "23-2911"
  And I fill in "datepicker" with date that is "5" days from now
  And I press translated "agent.leads.new.view.button_create_and_certify"
  Then I should see translated "activerecord.errors.messages.blank"
  When I fill in "lead_email_address" with "kowalski@person.com"
  And I press translated "agent.leads.new.view.button_create_and_certify"
  And last email sent should have been sent to recipient "kowalski@person.com"

# 5769
@m11 @requested @is @_done @_tested
Scenario: I should see "Recertify" button when Lead's contact email changes and certification request has benn already sent
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  And lead BestLead is created by user agent007@nbs.com with role agent
  And lead "BestLead" has attributes "email_address:john@rambo.fake"
  And I am on the home page
  And I sign in as agent007@nbs.com with password secret
  And I follow translated "layout.main_menu.agent.leads"
  When lead "BestLead" certification request is sent
  When lead "BestLead" has attributes "email_address:bad@guy.fake"
  And I follow translated "layout.main_menu.agent.leads"
  Then I should not see translated "agent.leads.index.view.certify"
  Then I should see translated "agent.leads.index.view.recertify"
  Then I follow translated "agent.leads.index.view.recertify"
  Then I should see translated "agent.lead_certifications.index.view.sent_successfully"

# 5765
@m11 @requested @tgn @_tested @_done
Scenario: I can edit "Hidden description" and "Purchase decision date"
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  Given lead BestLead is created by user agent007@nbs.com with role agent
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I fill in "lead_hidden_description" with "sample description"
  Then I fill in "datepicker" with "01-01-2011"

# 5765
@m11 @requested @tgn @_tested @_done
Scenario: I can't see "Sales information", "Price", "Currency", "Category", "Country" and "Public Header"
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  Given lead BestLead is created by user agent007@nbs.com with role agent
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I should not see translated "formtastic.labels.lead.sale_limit"
  Then I should not see translated "formtastic.labels.lead.price"
  Then I should not see translated "formtastic.labels.lead.currency_id"
  Then I should not see translated "formtastic.labels.lead.category_id"
  Then I should not see translated "formtastic.labels.lead.country_id"
  Then I should not see translated "formtastic.labels.lead.header"

# 5765
# rename "Lead information" to "Procurement information", "Editing lead" to  "Certify information"
# and "Certification" link to "Certify"
# and add blurb text to /leads/1/edit page
@m11 @requested @tgn @_done @_tested
Scenario: I can see blurb, "Procurement information", "Certify information" and "Certify" link
  When there are no leads
  And I am signed up and confirmed as user with email agent007@nbs.com and password secret and role agent
  Given lead BestLead is created by user agent007@nbs.com with role agent
  When lead "BestLead" certification request is sent
  And I visit certification url for lead "BestLead"
  Then I should see translated "leads.certification.header"
  And I should see translated "leads.certification.member_information"
  And I should see "Blurb certify information"
  Given I am not sign in
  When there are no leads
  Given lead BestLead is created by user agent007@nbs.com with role agent
  And I sign in as agent007@nbs.com with password secret
  And I go to agents leads
  And I follow translated "agent.leads.index.view.certify"
