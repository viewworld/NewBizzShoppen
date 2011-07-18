@m16 @generating_leals @required @_deals @$_procurement_manager
Feature: Generating leads from deals

  Scenario: Lead category is set by default when deal is generated by sales manager

  Scenario: Lead category can be selected when deal is generated by admin/call centre/agent

  Scenario: A public header should be set to "A company is interested in" + short description

  Scenario: A public description should be set to "A company is interested in" + short description

  # The hidden description: is the note field from the “request information” which is field out by the procurement manager
  Scenario: A hidden description field should be set to the note field from "request information"

  Scenario: Company and contact information should be set to procurement manager information

  Scenario: Lead creator is set to "Deal admin" if deal was created by sales manager or admin

  Scenario: Lead creator is set to callcentre/agent is deal was created by callcentre/agent

  Scenario: Lead price is set to 0 unless specified otherwise in the deal setup by admin, call center or agent

  Scenario: Purchase decision date for lead is the expire time for deal + 7 days

  Scenario: Sales limit should be set to 1

  # Step one: Please make sure your information is correct. (Validate company and contact information) Including linking to face book and LinkedIn.
  Scenario: In first step I can confirm the lead information

  # If there is any template information associated with the deal the procurement manager is prompted for the information. And the procurement manager can enter some note information (will go into hidden description)
  Scenario: In step two I can enter template information and note (will go into hidden description)

  # A confirmation page that we have received the contact request, and that we will be in touch ASAP. When the procurement manager clicks ok he is redirected to the procurement mananger homepage
  Scenario: In step three I can see a confirmation page and I am redirected to procuemenrent homepage when I click OK

