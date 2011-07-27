@m16 @requested @agent_deals @_deals @$_call_centre @$_agent
Feature: Deals from Call Centre/Agent perspective

  Background:
    Given I am on the homepage

  @_done @_tested @wip
  Scenario: I can see "My Deals" to the right of "My Leads" tab
    Then user "translator_call_centre@nbs.com" has deal maker role enabled
    And I sign in as translator_call_centre@nbs.com with password secret
    Then I follow translated logout link for translator_call_centre@nbs.com
    Then I should see translated ""
    Then user "translator_call_centre_agent@nbs.com" has deal maker role enabled
    And I sign in as translator_call_centre_agent@nbs.com with password secret
    Then I should see translated ""

  #A test id function which display the company name and contact name for the email for the sales manger which provides the deal
  Scenario: I can create new deal by entering sales manager email

  #the admin/callcenter/agent can create the deal and "certify it" in the same way a lead is certified.
  Scenario: I can create new deal and certify (enter future sales manager's email)

  #(but the deal must sign up sales manager, and will not have the option not to sign up)
  Scenario: The recipient of the certification request email must register as new sales manager

  Scenario: Call centre / agent is set to be the deal admin