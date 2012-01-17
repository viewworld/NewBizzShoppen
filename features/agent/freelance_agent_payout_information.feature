@user_accounts @$_call_centre @m4 @tgn @faircalls
Feature: Freelance agent payout information

Background:
  Given I visit domain http://faircalls.eu
  And I am on the homepage
  And I make sure current locale is "en"
  And I am signed up and confirmed as user with email agent@person.com and password secret and role agent
  Then I sign in as agent@person.com with password secret

@_done @non_testable
Scenario: Freelance has its Paypal data stored

# SWIFT/BIC + IBAN
# Remember to make these fields protected - we do not wnat anybody to update those without authotization :P
# "Yes, if the agents do not have a pay pal account. They should be able
# to register their international banking details."
@_done @non_testable
Scenario: Freelance agent has its international bank data stored if doesnt have Paypal account

@_tested @_done
Scenario: As an administrator I can allow user freelance agent to change his/hers payout information
  Given I am not sign in
  And I am signed up and confirmed as user with email nbsadmin@person.com and password secret and role admin
  And I sign in as nbsadmin@person.com with password secret
  And I follow translated "layout.main_menu.admin.users"
  Then I fill in "search_with_keyword" with "agent@nbs.com"
  And I press translated "administration.users.index.view.search_button"
  And I follow translated "administration.users.index.view.edit"
  And I check "user_agent_can_edit_payout_information"
  Then I press translated "administration.users.edit.view.button_update_user"
  And I should see translated "administration.users.index.view.title"

# "By default only call centers should be abel to register bank detalis,
# but the admin should also be abel to let freelanceers enter banking
# details."
@_tested @_done
Scenario: I can update my payout information if I am a Freelance Agent and Admin allows me to do so
  Given user agent@person.com with role agent exists with attributes "can_edit_payout_information:true"
  Given I am not sign in
  Then I sign in as agent@person.com with password secret
  Given I go to my profile
  Then I fill in "user_agent_paypal_email" with "agentjim.jones.paypal@nbs.com"
  And I press translated "password.edit.view.button_update_user"
  Then I should see translated "my_profile.update.controller.successful_update_notice"
  Given I go to my profile
  And the "user_agent_paypal_email" field should contain "agentjim.jones.paypal@nbs.com"
  When I fill in "user_agent_paypal_email" with ""
  And I fill in "user_agent_bank_swift_number" with "ABNAPLPW"
  And I fill in "user_agent_bank_iban_number" with "AT123456789012345678"
  And I press translated "password.edit.view.button_update_user"
  Given I go to my profile
  And the "user_agent_bank_swift_number" field should contain "ABNAPLPW"
  And the "user_agent_bank_iban_number" field should contain "AT123456789012345678"
